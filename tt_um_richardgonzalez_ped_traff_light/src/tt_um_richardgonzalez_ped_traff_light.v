/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_richardgonzalez_ped_traff_light (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


wire rst = ! rst_n;
assign uio_oe = 8'b0000_0000;
assign uio_out = 8'b0000_0000;
assign uo_out[7:4] = 4'b0000;
wire unused_ena = ena;
wire [7:0] unused_ui_in = ui_in;
wire [7:0] unused_uio_in = uio_in;

//wire green_light, red_light;
//wire [1:0] countdown;

 ped_traff_light ped_light (
	.clk(clk),
	.reset(rst),
	.green_light(uo_out[0]),
	.red_light(uo_out[1]),
	.countdown(uo_out[3:2])
); 

//assign uo_out[0] = green_light;
//assign uo_out[1] = red_light;
//assign uo_out[3:2] = countdown;
//assign uo_out[7:4] = 4'b0000

endmodule
