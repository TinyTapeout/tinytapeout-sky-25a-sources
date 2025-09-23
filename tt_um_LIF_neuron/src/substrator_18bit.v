`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 09:12:38 PM
// Design Name: 
// Module Name: substrator_18bit
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


module substrator_18bit(
input [17:0] a,
input [17:0] b_o,
output [17:0] c
    );
    
wire [17:0] b;
assign b = ~ b_o;

wire a0, b0, s0;
wire a1, b1, s1;
    
wire [3:0] a2, a3, a4, a5;
wire [3:0] b2, b3, b4, b5;
wire [3:0] s2, s3, s4, s5;
wire cin0, cin1, cin2, cin3, cin4, cin5;
wire ct = 1;


assign a5 = a[17:14];
assign a4 = a[13:10];    
assign a3 = a[9:6];
assign a2 = a[5:2]; 
assign a1 = a[1];
assign a0 = a[0];


assign b5 = b[17:14];
assign b4 = b[13:10];    
assign b3 = b[9:6];
assign b2 = b[5:2]; 
assign b1 = b[1];
assign b0 = b[0];

full_adder adder0(.a(a0), .b(b0), .cin(ct), .s(s0), .cout(cin0));
full_adder adder1(.a(a1), .b(b1), .cin(cin0), .s(s1), .cout(cin1));
adder_4bit adder2(.a(a2), .b(b2), .cin(cin1), .s(s2), .cout(cin2));
adder_4bit adder3(.a(a3), .b(b3), .cin(cin2), .s(s3), .cout(cin3));
adder_4bit adder4(.a(a4), .b(b4), .cin(cin3), .s(s4), .cout(cin4));
adder_4bit adder5(.a(a5), .b(b5), .cin(cin4), .s(s5), .cout(cin5));


assign c = {s5,s4,s3,s2,s1,s0};

endmodule