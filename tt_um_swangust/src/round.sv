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
    input  wire [ 3:0] SCALE_IN,
    input  wire [11:0] FRAC_IN,
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

    always_comb begin : decode_guard // P=[MUX4] 
        case(SCALE_IN)
            4'h0 : guard = FRAC_IN[4]; //  0, P = SRR8.7654
            4'h1 : guard = FRAC_IN[5]; //  1, P = SRRR.8765
            4'h2 : guard = FRAC_IN[6]; //  2, P = SRRR.R876
            4'h3 : guard = FRAC_IN[7]; //  3, P = SRRR.RR87
            4'h4 : guard = FRAC_IN[8]; //  4, P = SRRR.RRR8
            4'h5 : guard = 0         ; //  5, P = SRRR.RRRR
            4'h6 : guard = 0         ; //  6, P = 0111.1111
            4'h7 : guard = 0         ; //  7, P = 0111.1111
            4'h8 : guard = 0         ; //  8, P = 0000.0000
            4'h9 : guard = 0         ; // -7, P = 0000.0001
            4'hA : guard = 0         ; // -6, P = SRRR.RRRR
            4'hB : guard = FRAC_IN[8]; // -5, P = SRRR.RRR8
            4'hC : guard = FRAC_IN[7]; // -4, P = SRRR.RR87
            4'hD : guard = FRAC_IN[6]; // -3, P = SRRR.R876
            4'hE : guard = FRAC_IN[5]; // -2, P = SRRR.8765
            4'hF : guard = FRAC_IN[4]; // -1, P = SRR8.7654
        endcase
    end

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following block of code calculates the round bit in the GRS rounding teqnique. The 
     * round bit is the MSB of the not-representable fraction. Example, if you had the number A=
     * 4'b0001 and you needed it to represent it as a 3 bit number starting with the MSB of A, 
     * the remaining 1 from A would be the round bit. 
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    reg round;

    always_comb begin : decode_round // P=[MUX4] 
        case(SCALE_IN)
            4'h0 : round = FRAC_IN[3]; //  0, P = SRR8.7654
            4'h1 : round = FRAC_IN[4]; //  1, P = SRRR.8765
            4'h2 : round = FRAC_IN[5]; //  2, P = SRRR.R876
            4'h3 : round = FRAC_IN[6]; //  3, P = SRRR.RR87
            4'h4 : round = FRAC_IN[7]; //  4, P = SRRR.RRR8
            4'h5 : round = FRAC_IN[8]; //  5, P = SRRR.RRRR
            4'h6 : round = 0         ; //  6, P = 0111.1111
            4'h7 : round = 0         ; //  7, P = 0111.1111
            4'h8 : round = 0         ; //  8, P = 0000.0000
            4'h9 : round = 0         ; // -7, P = 0000.0001
            4'hA : round = FRAC_IN[8]; // -6, P = SRRR.RRRR
            4'hB : round = FRAC_IN[7]; // -5, P = SRRR.RRR8
            4'hC : round = FRAC_IN[6]; // -4, P = SRRR.RR87
            4'hD : round = FRAC_IN[5]; // -3, P = SRRR.R876
            4'hE : round = FRAC_IN[4]; // -2, P = SRRR.8765
            4'hF : round = FRAC_IN[3]; // -1, P = SRR8.7654
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
            4'h0 : sticky = |(FRAC_IN[2:0]); //  0, P = SRR8.7654
            4'h1 : sticky = |(FRAC_IN[3:0]); //  1, P = SRRR.8765
            4'h2 : sticky = |(FRAC_IN[4:0]); //  2, P = SRRR.R876
            4'h3 : sticky = |(FRAC_IN[5:0]); //  3, P = SRRR.RR87
            4'h4 : sticky = |(FRAC_IN[6:0]); //  4, P = SRRR.RRR8
            4'h5 : sticky = |(FRAC_IN[7:0]); //  5, P = SRRR.RRRR
            4'h6 : sticky = 0              ; //  6, P = 0111.1111
            4'h7 : sticky = 0              ; //  7, P = 0111.1111
            4'h8 : sticky = 0              ; //  8, P = 0000.0000
            4'h9 : sticky = 0              ; // -7, P = 0000.0001
            4'hA : sticky = |(FRAC_IN[7:0]); // -6, P = SRRR.RRRR
            4'hB : sticky = |(FRAC_IN[6:0]); // -5, P = SRRR.RRR8
            4'hC : sticky = |(FRAC_IN[5:0]); // -4, P = SRRR.RR87
            4'hD : sticky = |(FRAC_IN[4:0]); // -3, P = SRRR.R876
            4'hE : sticky = |(FRAC_IN[3:0]); // -2, P = SRRR.8765
            4'hF : sticky = |(FRAC_IN[2:0]); // -1, P = SRR8.7654
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
    
    generate

        /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
         * Note this costs more logic to do, but is faster. Also since its adding constants, it might
         * be less logic than doing 6 RCA.
         * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
        if(SPEED) begin : G_SPD
            wire [6:0] frac_sum01;
            wire [6:0] frac_sum02;
            wire [6:0] frac_sum04;
            wire [6:0] frac_sum08;
            wire [6:0] frac_sum10;
            wire [6:0] frac_sum20;

            assign frac_sum01 = FRAC_IN[8:3] + 6'h01; // P=[ADD6]
            assign frac_sum02 = FRAC_IN[8:3] + 6'h02; // P=[ADD6]
            assign frac_sum04 = FRAC_IN[8:3] + 6'h04; // P=[ADD6]
            assign frac_sum08 = FRAC_IN[8:3] + 6'h08; // P=[ADD6]
            assign frac_sum10 = FRAC_IN[8:3] + 6'h10; // P=[ADD6]
            assign frac_sum20 = FRAC_IN[8:3] + 6'h20; // P=[ADD6]
            
            always_comb begin : gen_grs_value // P=[ADD6, MUX5] Note, [ADD6]>[MUX4, AND, OR]
                case(SCALE_IN)
                    4'h0 : frac_rounded = grs_bit ? frac_sum01[6:1] : {1'b0, FRAC_IN[8:4]}; //  0, P = SRR8.7654
                    4'h1 : frac_rounded = grs_bit ? frac_sum02[6:1] : {1'b0, FRAC_IN[8:4]}; //  1, P = SRRR.8765
                    4'h2 : frac_rounded = grs_bit ? frac_sum04[6:1] : {1'b0, FRAC_IN[8:4]}; //  2, P = SRRR.R876
                    4'h3 : frac_rounded = grs_bit ? frac_sum08[6:1] : {1'b0, FRAC_IN[8:4]}; //  3, P = SRRR.RR87
                    4'h4 : frac_rounded = grs_bit ? frac_sum10[6:1] : {1'b0, FRAC_IN[8:4]}; //  4, P = SRRR.RRR8
                    4'h5 : frac_rounded = grs_bit ? frac_sum20[6:1] : {1'b0, FRAC_IN[8:4]}; //  5, P = SRRR.RRRR
                    4'h6 : frac_rounded =                             {1'b0, FRAC_IN[8:4]}; //  6, P = 0111.1111
                    4'h7 : frac_rounded =                             {1'b0, FRAC_IN[8:4]}; //  7, P = 0111.1111
                    4'h8 : frac_rounded =                             {1'b0, FRAC_IN[8:4]}; //  8, P = 0000.0000
                    4'h9 : frac_rounded =                             {1'b0, FRAC_IN[8:4]}; // -7, P = 0000.0001
                    4'hA : frac_rounded = grs_bit ? frac_sum20[6:1] : {1'b0, FRAC_IN[8:4]}; // -6, P = SRRR.RRRR
                    4'hB : frac_rounded = grs_bit ? frac_sum10[6:1] : {1'b0, FRAC_IN[8:4]}; // -5, P = SRRR.RRR8
                    4'hC : frac_rounded = grs_bit ? frac_sum08[6:1] : {1'b0, FRAC_IN[8:4]}; // -4, P = SRRR.RR87
                    4'hD : frac_rounded = grs_bit ? frac_sum04[6:1] : {1'b0, FRAC_IN[8:4]}; // -3, P = SRRR.R876
                    4'hE : frac_rounded = grs_bit ? frac_sum02[6:1] : {1'b0, FRAC_IN[8:4]}; // -2, P = SRRR.8765
                    4'hF : frac_rounded = grs_bit ? frac_sum01[6:1] : {1'b0, FRAC_IN[8:4]}; // -1, P = SRR8.7654
                endcase
            end

        end else begin : G_SLW
            
            /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
             * The following code calculates the alignment of the rounding value assuming that rounding
             * will occour. A 1 bit should be placed at the LSB of the representable fraction.
             * Example : if you have the number 2.2 unsigned FXP number and you wanted to represent it as
             * a 3 bit unsigned integer, the bits would be [XG.RS]. In this example 2.5=10.10, would not 
             * be rounded, 2.5 + 0 = 10.10 + 00.00 = 2.5. However, 2.75=10.11 would be rounded 2.5 + 1 = 
             * 10.11 + 01.00 = 11.11 = 3.75 (and then truncated down to 3).
             * 
             * TODO might be possible to do a 2's compliment and a 3bit shift. might be bettter than 4 mux
             * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
            reg  [5:0] grs_mid;

            always_comb begin : gen_grs_value  // P=[MUX4] 
                case(SCALE_IN)
                    4'h0 : grs_mid = 6'h01; //  0, P = SRR8.7654
                    4'h1 : grs_mid = 6'h02; //  1, P = SRRR.8765
                    4'h2 : grs_mid = 6'h04; //  2, P = SRRR.R876
                    4'h3 : grs_mid = 6'h08; //  3, P = SRRR.RR87
                    4'h4 : grs_mid = 6'h10; //  4, P = SRRR.RRR8
                    4'h5 : grs_mid = 6'h20; //  5, P = SRRR.RRRR
                    4'h6 : grs_mid = 6'h00; //  6, P = 0111.1111
                    4'h7 : grs_mid = 6'h00; //  7, P = 0111.1111
                    4'h8 : grs_mid = 6'h00; //  8, P = 0000.0000
                    4'h9 : grs_mid = 6'h00; // -7, P = 0000.0001
                    4'hA : grs_mid = 6'h20; // -6, P = SRRR.RRRR
                    4'hB : grs_mid = 6'h10; // -5, P = SRRR.RRR8
                    4'hC : grs_mid = 6'h08; // -4, P = SRRR.RR87
                    4'hD : grs_mid = 6'h04; // -3, P = SRRR.R876
                    4'hE : grs_mid = 6'h02; // -2, P = SRRR.8765
                    4'hF : grs_mid = 6'h01; // -1, P = SRR8.7654
                endcase
            end

            wire [6:0] frac_sum;

            ADD #(.WIDTH(6), .TYPE("RCA")) add_round (.A(FRAC_IN[8:3]), .B(grs_mid), .SUM(frac_sum[5:0]), .C(frac_sum[6])); // P=[MUX4, ADD6]
            
            assign frac_rounded = grs_bit ? frac_sum[6:1] : {1'b0, FRAC_IN[8:4]}; // P=[MUX4, ADD6, MUX1]

        end
    endgenerate
    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following code assumes that the scale increases. Then this result is muxed with the
     * result from the adding the rounding bit to the fraction. This allows for the critical path
     * to be shorter, and the logic to be simplified (always assuming +1).
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire [3:0] scale_rounded;

    generate
        if(USE_CONST) begin : G_C1A
            assign scale_rounded =  frac_rounded[5] ? SCALE_IN+1 : SCALE_IN; // P=[ADD6, MUX5, MUX1]
        end else begin : G_C0A
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
            4'h0 : posit_r = {2'b10,      frac_rescaled[4:0]}; //  0, P = SRR4.3210
            4'h1 : posit_r = {3'b110,     frac_rescaled[4:1]}; //  1, P = SRRR.4321
            4'h2 : posit_r = {4'b111_0,   frac_rescaled[4:2]}; //  2, P = SRRR.R432
            4'h3 : posit_r = {5'b111_10,  frac_rescaled[4:3]}; //  3, P = SRRR.RR43
            4'h4 : posit_r = {6'b111_110, frac_rescaled[4  ]}; //  4, P = SRRR.RRR4
            4'h5 : posit_r =  7'b111_1110;
            4'h6 : posit_r =  7'b111_1111;
            4'h7 : posit_r =  7'b111_1111;
            4'h8 : posit_r =  7'b000_0000;
            4'h9 : posit_r =  7'b000_0000;
            4'hA : posit_r =  7'b000_0001;
            4'hB : posit_r = {6'b000_001, frac_rescaled[4  ]}; // -5, P = SRRR.RRR4
            4'hC : posit_r = {5'b000_01,  frac_rescaled[4:3]}; // -4, P = SRRR.RR43
            4'hD : posit_r = {4'b000_1,   frac_rescaled[4:2]}; // -3, P = SRRR.R432
            4'hE : posit_r = {3'b001,     frac_rescaled[4:1]}; // -2, P = SRRR.4321
            4'hF : posit_r = {2'b01,      frac_rescaled[4:0]}; // -1, P = SRR4.3210
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
        if(USE_CONST) begin : G_C1B
            assign POSIT_OUT = SIGN ? (~posit_w)+1 : posit_w; // P=[ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
        end else begin : G_C0B
            wire [7:0] posit_c;
            ADD #(.WIDTH(8), .TYPE("RCA"), .ADD1(1)) posit_comp (.A(~posit_w), .B(8'd1), .SUM(posit_c), .C());// P=[ADD6, MUX5, MUX1, MUX4, 2'sCOMP]
            assign POSIT_OUT = SIGN ? posit_c : posit_w;                                                      // P=[ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
        end
    endgenerate

endmodule
