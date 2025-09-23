`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 09:10:29 PM
// Design Name: 
// Module Name: adder_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder_8bit(
input [7:0] a,
input [7:0] b,
output [8:0] c
    );

wire [3:0] a0, a1;
wire [3:0] b0, b1;
wire [3:0] s0, s1;
wire cin0,cin1;
wire ct = 0;

assign a1 = a[7:4];
assign a0 = a[3:0];

assign b1 = b[7:4];
assign b0 = b[3:0];

adder_4bit adder0(.a(a0), .b(b0), .cin(ct), .s(s0), .cout(cin0));
adder_4bit adder1(.a(a1), .b(b1), .cin(cin0), .s(s1), .cout(cin1));

assign c = {cin1,s1,s0};

endmodule