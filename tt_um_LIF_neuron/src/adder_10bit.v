`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2025 05:37:45 PM
// Design Name: 
// Module Name: adder_10bit
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


module adder_10bit(
input [9:0] a,
input [9:0] b,
output [10:0] c
    );

wire a0, b0, s0, a1, b1, s1;
wire [3:0] a2, a3;
wire [3:0] b2, b3;
wire [3:0] s2, s3;
wire cin0,cin1,cin2, cin3;
wire ct = 0;

    

assign a3 = a[9:6];
assign a2 = a[5:2];
assign a1 = a[1];
assign a0 = a[0];

assign b3 = b[9:6];
assign b2 = b[5:2];
assign b1 = b[1];
assign b0 = b[0];

half_adder adder0(.a(a0), .b(b0), .s(s0), .cout(cin0)); 
full_adder adder1(.a(a1), .b(b1), .cin(cin0), .s(s1), .cout(cin1)); 
adder_4bit adder2(.a(a2), .b(b2), .cin(cin1), .s(s2), .cout(cin2));
adder_4bit adder3(.a(a3), .b(b3), .cin(cin2), .s(s3), .cout(cin3));

assign c = {cin3,s3,s2,s1,s0};


endmodule