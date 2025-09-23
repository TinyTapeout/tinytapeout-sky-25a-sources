`timescale 1ns / 1ps
/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 08/14/2025
 * Module Name: rescale
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   This module takes a fraction and scale in, and bit shifts the fraction and updates the scale
 *   such that the number is a <ufxp>2.9 with the most significant 1 in the bit[9]. 
 * Path Length : 
 *    [2sCOMP, MUX1, OR4, MUX1, MUX2, ADD4, MUX1]
 * Dependencies:
 *   TODO add Dependencies
 * 
 * Additional Comments: 
 *   This code was tested with the tb_rescale.sv, then visually inspected for correctness. It's 
 *   ultimate verification happens in the posit8_add.sv test. 
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
module rescale(
    input  wire [ 3:0] SCALE_IN,
    input  wire [11:0] FRAC_IN,

    
    output wire [ 3:0] SCALE_OUT,
    output wire [11:0] FRAC_OUT,
    output wire S
    );

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * When adding a constant, its usually more efficient to just use the built in "+" and let
     * the synthesis prune the logic over using any type of adder circuit
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    localparam USE_CONST = 1;

    assign S = FRAC_IN[11];

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * The following block of code calcualtes the 2's compliment to the input fraction. This
     * makes finding the MSB easier beacuse it is always going to be the 1 in the MSB place. 
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire [10:0] frac_pos; 

    generate
        if(USE_CONST) begin : G_C1A
            assign frac_pos = S ? (~FRAC_IN[10:0]) + 1 : FRAC_IN[10:0]; // P=[2sCOMP, MUX1]
        end else begin : G_C0A
            wire [10:0] frac_comp;
            ADD #(.WIDTH(11), .TYPE("RCA"), .ADD1(1)) posit_comp (.A(~(FRAC_IN[10:0])), .B(11'd1), .SUM(frac_comp), .C()); // P=[2sCOMP]
            assign frac_pos = S ? frac_comp : FRAC_IN[10:0];                                                               // P=[2sCOMP, MUX1]
        end
    endgenerate

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Stage 1
     * This code will return figure out if there exists a 1 in the top half of bits. 
     * 
     *     1st           2nd
     * [ A 9 8 7 ] | [ 6 5 4 3 ]
     * Bits [2:0] are ignored since there are no posit operations which contain an MSB that low 
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire msb_2;

    assign msb_2 = |(frac_pos[10:7]); // P=[2sCOMP, MUX1, OR4]
    
    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Stage 2.a
     * The code expands the fraction from <sfxp>3.9 to <sfxp>3.10 (to account for future right 
     * shifts). This code also right shifts the fraction by 4 bits if the MBS is in the lower half.
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire [11:0] frac_a_shift_0;

    assign frac_a_shift_0 = msb_2 ? {frac_pos[10:0], 1'b0} :  {frac_pos[6:0], 5'b0};  // P=[2sCOMP, MUX1, OR4, MUX1]

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Stage 2.b
     * This code will return figure out if there exists a 1 in the top quarter or the 3rd top quarter
     * 
     *   1st       2nd       3rd       4th
     * [ A 9 ] | [ 8 7 ] | [ 6 5 ] | [ 4 3 ]
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire msb_1_0;
    wire msb_1_1;
    wire msb_1;

    assign msb_1_1 = |(frac_pos[10:9]);         // P=[2sCOMP, MUX1, OR2]
    assign msb_1_0 = |(frac_pos[ 6:5]);         // P=[2sCOMP, MUX1, OR2]
    assign msb_1   = msb_2 ? msb_1_1 : msb_1_0; // P=[2sCOMP, MUX1, OR4, MUX1]

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Stage 3.a
     * This code will  right shifts the fraction by 2 bits if the MBS is in the lower half.
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire [11:0] frac_a_shift_1;

    assign frac_a_shift_1 = msb_1 ? frac_a_shift_0 :  {frac_a_shift_0[9:0], 2'b0}; // P=[2sCOMP, MUX1, OR4, MUX1, MUX1]

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Stage 3.b
     * This code will return figure out if there exists a 1st, 3rd, 5th, or 7th eighth
     * 
     *  1st   2nd   3rd   4th   5th   6th   7th   8th
     * [ A ] [ 9 ] [ 8 ] [ 7 ] [ 6 ] [ 5 ] [ 4 ] [ 3 ]
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    reg msb_0;

    always_comb begin : decode_msb0 // P=[2sCOMP, MUX1, OR4, MUX1, MUX2]
        case({msb_2, msb_1})
            2'b00 : msb_0 = frac_pos[4];
            2'b01 : msb_0 = frac_pos[6];
            2'b10 : msb_0 = frac_pos[8];
            2'b11 : msb_0 = frac_pos[10];
        endcase
    end

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Stage 3.c
     * This code will subtract from 2 from the scale assuming that the MSB is in the lower quarter
     * then it will use the calculated msb to mux the results.
     * 
     * TODO, it might be fine to use the bit generated by msb_2 because its path is shorter than
     * the path of the "choose_sum"
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire [2:0] scale_quarter2;
    wire [2:0] scale_quarter4;
    wire [2:0] scale_quarter6;
    reg  [2:0] scale_sum;
    wire [3:0] scale_1;
    
    generate
        if(USE_CONST) begin : G_C1B
            assign scale_quarter2 = SCALE_IN[3:1] + 3'b111; // P=[ADD3]
            assign scale_quarter4 = SCALE_IN[3:1] + 3'b110; // P=[ADD3]
            assign scale_quarter6 = SCALE_IN[3:1] + 3'b101; // P=[ADD3]
        end else begin : G_C0B
            ADD #(.WIDTH(3), .TYPE("RCA")) sub_scale2 (.A(SCALE_IN[3:1]), .B(3'b111), .SUM(scale_quarter2), .C()); // -2, P=[ADD3]
            ADD #(.WIDTH(3), .TYPE("RCA")) sub_scale4 (.A(SCALE_IN[3:1]), .B(3'b110), .SUM(scale_quarter4), .C()); // -4, P=[ADD3]
            ADD #(.WIDTH(3), .TYPE("RCA")) sub_scale6 (.A(SCALE_IN[3:1]), .B(3'b101), .SUM(scale_quarter6), .C()); // -6, P=[ADD3]
        end
    endgenerate


    always_comb begin : choose_sum  // P=[2sCOMP, MUX1, OR4, MUX1, MUX2]
        case ({msb_2, msb_1})
            2'b00 : scale_sum = scale_quarter6; // SCALE_IN - 6
            2'b01 : scale_sum = scale_quarter4; // SCALE_IN - 4
            2'b10 : scale_sum = scale_quarter2; // SCALE_IN - 2
            2'b11 : scale_sum = SCALE_IN[3:1];  // SCALE_IN - 0
        endcase
    end
    
    assign scale_1 = {scale_sum, SCALE_IN[0]};
 

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Stage 4.a
     * This code will shift the fraction to the right if the msb eighth is 1
     * 
     *  1st   2nd   3rd   4th   5th   6th   7th   8th
     * [ A ] [ 9 ] [ 8 ] [ 7 ] [ 6 ] [ 5 ] [ 4 ] [ 3 ] 
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    assign FRAC_OUT = msb_0 ? {1'b0, frac_a_shift_1[11:2]} :  frac_a_shift_1[11:1]; // P=[2sCOMP, MUX1, OR4, MUX1, MUX2, MUX1]

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Stage 4.b
     * This code will add 1 assuming the msb is in the higher eighth.
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    generate
        if(USE_CONST) begin : G_C1C
            assign SCALE_OUT = msb_0 ? scale_1+1 : scale_1; // P=[2sCOMP, MUX1, OR4, MUX1, MUX2, ADD4, MUX1]
        end else begin : G_C0C
            wire [3:0] scale_eighth;
            ADD #(.WIDTH(4), .TYPE("RCA"), .ADD1(1)) add_one (.A(scale_1), .B(4'b0001), .SUM(scale_eighth), .C()); // P=[2sCOMP, MUX1, OR4, MUX1, MUX2, ADD4]
            assign SCALE_OUT = msb_0 ? scale_eighth : scale_1;                                                    // P=[2sCOMP, MUX1, OR4, MUX1, MUX2, ADD4, MUX1]
        end
    endgenerate
endmodule