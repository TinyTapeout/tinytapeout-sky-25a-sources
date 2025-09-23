`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 09:15:40 PM
// Design Name: 
// Module Name: app_mul_8bit
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


module app_mul_8bit(
input clk,
input [7:0] a,
input [7:0] b,
output [15:0] out
    );

parameter CONS = 9'b000010101;
parameter HALFCONS = 9'b000001010;

wire [4:0] k;
wire [3:0] k0;
wire [3:0] ka;
wire [3:0] kb;
wire [8:0] offset;
wire [7:0] ah;
wire [7:0] bh;
wire [7:0] ain;
wire [7:0] bin;
wire cin;
wire [9:0] cc;
wire [8:0] sum, sum0;
wire cout;
wire [16:0] out0;
wire [23:0] out1;

reg [8:0] pip_sum; //pipline reg
reg [3:0] pip_ka;
reg [3:0] pip_kb;

wire za,zb;

reg pip_z;
wire z;

    preprocess_8bit preprocess0(a,ain,ka,za);
    preprocess_8bit preprocess1(b,bin,kb,zb);

    assign ah = {ain[6:0],1'b0};
    assign bh = {bin[6:0],1'b0};
    
    adder_8bit adder0(ah, bh, sum);
    
    assign z = za || zb;

always@(posedge clk)begin //pipline cut
    pip_sum <= sum;
    pip_ka <= ka;
    pip_kb <= kb;
    pip_z <= z;
end

    assign offset = (pip_sum[8])? HALFCONS : CONS;
    //assign sum0 = (pip_sum[16])? pip_sum : {1'b1,pip_sum[15:0]};
    assign sum0 = {1'b1,pip_sum[7:0]};
    
    adder_9bit adder1(sum0, offset, cc);//9bit adder
    
    assign cin = (pip_sum[8])? 1'b0: 1'b1;
    //comparator_4bit comparator0(.a(pip_ka), .b(pip_kb), .c(k0));
    adder_4bit adder2(.a(pip_ka), .b(pip_kb), .cin(cin), .s(k0), .cout(cout));
    
    assign k = {cout, k0};
    
    assign out0 = (pip_z)? 17'b0: {cc,7'b0}>>k;
//    assign out0 = {14'b0,cc};
//    assign out1 = out0 << k;
    //assign out = out0[23:8];
    assign out = (out0[16] == 1)? 16'b1111111111111111:out0[15:0];

endmodule
