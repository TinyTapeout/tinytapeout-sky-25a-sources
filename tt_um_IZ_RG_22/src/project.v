/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_IZ_RG_22 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
 assign uio_oe  = 8'b1111_1111;
 wire spike_none;
 wire [2:0] select;
 wire [4:0] I;
 wire [7:0] V_out;
 wire [7:0] U_out;
 
assign {I,select}=ui_in;
assign uo_out=V_out;
assign uio_out=U_out;

 IZ_RG_22 IZ_RG_22_Unit(
    .clk(clk),
    .rst(rst_n),
    .select(select),
    .I(I), // Current input
    .V_out(V_out),
    .U_out(U_out), // Membrane potential
    .spike(spike_none)    // Spike output
);

  wire _unused = &{ena, uio_in, 1'b0};

endmodule
