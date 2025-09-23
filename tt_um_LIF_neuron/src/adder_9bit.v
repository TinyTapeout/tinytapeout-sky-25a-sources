`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 09:17:26 PM
// Design Name: 
// Module Name: adder_9bit
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


module adder_9bit(
input [8:0] a,
input [8:0] b,
output [9:0] c
    );

wire a0, b0, s0;
wire [3:0] a1, a2;
wire [3:0] b1, b2;
wire [3:0] s1, s2;
wire cin0,cin1,cin2;
wire ct = 0;

    

assign a2 = a[8:5];
assign a1 = a[4:1];
assign a0 = a[0];

assign b2 = b[8:5];  
assign b1 = b[4:1];  
assign b0 = b[0];

half_adder adder0(.a(a0), .b(b0), .s(s0), .cout(cin0));    
adder_4bit adder1(.a(a1), .b(b1), .cin(cin0), .s(s1), .cout(cin1));
adder_4bit adder2(.a(a2), .b(b2), .cin(cin1), .s(s2), .cout(cin2));

assign c = {cin2,s2,s1,s0};


endmodule