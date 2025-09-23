/*
 * Copyright (c) 2025 Alida Bruka
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_Alida_DutyCycleMeter (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  
  assign uio_oe = 8'b0000_0000;
  assign uio_out = 8'b0000_0000;

  DutyCycleMeter DutyCycleMeter(

    .clk(clk),              // Clock di sistema (es. 100 MHz)
    .rst(rst_n),          	 // Reset asincrono attivo basso
    .sig_in(ui_in[0]),           // Segnale da misurare
    .duty_out(uo_out[6:0]),  	 // Duty cycle in scala 0-127 (7 bit)
    .valid(uo_out[7])             // Segnale di validità misura
	);

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[7:1], uio_in,  1'b0};

endmodule
