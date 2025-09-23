`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 07:04:59 PM
// Design Name: 
// Module Name: signed_substrator_16bit
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


module signed_substrator_16bit(
    input [15:0] s_a,
    input [15:0] s_b,
    output [16:0] s_c
    );
    
wire [14:0] a, b;    
wire a0, b0, s0, a1, b1, s1, a2, b2, s2;
wire [3:0] a3, a4, a5;
wire [3:0] b3, b4, b5;
wire [3:0] s3, s4, s5;
wire cin0, cin1, cin2, cin3, cin4, cin5;
wire ct = 1;


assign a = s_a[14:0];
assign b = ~s_b[14:0];

assign a5 = a[14:11];
assign a4 = a[10:7];    
assign a3 = a[6:3];
assign a2 = a[2]; 
assign a1 = a[1];
assign a0 = a[0];

assign b5 = b[14:11];
assign b4 = b[10:7];    
assign b3 = b[6:3];
assign b2 = b[2]; 
assign b1 = b[1];
assign b0 = b[0];

full_adder adder0(.a(a0), .b(b0), .cin(ct), .s(s0), .cout(cin0));  
full_adder adder1(.a(a1), .b(b1), .cin(cin0), .s(s1), .cout(cin1));  
full_adder adder2(.a(a2), .b(b2), .cin(cin1), .s(s2), .cout(cin2));  
adder_4bit adder3(.a(a3), .b(b3), .cin(cin2), .s(s3), .cout(cin3));
adder_4bit adder4(.a(a4), .b(b4), .cin(cin3), .s(s4), .cout(cin4));
adder_4bit adder5(.a(a5), .b(b5), .cin(cin4), .s(s5), .cout(cin5));

assign s_c = (s_a[15] ^ ~s_b[15])? {~cin5,~cin5,s5,s4,s3,s2,s1,s0} : {s_a[15],cin5,s5,s4,s3,s2,s1,s0};
//正负两个数的溢出情况只存在正数数值大，负数数值小的情况，因此溢出值直接赋0即可,而符号相同时直接溢出就是正确值
    
    
    
    
    
    
endmodule
