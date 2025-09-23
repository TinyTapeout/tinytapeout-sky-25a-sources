/*
 * Copyright (c) 2025 Alida Bruka
 * SPDX-License-Identifier: Apache-2.0
 */

module DutyCycleMeter(

    input wire clk,              // Clock di sistema (es. 100 MHz)
    input wire rst,           // Reset asincrono attivo basso
    input wire sig_in,          // Segnale da misurare
    output reg [6:0] duty_out,  // Duty cycle in scala 0-127 (7 bit)
    output reg valid            // Segnale di validità misura
);

    // Stati FSM
    parameter IDLE    = 2'b00;
    parameter MEASURE = 2'b01;
    parameter CALC    = 2'b10;

    reg [1:0] state, next_state;

    // Edge detector
    reg sig_d1, sig_d2;
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            sig_d1 <= 0;
            sig_d2 <= 0;
        end else begin
            sig_d1 <= sig_in;
            sig_d2 <= sig_d1;
        end
    end

    wire rising_edge  = (sig_d1 & ~sig_d2);

    // Contatori
    reg [10:0] ton_counter = 0;
    reg [10:0] tperiod_counter = 0;
    reg [10:0] ton_latched = 0;
    reg [10:0] tperiod_latched = 0;

    // FSM: transizione di stato
    always @(posedge clk or negedge rst) begin
        if (!rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // FSM: logica di transizione
    always @(*) begin
        case (state)
            IDLE:
                if (rising_edge) next_state = MEASURE;
                else             next_state = IDLE;

            MEASURE:
                if (rising_edge) next_state = CALC;
                else             next_state = MEASURE;

            CALC:
                next_state = IDLE;

            default:
                next_state = IDLE;
        endcase
    end

    // FSM: logica di uscita
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            ton_counter <= 0;
            tperiod_counter <= 0;
            duty_out <= 0;
            valid <= 0;
            ton_latched <= 0;
            tperiod_latched <= 0;
        end else begin
            valid <= 0;
            case (state)
                IDLE: begin
                    ton_counter <= 0;
                    tperiod_counter <= 0;
                end

                MEASURE: begin
                    tperiod_counter <= tperiod_counter + 1;
                    if (sig_in)
                        ton_counter <= ton_counter + 1;
                end

                CALC: begin
                    ton_latched <= ton_counter;
                    tperiod_latched <= tperiod_counter;
                    if (tperiod_counter != 0) begin
//                        duty_out <= (ton_counter * 127) / tperiod_counter;
			duty_out <= (ton_latched << 7) / tperiod_latched;
                        valid <= 1;
                    end else begin
                        duty_out <= 0;
                    end
                end
            endcase
        end
    end
endmodule 
