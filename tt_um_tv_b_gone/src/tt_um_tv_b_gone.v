/*
 * Copyright (c) 2024 PS-SemiQa
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_tv_b_gone (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire ctc_out;
  wire active_out;
  wire failure_out;

  tv_b_gone tv_gone (
    .clock_in(clk),      	        // clock

    .reset_in(!rst_n),      	    // resets internals (synchronous)

    .start_in(!ui_in[0]),     	  // starts working when high (synchronous)
	  .loop_forever_in(ui_in[1]),   // loops codes forever when high (syncronous)

    .busy_out(active_out),        // working when high
    .fail_out(failure_out),      	// failure detected when high

    .ctc_out(ctc_out)			        // IR LED driving
  );

  assign uo_out[0] = ctc_out;
  assign uo_out[1] = ~ctc_out;
  assign uo_out[2] = ~active_out;
  assign uo_out[3] = ~failure_out;

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[7:4] = ui_in[7:4];
  assign uio_out = 8'h00;
  assign uio_oe  = 8'h00;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[3:2], uio_in[7:0], 1'b0};

endmodule
