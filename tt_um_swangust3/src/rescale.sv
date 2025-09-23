`timescale 1ns / 1ps
/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 08/14/2025
 * Module Name: rescale
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   
 * Path Length : 
 *    
 * Dependencies:
 * 
 * Additional Comments: 
 *   
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
module rescale(
    input  wire [ 4:0] SCALE_IN , // scale,    5 bit signed integer
    input  wire [11:0] FRAC_IN  , // fraction, <2.10> unsigned fixed point
    output wire [ 4:0] SCALE_OUT, // scale,    5 bit signed integer
    output wire [12:0] FRAC_OUT   // fraction, <2.11> unsigned fixed point
    );

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * When adding a constant, its usually more efficient to just use the built in "+" and let
     * the synthesis prune the logic over using any type of adder circuit
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    localparam USE_CONST = 1;

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * If there is a bit in the msb of the fraction in, shift it down, otherwise add an additional
     * fractional bit.
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    assign FRAC_OUT = FRAC_IN[11] ? {1'b0, FRAC_IN} :  {FRAC_IN, 1'b0};

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     *  If there is a bit in the msb of the fraction in, increment the scale , otherwise add an
     *  additional it remains the same.
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    generate
        if(USE_CONST) begin : G_C1C
            assign SCALE_OUT = FRAC_IN[11] ? SCALE_IN : SCALE_IN-1;
        end else begin : G_C0C
            wire [4:0] scale_1;
            ADD #(.WIDTH(4), .TYPE("RCA"), .ADD1(1)) add_one (.A(SCALE_IN), .B(5'b00001), .SUM(scale_1), .C());
            assign SCALE_OUT = FRAC_IN[10] ? scale_1 : SCALE_IN;
        end
    endgenerate
endmodule