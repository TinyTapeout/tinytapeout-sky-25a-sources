`timescale 1ns / 1ps
/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 08/14/2025
 * Module Name: round
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   This module rounds and reconstructs a posit number from the scale in and fractional bits.
 *   Note it requires the input fraction to be positive.
 * Path Length : 
 *   [ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
 * Dependencies:
 *   TODO add Dependencies
 * 
 * Additional Comments: 
 *   This code did not have a dedicated testbench and verification. It was verified in as a 
 *   sub-module of posit8_add.sv. 
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


module round(
    input  wire [ 4:0] SCALE_IN,
    input  wire [12:0] FRAC_IN,
    input  wire SIGN,

    output wire [7:0] POSIT_OUT
    );

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * When adding a constant, its usually more efficient to just use the built in "+" and let
     * the synthesis prune the logic over using any type of adder circuit
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    localparam USE_CONST = 1;
    
    localparam SPEED = 1;
    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following block of code calculates the guard bit in the GRS rounding teqnique. The 
     * guard bit is the LSB of the representable fraction. In the case of our decoded posit, the
     * MSB of the fraction starts on bit 8, and the LSB is dependant on the scale. 
     * Note, some scales have no representable fraction. 5,6,7,-8,-7,-6 are all examples.
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    reg guard;

    always_comb begin : decode_guard // P=[MUX5] 
        case(SCALE_IN)
            5'h00 : guard = FRAC_IN[ 6]; //  0
            5'h01 : guard = FRAC_IN[ 7]; //  1
            5'h02 : guard = FRAC_IN[ 8]; //  2
            5'h03 : guard = FRAC_IN[ 9]; //  3
            5'h04 : guard = FRAC_IN[10]; //  4
            5'h05 : guard = 0          ; //  5
            5'h06 : guard = 0          ; //  6
            5'h07 : guard = 0          ; //  7
            5'h08 : guard = 0          ; //  8
            5'h09 : guard = 0          ; //  9
            5'h0A : guard = 0          ; // 10
            5'h0B : guard = 0          ; // 11
            5'h0C : guard = 0          ; // 12
            5'h0D : guard = 0          ; // 13
            5'h0E : guard = 0          ; // 14
            5'h0F : guard = 0          ; // 15
            5'h10 : guard = 0          ; //-16
            5'h11 : guard = 0          ; //-15
            5'h12 : guard = 0          ; //-14
            5'h13 : guard = 0          ; //-13
            5'h14 : guard = 0          ; //-12
            5'h15 : guard = 0          ; //-11
            5'h16 : guard = 0          ; //-10
            5'h17 : guard = 0          ; // -9
            5'h18 : guard = 0          ; // -8
            5'h19 : guard = 0          ; // -7
            5'h1A : guard = 1          ; // -6 <---- not sure why this gaurd is 1 but <scale=5> is not
            5'h1B : guard = FRAC_IN[10]; // -5
            5'h1C : guard = FRAC_IN[ 9]; // -4
            5'h1D : guard = FRAC_IN[ 8]; // -3
            5'h1E : guard = FRAC_IN[ 7]; // -2
            5'h1F : guard = FRAC_IN[ 6]; // -1
        endcase
    end

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following block of code calculates the round bit in the GRS rounding teqnique. The 
     * round bit is the MSB of the not-representable fraction. Example, if you had the number A=
     * 4'b0001 and you needed it to represent it as a 3 bit number starting with the MSB of A, 
     * the remaining 1 from A would be the round bit. 
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    reg round;

    always_comb begin : decode_round // P=[MUX5] 
        case(SCALE_IN)
            5'h00 : round = FRAC_IN[ 5]; //  0
            5'h01 : round = FRAC_IN[ 6]; //  1
            5'h02 : round = FRAC_IN[ 7]; //  2
            5'h03 : round = FRAC_IN[ 8]; //  3
            5'h04 : round = FRAC_IN[ 9]; //  4
            5'h05 : round = FRAC_IN[10]; //  5
            5'h06 : round = 0          ; //  6
            5'h07 : round = 0          ; //  7
            5'h08 : round = 0          ; //  8
            5'h09 : round = 0          ; //  9
            5'h0A : round = 0          ; // 10
            5'h0B : round = 0          ; // 11
            5'h0C : round = 0          ; // 12
            5'h0D : round = 0          ; // 13
            5'h0E : round = 0          ; // 14
            5'h0F : round = 0          ; // 15
            5'h10 : round = 0          ; //-16
            5'h11 : round = 0          ; //-15
            5'h12 : round = 0          ; //-14
            5'h13 : round = 0          ; //-13
            5'h14 : round = 0          ; //-12
            5'h15 : round = 0          ; //-11
            5'h16 : round = 0          ; //-10
            5'h17 : round = 0          ; // -9
            5'h18 : round = 0          ; // -8
            5'h19 : round = 0          ; // -7
            5'h1A : round = FRAC_IN[10]; // -6
            5'h1B : round = FRAC_IN[ 9]; // -5
            5'h1C : round = FRAC_IN[ 8]; // -4
            5'h1D : round = FRAC_IN[ 7]; // -3
            5'h1E : round = FRAC_IN[ 6]; // -2
            5'h1F : round = FRAC_IN[ 5]; // -1
        endcase
    end

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following block of code calculates the sticky bit in the GRS rounding teqnique. The 
     * sticky bit is the OR of remaining bits of the not-representable after the round bit. 
     * Example : if you have the number 2.2 unsigned FXP number and you wanted to represent it as
     * a 3 bit unsigned integer, the bits would be [XG.RS]. In this example 2.5=10.10, would not 
     * be rounded, and the result would be 2=010. However, 2.75=10.11 would be rounded and become
     * 3=011. 
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    reg sticky;

    always_comb begin : decode_sticky // P=[MUX4] 
        case(SCALE_IN)
            5'h00 : sticky = |(FRAC_IN[4:0]); //  0
            5'h01 : sticky = |(FRAC_IN[5:0]); //  1
            5'h02 : sticky = |(FRAC_IN[6:0]); //  2
            5'h03 : sticky = |(FRAC_IN[7:0]); //  3
            5'h04 : sticky = |(FRAC_IN[8:0]); //  4
            5'h05 : sticky = |(FRAC_IN[9:0]); //  5
            5'h06 : sticky = 0              ; //  6
            5'h07 : sticky = 0              ; //  7
            5'h08 : sticky = 0              ; //  8
            5'h09 : sticky = 0              ; //  9
            5'h0A : sticky = 0              ; // 10
            5'h0B : sticky = 0              ; // 11
            5'h0C : sticky = 0              ; // 12
            5'h0D : sticky = 0              ; // 13
            5'h0E : sticky = 0              ; // 14
            5'h0F : sticky = 0              ; // 15
            5'h10 : sticky = 0              ; //-16
            5'h11 : sticky = 0              ; //-15
            5'h12 : sticky = 0              ; //-14
            5'h13 : sticky = 0              ; //-13
            5'h14 : sticky = 0              ; //-12
            5'h15 : sticky = 0              ; //-11
            5'h16 : sticky = 0              ; //-10
            5'h17 : sticky = 0              ; // -9
            5'h18 : sticky = 0              ; // -8
            5'h19 : sticky = 0              ; // -7
            5'h1A : sticky = |(FRAC_IN[9:0]); // -6
            5'h1B : sticky = |(FRAC_IN[8:0]); // -5
            5'h1C : sticky = |(FRAC_IN[7:0]); // -4
            5'h1D : sticky = |(FRAC_IN[6:0]); // -3
            5'h1E : sticky = |(FRAC_IN[5:0]); // -2
            5'h1F : sticky = |(FRAC_IN[4:0]); // -1
        endcase
    end

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following code a bit if rounding should occour using the GRS rouinding teqnique
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    wire grs_bit;

    assign grs_bit = (guard & round) | (round & sticky);// P=[MUX4, AND, OR]

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following code assumes that roudning occours and adds the grs_value to the fractional.
     * Then the result from the addition is muxed with the calculated GRS bit. This results in 
     * the critical path being shorter since the grs bit is not needed to be computed prior to
     * the addition. 
     * FRAC_IN       <sfxp> 3.9 (but doesn't need it's sign)
     * grs_mid       <ufxp> 0.6
     * frac_sum      <ufxp> 1.6 
     * frac_rounded  <ufxp> 1.5
     * frac_rescaled <ufxp> 0.5
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    logic [5:0] frac_rounded;
    

    wire [6:0] frac_sum01;
    wire [6:0] frac_sum02;
    wire [6:0] frac_sum04;
    wire [6:0] frac_sum08;
    wire [6:0] frac_sum10;
    wire [6:0] frac_sum20;

    assign frac_sum01 = FRAC_IN[10:5] + 6'h01; // P=[ADD6]
    assign frac_sum02 = FRAC_IN[10:5] + 6'h02; // P=[ADD6]
    assign frac_sum04 = FRAC_IN[10:5] + 6'h04; // P=[ADD6]
    assign frac_sum08 = FRAC_IN[10:5] + 6'h08; // P=[ADD6]
    assign frac_sum10 = FRAC_IN[10:5] + 6'h10; // P=[ADD6]
    assign frac_sum20 = FRAC_IN[10:5] + 6'h20; // P=[ADD6]
    
    always_comb begin : gen_grs_value // P=[ADD6, MUX5] Note, [ADD6]>[MUX4, AND, OR]
        case(SCALE_IN)
            5'h00 : frac_rounded = grs_bit ? frac_sum01[6:1] : {1'b0, FRAC_IN[10:6]}; //  0
            5'h01 : frac_rounded = grs_bit ? frac_sum02[6:1] : {1'b0, FRAC_IN[10:6]}; //  1
            5'h02 : frac_rounded = grs_bit ? frac_sum04[6:1] : {1'b0, FRAC_IN[10:6]}; //  2
            5'h03 : frac_rounded = grs_bit ? frac_sum08[6:1] : {1'b0, FRAC_IN[10:6]}; //  3
            5'h04 : frac_rounded = grs_bit ? frac_sum10[6:1] : {1'b0, FRAC_IN[10:6]}; //  4
            5'h05 : frac_rounded = grs_bit ? frac_sum20[6:1] : {1'b0, FRAC_IN[10:6]}; //  5
            5'h06 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //  6
            5'h07 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //  7
            5'h08 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //  8
            5'h09 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //  9
            5'h0A : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; // 10
            5'h0B : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; // 11
            5'h0C : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; // 12
            5'h0D : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; // 13
            5'h0E : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; // 14
            5'h0F : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; // 15
            5'h10 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //-16
            5'h11 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //-15
            5'h12 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //-14
            5'h13 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //-13
            5'h14 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //-12
            5'h15 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //-11
            5'h16 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; //-10
            5'h17 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; // -9
            5'h18 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; // -8
            5'h19 : frac_rounded =                             {1'b0, FRAC_IN[10:6]}; // -7
            5'h1A : frac_rounded = grs_bit ? frac_sum20[6:1] : {1'b0, FRAC_IN[10:6]}; // -6
            5'h1B : frac_rounded = grs_bit ? frac_sum10[6:1] : {1'b0, FRAC_IN[10:6]}; // -5
            5'h1C : frac_rounded = grs_bit ? frac_sum08[6:1] : {1'b0, FRAC_IN[10:6]}; // -4
            5'h1D : frac_rounded = grs_bit ? frac_sum04[6:1] : {1'b0, FRAC_IN[10:6]}; // -3
            5'h1E : frac_rounded = grs_bit ? frac_sum02[6:1] : {1'b0, FRAC_IN[10:6]}; // -2
            5'h1F : frac_rounded = grs_bit ? frac_sum01[6:1] : {1'b0, FRAC_IN[10:6]}; // -1
        endcase
    end

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following code assumes that the scale increases. Then this result is muxed with the
     * result from the adding the rounding bit to the fraction. This allows for the critical path
     * to be shorter, and the logic to be simplified (always assuming +1).
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire [4:0] scale_rounded;

    generate
        if(USE_CONST) begin : G_CNST1A
            assign scale_rounded =  frac_rounded[5] ? SCALE_IN+1 : SCALE_IN; // P=[ADD6, MUX5, MUX1]
        end else begin : G_CNST0A
            wire [3:0] scale_sum;
            ADD #(.WIDTH(4 ), .TYPE("RCA")) add_scale (.A(SCALE_IN), .B(4'b0001), .SUM(scale_sum), .C()); // P=[ADD4]
            assign scale_rounded =  frac_rounded[5] ? scale_sum : SCALE_IN;                               // P=[ADD6, MUX5, MUX1]
        end
    endgenerate

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following code realigns the fractional bits in the case that the scale increases.
     * 
     * PATH = 4 MUX + SUM + MUX + MUX
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire [4:0] frac_rescaled;

    assign frac_rescaled = frac_rounded[5] ? {1'b0, frac_rounded[4:1]} :  frac_rounded[4:0]; // P=[ADD6, MUX5, MUX1]

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * This code reconstructs the posit based on the scale and the calculated fraction
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    reg  [6:0] posit_r;
    wire [7:0] posit_w;
    
    always_comb begin : decode_posit // P=[ADD6, MUX5, MUX1, MUX4]
        case(scale_rounded)
            5'h00 : posit_r = {2'b10,      frac_rescaled[4:0]}; //  0
            5'h01 : posit_r = {3'b110,     frac_rescaled[4:1]}; //  1
            5'h02 : posit_r = {4'b111_0,   frac_rescaled[4:2]}; //  2
            5'h03 : posit_r = {5'b111_10,  frac_rescaled[4:3]}; //  3
            5'h04 : posit_r = {6'b111_110, frac_rescaled[4  ]}; //  4
            5'h05 : posit_r =  7'b111_1110                    ; //  5
            5'h06 : posit_r =  7'b111_1111                    ; //  6
            5'h07 : posit_r =  7'b111_1111                    ; //  7
            5'h08 : posit_r =  7'b111_1111                    ; //  8
            5'h09 : posit_r =  7'b111_1111                    ; //  9
            5'h0A : posit_r =  7'b111_1111                    ; // 10
            5'h0B : posit_r =  7'b111_1111                    ; // 11
            5'h0C : posit_r =  7'b111_1111                    ; // 12
            5'h0D : posit_r =  7'b111_1111                    ; // 13
            5'h0E : posit_r =  7'b111_1111                    ; // 14
            5'h0F : posit_r =  7'b111_1111                    ; // 15
            5'h10 : posit_r =  7'b000_0001                    ; //-16
            5'h11 : posit_r =  7'b000_0001                    ; //-15
            5'h12 : posit_r =  7'b000_0001                    ; //-14
            5'h13 : posit_r =  7'b000_0001                    ; //-13
            5'h14 : posit_r =  7'b000_0001                    ; //-12
            5'h15 : posit_r =  7'b000_0001                    ; //-11
            5'h16 : posit_r =  7'b000_0001                    ; //-10
            5'h17 : posit_r =  7'b000_0001                    ; // -9
            5'h18 : posit_r =  7'b000_0001                    ; // -8
            5'h19 : posit_r =  7'b000_0001                    ; // -7
            5'h1A : posit_r =  7'b000_0001                    ; // -6
            5'h1B : posit_r = {6'b000_001, frac_rescaled[4  ]}; // -5
            5'h1C : posit_r = {5'b000_01,  frac_rescaled[4:3]}; // -4
            5'h1D : posit_r = {4'b000_1,   frac_rescaled[4:2]}; // -3
            5'h1E : posit_r = {3'b001,     frac_rescaled[4:1]}; // -2
            5'h1F : posit_r = {2'b01,      frac_rescaled[4:0]}; // -1
        endcase
    end
    assign posit_w = {1'b0, posit_r};

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * This code computes the two's compliment of the calculated posit. Note, throughout this 
     * calculation the posit was assumed to be fraction was assumed to be positive because the
     * math was easier. In future versions, it would be better to write logic which can do all
     * operations with negative values and not require a two's compliment at the end.
     * Also do a check if the fraction in was 0, if its 0, the output should be 0.
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    
    generate
        if(USE_CONST) begin : G_CNST1B
            assign POSIT_OUT = SIGN ? (~posit_w)+1 : posit_w; // P=[ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
        end else begin : G_CNST0B
            wire [7:0] posit_c;
            ADD #(.WIDTH(8), .TYPE("RCA"), .ADD1(1)) posit_comp (.A(~posit_w), .B(8'd1), .SUM(posit_c), .C());// P=[ADD6, MUX5, MUX1, MUX4, 2'sCOMP]
            assign POSIT_OUT = SIGN ? posit_c : posit_w;                                                      // P=[ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
        end
    endgenerate

endmodule
