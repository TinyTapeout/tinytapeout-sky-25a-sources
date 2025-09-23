`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2025 09:48:56 PM
// Design Name: 
// Module Name: single_step
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


module tb();
reg clk;
reg rst;
wire [7:0] uo_out,uio_out,uio_oe,ena;
reg [7:0] ui_in,uio_in;
`ifdef GL_TEST
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif

tt_um_LIF_neuron UUT(
`ifdef GL_TEST
      .VPWR(VPWR),
      .VGND(VGND),
`endif
	.clk(clk), 
	.rst_n(rst), 
	.ena(ena),
	.ui_in(ui_in), 
	.uo_out(uo_out), 
	.uio_in(uio_in), 
	.uio_out(uio_out), 
	.uio_oe(uio_oe)
); 


initial
    begin


    $dumpfile("tb.vcd");
    $dumpvars(0, tb); 

   

    end 


endmodule
