/*
 * Copyright (c) 2024 Daniel Teal
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_dteal_awg (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

// Pinout:
// ui_in[0] = sclk
// ui_in[1] = mosi
// ui_in[2] = load
// ui_in[3] = enable
// ui_in[4] = div_2
// ui_in[5] = div_4
// ui_in[6] = div_16
// ui_in[7] = div_256

// don't use bidirectional pins
assign uio_out = 0;
assign uio_oe  = 0;
// don't use these pins, but keep a wire here to prevent warnings
wire _unused = &{ena, uio_in};

// ===== SPI =====
// Shift waveform data in. MOSI only, no MISO or CS (so is it really SPI? IDK)
// Keep it simple: SPI for wave data only, other pins for other things.
// For each of 8 time points, each output is on or off.

wire sclk;
wire mosi;
assign sclk = ui_in[0];
assign mosi = ui_in[1];
// manually find sclk edge
reg sclk_prev;
wire sclk_rising;
assign sclk_rising = sclk & !sclk_prev;
// stored data
localparam OUT_PINS = 8;
reg [OUT_PINS*8-1:0] wave_data_input;
always @(posedge clk) begin // SPI clock subordinate to system clock
    if (!rst_n) begin
        sclk_prev <= 1; // don't trigger when sclk held high through reset
        wave_data_input <= 0;
    end else begin
        sclk_prev <= sclk;
        if (sclk_rising) begin
            wave_data_input <= {wave_data_input, mosi}; // shift in
        end
    end
end

// ===== Load data =====
// In order to let the waveform generator run continuously while also loading
// new data, keep a secondary copy of waveform data, loaded from
// the input data when load=1.

wire load;
assign load = ui_in[2];
reg [OUT_PINS*8-1:0] wave_data_active;
always @(posedge clk) begin
    if (!rst_n) begin
        wave_data_active <= 0;
    end else begin
        if (load) begin
            wave_data_active <= wave_data_input;
        end
    end
end

// ===== Waveform clock =====
// The waveform output is governed by clk.
// It already takes 8 clock cycles to output the provided data.
// Provide a way to optionally slow the clock down further to meet
// any given frequency. Let's not worry too much about precision now;
// provide stackable 2x, 4x, 16x, and 256x slowdowns (clock dividers).
// This means slowest speed is 8*2*4*16*256 = 262k x slower than clk.

reg [7:0] wave_time; // unary counter to make output logic simple

wire div_2;
wire div_4;
wire div_16;
wire div_256;
assign div_2 = ui_in[4];
assign div_4 = ui_in[5];
assign div_16 = ui_in[6];
assign div_256 = ui_in[7];
reg [31:0] slowdown; // counter to track slowdown
wire [16:0] multiple; // how much to slow down by
assign multiple = (div_2 ? 2 : 1) * (div_4 ? 4 : 1) *
                  (div_16 ? 16 : 1) * (div_256 ? 256 : 1);

always @(posedge clk) begin
    if (!rst_n) begin
        wave_time <= 8'b1;
        slowdown <= 1;
    end else begin
        slowdown <= slowdown + 1;
        if (slowdown >= multiple) begin
            slowdown <= 1; // reset to 1 to get cycle length 1 at multiple=1
            if (wave_time == 8'b10000000) begin
                wave_time <= 8'b1;
            end else begin
                wave_time <= wave_time << 1;
            end
        end
    end
end

// ===== Output data =====
// When enable=1, each pin should output its data according to wave_time.

wire enable;
assign enable = ui_in[3];
wire [7:0] pin0_vals;
wire [7:0] pin1_vals;
wire [7:0] pin2_vals;
wire [7:0] pin3_vals;
wire [7:0] pin4_vals;
wire [7:0] pin5_vals;
wire [7:0] pin6_vals;
wire [7:0] pin7_vals;
assign {pin7_vals, pin6_vals, pin5_vals, pin4_vals,
        pin3_vals, pin2_vals, pin1_vals, pin0_vals} = wave_data_active;
assign uo_out[0] = enable & |(pin0_vals & wave_time);
assign uo_out[1] = enable & |(pin1_vals & wave_time);
assign uo_out[2] = enable & |(pin2_vals & wave_time);
assign uo_out[3] = enable & |(pin3_vals & wave_time);
assign uo_out[4] = enable & |(pin4_vals & wave_time);
assign uo_out[5] = enable & |(pin5_vals & wave_time);
assign uo_out[6] = enable & |(pin6_vals & wave_time);
assign uo_out[7] = enable & |(pin7_vals & wave_time);

endmodule
