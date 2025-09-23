`timescale 1ns / 1ps
/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 07/18/2025
 * Module Name: FCA
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   This is a full carry adder. This is used to sum one input bit with another input bit. The 
 *   longterm goal is to use this as a submodule and create a square root carry select adder.
 * 
 * Dependencies: None
 * 
 * Additional Comments: 
 *  1) This design is not gate minimized for ASIC.
 *  2) This design is likely not optimal for FPGA since it skips built in adders / DSPs. 
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


module FCA
(
    input  wire A   ,
    input  wire B   ,
    input  wire C_IN,

    output wire SUM  ,
    output wire C_OUT
);

// if using the skywater pdk
`ifdef NO_GATES
    localparam SKY130 = 0;
`else 
    localparam SKY130 = 1;
`endif

generate
    if(SKY130) begin : G_SKY
        sky130_fd_sc_hd__fa_1 fa (/*.VPWR(1'b1), .VGND(1'b0), .VPB(1'b1), .VNB(1'b0), */.A(A), .B(B), .CIN(C_IN), .SUM(SUM), .COUT(C_OUT));
    end else begin : G_RTL
        /* Stage 1 */
        wire a_xor_b;
        wire a_and_b;

        assign a_xor_b = A ^ B;
        assign a_and_b = A & B;

        /* Stage 2 */
        wire a_xor_b_and_c;

        assign SUM           = a_xor_b ^ C_IN;
        assign a_xor_b_and_c = a_xor_b & C_IN;

        /* Stage 3 */

        assign C_OUT =  a_xor_b_and_c | a_and_b;
    end
endgenerate



endmodule
