`timescale 1ns / 1ps
/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 07/28/2025
 * Module Name: HCA
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   This is a half carry adder. This is used to sum one input bit with another input bit. The 
 *   longterm goal is to use this as a submodule and create a dadda multiplier
 * 
 * Dependencies: None
 * 
 * Additional Comments: 
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

module HCA #(
    parameter C = 0
)(
    input  wire A   ,
    input  wire B   ,

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
    if(C==0) begin : G_0C
        if(SKY130) begin : G_SKY
            sky130_fd_sc_hd__ha_1 ha (.VPWR(1'b1), .VGND(1'b0), .VPB(1'b1), .VNB(1'b0), .A(A), .B(B), .SUM(SUM), .COUT(C_OUT));
        end else begin : G_RTL
            assign SUM   = A ^ B;
            assign C_OUT = A & B;
        end        
    end else begin : G_1C
        // Note this is a HCA assuming that there is an incoming 1. 
        // I don't think theres a sky130 gate for this, so this is
        // the only option
        assign SUM   = ~(A ^ B);
        assign C_OUT =   A | B;
    end
    


endgenerate

endmodule
