/*
 * Copyright (c) 2024 Ciecen Lestari
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_sc_bipolar_qif_neuron (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    sc_bi_qif_tto QIF_Neuron(.clk(clk), 
                             .rst_n(rst_n), 
                             .b_input({uio_in[0], ui_in[7:0]}), 
                             .out_count({uio_out[7], uo_out[7:0]})
                            );
    
  // All output pins must be assigned. If not used, assign to 0.
    assign uio_oe[7]  = 1;
    assign uio_oe[6:1] = 6'b000000;
    assign uio_oe[0] = 0;
    assign uio_out[6:0] = 7'b0000000;
    
  // List all unused inputs to prevent warnings
    wire _unused = &{ena, uio_in[7:1], 1'b0}; // uio_oe, uio_out, uio_in

endmodule

//Bipolar SC QIF Neuron Model with the LFSR and bitlength parameterized to same value,
// can also modify them to be different lengths, but watch out for lfsr decorrelation
// and limit issues.

module sc_bi_qif_tto(clk, rst_n, b_input, out_count);
input wire clk, rst_n;
parameter [3:0] N = 4'd9; //bitlength of integrator counter and input/output
parameter [3:0] LFSR_N = N;// bitlength of lfsr, cannot be lower than N or 4 (due to how I coded the lfsr comparison arrangement)

input wire [N-1:0] b_input;
output reg [N-1:0] out_count;

reg [N-1:0] int_count;
reg [LFSR_N-1:0] lfsr;
reg next_lfsr;
reg add_scbit, mul_scbit, int_scbit, int_scbit_two, add_sel, b_scbit;
parameter [LFSR_N-1:0] LFSR_SEED = (2**LFSR_N)-1-(2**(LFSR_N)/7); //Arbitrary seed
parameter [N-1:0] FULL_COUNTER = ((2**(N))-1); 
parameter [N-1:0] HALF_COUNTER = (2**(N-1)); 

    always@(posedge clk or negedge rst_n) begin
        if (rst_n == 0) begin
        int_count <= 0; // Integrator Counter
        
        lfsr <= LFSR_SEED; // LFSR Set seed
        next_lfsr <= 0; // Reset next lfsr value
        add_scbit <= 0;
        mul_scbit <= 0;
        int_scbit <= 0;
        int_scbit_two <= 0;
        add_sel <= 0;
        b_scbit <= 0;
        
        out_count <= 0;
    end
    else begin
        
        //Reset
        //Force a reset when hitting the limit so you dont have to wait for another add = 1
        if (int_count == FULL_COUNTER) begin 
            int_count <= 0;
            next_lfsr <= 0; // Reset next lfsr value, important to keep the lfsr repeating sequences
        end
        else begin
            //LFSR Behavior
            next_lfsr <= lfsr[LFSR_N-1] ^ lfsr[LFSR_N-4]; //LFSR
            lfsr[LFSR_N-1:0] <= {lfsr[LFSR_N-2:0], next_lfsr}; // Next LFSR value
            
            //Integrator Behavior
            // Hold a limit so that the counter can go under 0 and reset to full value
            if(add_scbit == 1) begin
                int_count <= int_count + 1'b1;
            end
            else if ((add_scbit == 0) && (int_count != 0)) begin
                int_count <= int_count - 1'b1;
            end
            
            //Comparison to generate sc bits
            //Scrambling assumes there are at least 4 bits.
            add_sel <= (HALF_COUNTER > {lfsr[N-3:0], lfsr[N-1], lfsr[N-2]}); 
            b_scbit <= (b_input > {lfsr[N-4:0],lfsr[N-1:N-3]});
            int_scbit <= (int_count > lfsr[N-1:0]);
            
            // Multiply and Adding
            mul_scbit <= !(int_scbit ^ int_scbit_two);
            add_scbit <= (add_sel? mul_scbit: b_scbit);
            int_scbit_two <= int_scbit;
           
        end
        
        out_count <= int_count;
    end
end

endmodule


