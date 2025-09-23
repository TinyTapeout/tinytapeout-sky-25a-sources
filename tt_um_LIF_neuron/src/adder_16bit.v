`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2024 11:33:48 AM
// Design Name: 
// Module Name: adder_16bit
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


module adder_16bit(
input [15:0] a,
input [15:0] b,
output [16:0] c
    );

wire [3:0] a0, a1, a2, a3;
wire [3:0] b0, b1, b2, b3;
wire [3:0] s0, s1, s2, s3;
wire cin0,cin1,cin2,cin3;
wire ct = 0;

    
assign a3 = a[15:12];
assign a2 = a[11:8]; 
assign a1 = a[7:4];
assign a0 = a[3:0];

assign b3 = b[15:12];
assign b2 = b[11:8]; 
assign b1 = b[7:4];
assign b0 = b[3:0];

adder_4bit adder0(.a(a0), .b(b0), .cin(ct), .s(s0), .cout(cin0));
adder_4bit adder1(.a(a1), .b(b1), .cin(cin0), .s(s1), .cout(cin1));
adder_4bit adder2(.a(a2), .b(b2), .cin(cin1), .s(s2), .cout(cin2));
adder_4bit adder3(.a(a3), .b(b3), .cin(cin2), .s(s3), .cout(cin3));

assign c = {cin3,s3,s2,s1,s0};


endmodule
