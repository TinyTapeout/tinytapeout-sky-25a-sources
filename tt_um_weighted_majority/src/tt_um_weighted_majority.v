/*
 * Copyright (c) 2024 Aditya Varma, Nischay B S, Santhosh V, Syed Abdur Rahman, Meghana P Manru, Shylashree N, RV College of Engineering, Bengaluru
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_weighted_majority (
    input  wire [7:0]  ui_in,
    output wire [7:0]  uo_out,
    input  wire [7:0]  uio_in,
    output wire [7:0]  uio_out,
    output wire [7:0]  uio_oe,
    input  wire        ena,
    input  wire        clk,
    input  wire        rst_n
);

// assign unused outputs to 0
assign uio_out = 8'd0;
assign uio_oe  = 8'd0;

// For warning suppression if you don’t use uio_in, ena
wire _unused = &{uio_in, ena, 1'b0};

// ------- Application-specific ports --------
// ui_in[0]: single bit binary input stream
// uo_out[0]: trend detector output

wire in_bit = ui_in[0];
reg [7:0] out_reg;
assign uo_out = out_reg;

// Sliding window and weights (4 bits)
// Most recent bit is window[3], oldest is window[0]
reg [3:0] window;
localparam integer W0 = 8; // Most recent
localparam integer W1 = 4;
localparam integer W2 = 2;
localparam integer W3 = 1; // Oldest

integer sum;
reg trend;
wire reset = ~rst_n;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        window <= 0;
        trend <= 0;
        out_reg <= 0;
    end else begin
        // Shift window, add newest bit at window[0] (oldest shifted away)
        window <= {window[2:0], in_bit};

        // Weighted sum: window[3] is most recent, window[0] is oldest
        sum = window[3]*W0 + window[2]*W1 + window[1]*W2 + window[0]*W3;

        // Hysteresis decision
        if (sum >= 8)
            trend <= 1;
        else if (sum < 4)
            trend <= 0;
        // else keep previous trend value (hysteresis)

        out_reg <= {7'd0, trend}; // uo_out[0] is the result; others 0
    end
end

endmodule
