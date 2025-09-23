/*
 * Copyright (c) 2025 Tobi McKellar
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_tobi_mckellar_top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire [3:0] cap_out;
    wire [3:0] cap_oe;
    wire [3:0] btn;

    // Instantiate four capacitivetouch modules
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : cap_touch_inst
            capacitivetouch uut (
                .clk     (clk),
                .reset   (rst_n),
                .cap_in  (uio_in[i]),
                .cap_out (cap_out[i]),
                .cap_oe  (cap_oe[i]),
                .btn     (btn[i])
            );
        end
    endgenerate

    // Drive uio output and OE for lower 3 bits
    assign uio_out[3:0] = cap_out;
    assign uio_oe[3:0]  = cap_oe;

    // Drive dedicated outputs with btn states
    assign uo_out[3:0]  = btn;
    // Clear remaining uo_out pins
    assign uo_out[5:4] = 2'b00;
    assign uo_out[7:6]  = ui_in[7:6];

    // Set upper 5 uio pins to input mode (no drive)
    assign uio_out[7:4] = 4'b00000;
    assign uio_oe[7:4]  = 4'b00000;


endmodule
