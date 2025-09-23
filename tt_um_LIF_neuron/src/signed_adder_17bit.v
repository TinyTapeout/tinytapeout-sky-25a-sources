`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 09:40:41 AM
// Design Name: 
// Module Name: signed_adder_17bit
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


module signed_adder_17bit(
    input [16:0] s_a,
    input [16:0] s_b,
    output [17:0] s_c
    );
    
    
wire [31:0] a, b;
wire [3:0] a0, a1, a2, a3;
wire [3:0] b0, b1, b2, b3;
wire [3:0] s0, s1, s2, s3;
wire cin0, cin1, cin2, cin3;
wire ct = 0;

assign a = s_a[15:0];
assign b = s_b[15:0];
 
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


assign s_c = (s_a[16] ^ s_b[16])? {~cin3,~cin3,s3,s2,s1,s0} : {s_a[16],cin3,s3,s2,s1,s0};
//正负两个数的溢出情况只存在正数数值大，负数数值小的情况，因此溢出值直接赋0即可,而符号相同时直接溢出就是正确值

endmodule
