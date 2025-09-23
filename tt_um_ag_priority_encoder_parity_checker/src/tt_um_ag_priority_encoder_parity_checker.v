/*
 * Copyright (c) 2025 Arun Goud
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * tt_um_ag_priority_encoder_parity_checker.v
 *
 * 9-to-4 priority encoder with parity checker module
 *
 * Author: arun-goud
 */

`default_nettype none

module tt_um_ag_priority_encoder_parity_checker (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  reg [3:0] prencode;                   // 4-bit priority code
  reg [7:0] segment;                    // 7-segment output code
  reg parity;                           // Parity output bit
  wire [8:0] data_in;
  assign data_in = {uio_in[0], ui_in};  // 9-bit binary input

  always @(posedge clk) begin
    // MSB higher priority when uio_in[1] == 0
    if(~uio_in[1]) begin
      casex (data_in)
        9'b000000001: begin
                        prencode <= 4'd1; 
                        segment <= 8'b00000110;
                      end
        9'b00000001x: begin
                        prencode <= 4'd2; 
                        segment <= 8'b01011011;
                      end
        9'b0000001xx: begin
                        prencode <= 4'd3; 
                        segment <= 8'b01001111;
                      end
        9'b000001xxx: begin
                        prencode <= 4'd4; 
                        segment <= 8'b01100110;
                      end
        9'b00001xxxx: begin
                        prencode <= 4'd5; 
                        segment <= 8'b01101101;
                      end
        9'b0001xxxxx: begin
                        prencode <= 4'd6; 
                        segment <= 8'b01111101;
                      end
        9'b001xxxxxx: begin
                        prencode <= 4'd7; 
                        segment <= 8'b00000111;
                      end
        9'b01xxxxxxx: begin
                        prencode <= 4'd8; 
                        segment <= 8'b01111111;
                      end
        9'b1xxxxxxxx: begin
                        prencode <= 4'd9; 
                        segment <= 8'b01101111;
                      end
        default:      begin
                        prencode <= 4'd0; 
                        segment <= 8'b00111111;
                      end
      endcase
    end
    // LSB higher priority when uio_in[1] == 1
    else begin
      casex (data_in)
        9'bxxxxxxxx1: begin
                        prencode <= 4'd1; 
                        segment <= 8'b00000110;
                      end
        9'bxxxxxxx10: begin
                        prencode <= 4'd2; 
                        segment <= 8'b01011011;
                      end
        9'bxxxxxx100: begin
                        prencode <= 4'd3; 
                        segment <= 8'b01001111;
                      end
        9'bxxxxx1000: begin
                        prencode <= 4'd4; 
                        segment <= 8'b01100110;
                      end
        9'bxxxx10000: begin
                        prencode <= 4'd5; 
                        segment <= 8'b01101101;
                      end
        9'bxxx100000: begin
                        prencode <= 4'd6; 
                        segment <= 8'b01111101;
                      end
        9'bxx1000000: begin
                        prencode <= 4'd7; 
                        segment <= 8'b00000111;
                      end
        9'bx10000000: begin
                        prencode <= 4'd8; 
                        segment <= 8'b01111111;
                      end
        9'b100000000: begin
                        prencode <= 4'd9; 
                        segment <= 8'b01101111;
                      end
        default:      begin
                        prencode <= 4'd0; 
                        segment <= 8'b00111111;
                      end
      endcase
    end
    // Parity check:
    // When uio_in[2] == 0, output=1 for even parity and 0 for odd parity
    // When uio_in[2] == 1, output=1 for odd parity and 0 for even parity
    parity <= uio_in[2] ? ^data_in : ~^data_in;
    segment[7] <= parity;                     // Output parity bit to DP pin of 7-segment display
  end

  assign uo_out = segment;                    // Output 7-segment code on output pins
  assign uio_out = {prencode, parity, 3'b0};  // Upper 5 bits for output
  assign uio_oe = 8'b11111000;                // Lower 3 bits for input

  // Avoid linter warning about unused pins:
  wire _unused_pins = &{ena, rst_n, 1'b0};

endmodule  // tt_um_ag_priority_encoder_parity_checker
