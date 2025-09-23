`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 09:37:45 PM
// Design Name: 
// Module Name: folded_mul_16bit
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


module folded_mul_16bit(
input clk,
    input [15:0] a,
    input [15:0] b,
    output [31:0] out
    );
wire [15:0] a_new;
wire [15:0] b_new;
wire [8:0] a_star;
wire [8:0] b_star;
wire [3:0] ka;
wire [3:0] kb;
wire [3:0] k0;
wire [4:0] k;
wire [16:0] gamma;
wire [17:0] gamma_18bit;
wire [17:0] y;
wire [15:0] alpha;
wire [15:0] beta;
wire [16:0] sum;
wire [17:0] x;
wire [15:0] x_star;
wire z1,z2;
wire z;

reg [7:0] ah, al;
reg [7:0] bh, bl;
reg [8:0] pip_astar, pip_bstar;
reg [15:0] pip_alpha0, pip_alpha1, pip_alpha2;
reg [15:0] pip_beta0, pip_beta1, pip_beta2, pip_beta3;
reg [17:0] pip_y, pip_gamma;
reg [15:0] pip_x;
reg [16:0] pip_sum;
reg [3:0] pip0_ka;
reg [3:0] pip0_kb;
reg [4:0] pip0_k, pip1_k, pip2_k, pip3_k, pip4_k;
reg pip0_z, pip1_z, pip2_z, pip3_z, pip4_z, pip5_z;

wire none;

    preprocess preprocess0(.data(a), .out(a_new), .kout(ka), .zout(z1)); //第一位为1
    preprocess preprocess1(.data(b), .out(b_new), .kout(kb), .zout(z2));
    
    assign z = z1 || z2;


always@(posedge clk)begin //pipline0
    ah <= a_new[15:8];
    al <= a_new[7:0];
    bh <= b_new[15:8];
    bl <= b_new[7:0];
    pip0_ka <= ka;
    pip0_kb <= kb;
    pip0_z <= z;
    end

        
    adder_8bit adder0(.a(ah), .b(al), .c(a_star));
    adder_8bit adder1(.a(bh), .b(bl), .c(b_star));
    adder_4bit adder4(.a(pip0_ka), .b(pip0_kb),.cin(1'b0),.s(k0), .cout(none));
    assign k = {none,k0};
    app_mul_8bit mul1(.clk(clk), .a(ah), .b(bh), .out(alpha));
    app_mul_8bit mul2(.clk(clk), .a(al), .b(bl), .out(beta));

always@(posedge clk)begin //pipline1
    pip_astar <= a_star;
    pip_bstar <= b_star;
    pip0_k <= k;
    pip1_z <= pip0_z;
    end

    app_mul_9bit mul0(.clk(clk), .a(pip_astar), .b(pip_bstar), .out(y)); //改变乘法器

always@(posedge clk)begin //pipline2
    pip_alpha0 <= alpha;
    pip_beta0 <= beta;
    pip1_k <= pip0_k;
    pip2_z <= pip1_z;
    end

    adder_16bit adder2(.a(pip_alpha0), .b(pip_beta0), .c(gamma));  
    assign gamma_18bit = {1'b0, gamma};

always@(posedge clk)begin //pipline3
    pip_y <= y;
    pip_gamma <= gamma_18bit;  
    pip_alpha1 <= pip_alpha0;
    pip_beta1 <= pip_beta0;
    pip2_k <= pip1_k;
    pip3_z <= pip2_z;
    end
    
    substrator_18bit substrator0(.a(pip_y), .b_o(pip_gamma), .c(x)); 
    assign x_star = {6'b0,x[17:8]};

always@(posedge clk)begin //pipline4
    pip_x <= x_star;  
    pip_alpha2 <= pip_alpha1;
    pip_beta2 <= pip_beta1;  
    pip3_k <= pip2_k;
    pip4_z <= pip3_z;
    end

    adder_16bit adder3(.a(pip_alpha2), .b(pip_x), .c(sum));

always@(posedge clk)begin //pipline5
    pip_sum <= sum;  
    pip_beta3 <= pip_beta2;    
    pip4_k <= pip3_k;
    pip5_z <= pip4_z;
    end

    assign out = (pip5_z)? 32'b0:{pip_sum, pip_beta3} >> pip4_k;
    
endmodule