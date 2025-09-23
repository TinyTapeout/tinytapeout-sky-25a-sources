/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`include "rnd.v"
`default_nettype none

module tt_um_SNPU (
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // always 1 when the design is powered, so you can ignore it
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
);
  // assign uio_oe  = 0;
  assign uio_oe  = 255; // use io pins as outputs

  parameter RND_N = 34;
  parameter RND_N_addr = $clog2(RND_N);

  wire       freeze; assign freeze = ui_in[0];
  wire [RND_N_addr-1:0] addr;   assign addr   = ui_in[RND_N_addr:1];

  //// cover a max of the chip with random number generators

  wire [RND_N-1:0][15:0] rands; // SystemVerilog style
  genvar i;
  generate
    for (i = 0; i < RND_N; i = i + 1) begin : rnd_blocks
      // assign rands[i] = i[15:0];  // pad i up to 16 bits, debugging
      funky_rnd_n #(.N(16)) rnd_bank (
        .G(freeze),
        .R(rands[i])
      );
    end
  endgenerate

  wire [15:0] selected_rands;
  assign selected_rands = rands[addr];
  assign uo_out  = selected_rands[15:8];
  assign uio_out = selected_rands[7:0];

  //// no copy paste version

  // wire [15:0] rands;
  // funky_rnd_n #(.N(16)) hello (.G(freeze),.R(rands));
  // assign uo_out  = rands[15:8]; // upper 8 bits
  // assign uio_out = rands[7:0];  // lower 8 bits

  //// copy paste version

  // funky_rnd rnd00 (.G(freeze),.R(uo_out[0]));
  // funky_rnd rnd01 (.G(freeze),.R(uo_out[1]));
  // funky_rnd rnd02 (.G(freeze),.R(uo_out[2]));
  // funky_rnd rnd03 (.G(freeze),.R(uo_out[3]));
  // funky_rnd rnd04 (.G(freeze),.R(uo_out[4]));
  // funky_rnd rnd05 (.G(freeze),.R(uo_out[5]));
  // funky_rnd rnd06 (.G(freeze),.R(uo_out[6]));
  // funky_rnd rnd07 (.G(freeze),.R(uo_out[7]));

  // funky_rnd rnd10 (.G(freeze),.R(uio_out[0]));
  // funky_rnd rnd11 (.G(freeze),.R(uio_out[1]));
  // funky_rnd rnd12 (.G(freeze),.R(uio_out[2]));
  // funky_rnd rnd13 (.G(freeze),.R(uio_out[3]));
  // funky_rnd rnd14 (.G(freeze),.R(uio_out[4]));
  // funky_rnd rnd15 (.G(freeze),.R(uio_out[5]));
  // funky_rnd rnd16 (.G(freeze),.R(uio_out[6]));
  // funky_rnd rnd17 (.G(freeze),.R(uio_out[7]));

  wire _unused = &{uio_in,clk,rst_n,ena, 1'b0};

endmodule
