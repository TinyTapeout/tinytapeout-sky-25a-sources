`timescale 1ns / 1ps

/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 08/25/2025
 * Module Name: scale_and_mul
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   This module takes in two decoded posits (scale + frac). It adds the scale and uses a Dadda 
 *   multiplier to multiply the fractions together.
 * Path Length : 
 *    [SUB4, SHIFT4, ADD12, MUX1] 
 * Dependencies:
 *   TODO add Dependencies
 * 
 * Additional Comments: 
 *   This code has its own testbench
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

module scale_and_div #(
    parameter SPEED = 0,
    parameter DIV_STAGES = 11
    )(
    input  wire        CLK,
    input  wire        RSTN,

    input  wire [ 3:0] SCALE_A, // decoded scale,      4 bit signed integer
    input  wire [ 3:0] SCALE_B, // decoded scale,      4 bit signed integer
    input  wire [ 5:0] FRAC_A , // decoded fraction,  <1.5> unsigned fixed point 
    input  wire [ 5:0] FRAC_B , // decoded fraction,  <1.5> unsigned fixed point 
    output wire [ 4:0] SCALE_C, // sum of scales,      5 bit signed integer
    output wire [DIV_STAGES:0] FRAC_C,   // prod of fractions, <2.10> unsigned fixed point
    output wire REM_C
    );

DIV #(
    .W(6),
    .S(DIV_STAGES) // todo parameter
    ) div (
    .CLK (CLK),
    .RSTN(RSTN),
   .A(FRAC_A),
   .B(FRAC_B),
   .C(FRAC_C),
   .REM(REM_C)
   );

wire [4:0] scale_c_r;

SUB #(.WIDTH(5), .TYPE("RCA")) add_frac_sum_a (.A({SCALE_A[3], SCALE_A}), .B({SCALE_B[3], SCALE_B}), .SUM(scale_c_r), .C()); // P=[ADD5]

PIPE #(.W(5), .L(DIV_STAGES)) pipe_scale_c (.CLK(CLK), .RSTN(RSTN), .A(scale_c_r), .B(SCALE_C));

endmodule
