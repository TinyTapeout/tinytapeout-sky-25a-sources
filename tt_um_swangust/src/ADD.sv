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
 *   RCA, FCA
 * 
 * Additional Comments: 
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


module ADD 
#(
    parameter WIDTH = 10,
    parameter ADD1 = 0,
    parameter TYPE  = "default" 
)
(
    input  wire [WIDTH-1:0] A   ,
    input  wire [WIDTH-1:0] B   ,

    output wire [WIDTH-1:0] SUM  ,
    output wire             C
);

generate
    if (TYPE == "RCA") begin : G_RCA
        RCA #(.WIDTH(WIDTH), .ADD1(ADD1), .C(0)) RCA_0 (.A(A), .B(B), .SUM(SUM), .C_OUT(C));
    end else if (TYPE == "SQRTCSA") begin : G_CSA
        SQRTCSA #(.WIDTH(WIDTH)) SQRTCSA_0 (.A(A), .B(B), .SUM(SUM), .C_OUT(C));
    end else if (TYPE == "SQRTCSA2") begin : G_CSA_B
        // This version uses vivado default "+" instead of RCA. Possible FPGA optimization
        SQRTCSA2 #(.WIDTH(WIDTH)) SQRTCSA_0 (.A(A), .B(B), .SUM(SUM), .C_OUT(C)); 
    end else begin : G_DEF
        wire [WIDTH:0] sum_extended;
        
        assign sum_extended = A+B;
        assign SUM          = sum_extended[WIDTH-1:0];
        assign C            = sum_extended[WIDTH];
    end
endgenerate


endmodule