`timescale 1ns / 1ps
/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 07/18/2025
 * Module Name: ADD
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   This module is for declariong different kinds of addition circuits
 * 
 * Dependencies:
 *   RCA, FCA, HCA
 * 
 * Additional Comments: 
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


module SUB 
#(
    parameter WIDTH = 10,
    parameter TYPE  = "default" 
)
(
    input  wire [WIDTH-1:0] A   ,
    input  wire [WIDTH-1:0] B   ,

    output wire [WIDTH-1:0] SUM  ,
    output wire             C
);

wire [WIDTH-1:0] b_inv;
assign b_inv = ~B; 

generate
    if (TYPE == "RCA") begin : G_RCA
        RCA #(.WIDTH(WIDTH), .C(1)) RCA_0 (.A(A), .B(b_inv), .SUM(SUM), .C_OUT(C));
    // TODO add a CIN for the 2's compliment
    // end else if (TYPE == "SQRTCSA") begin
    //     SQRTCSA #(.WIDTH(WIDTH)) SQRTCSA_0 (.A(A), .B(b_inv), .SUM(SUM), .C_OUT(C)); 
    // end else if (TYPE == "SQRTCSA2") begin
    //     SQRTCSA2 #(.WIDTH(WIDTH)) SQRTCSA_0 (.A(A), .B(b_inv), .SUM(SUM), .C_OUT(C));
    end else begin : G_DEF
        wire [WIDTH:0] sum_extended;
        
        assign sum_extended = A+b_inv+1;
        assign SUM          = sum_extended[WIDTH-1:0];
        assign C            = sum_extended[WIDTH];
    end
endgenerate


endmodule