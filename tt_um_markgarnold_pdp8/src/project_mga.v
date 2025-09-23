/*
 * Copyright (c) 2024 Mark G. Arnold
 * SPDX-License-Identifier: Apache-2.0
 */


`default_nettype none

`include "spdp7vv.v"

module tt_um_markgarnold_pdp8 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  
  wire sysclk = clk;
  wire reset = ~rst_n;
  wire membus = ui_in[0];
  wire contin = ui_in[1];

  // List all unused (6) inputs to prevent warnings
  wire _unused = &{ena,ui_in[7:2],1'b0};

  //map these to the PDP8 pins
  wire write,mb,halt;
  wire [6:0] ma;
  wire [3:0] ba;
  pdp8_cpu markgarnold_pdp8(write,membus,contin,ba,ma,mb,halt,reset,sysclk);
  assign uo_out  = {halt, ma};
  assign uio_oe  = 8'b11111111; //all uios are outputs
  assign uio_out = {2'b0,write,mb,ba}; //2 unused

endmodule
