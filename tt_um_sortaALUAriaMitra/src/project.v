/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_sortaALUAriaMitra (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
    assign uio_out = 0;
    assign uio_oe  = 0;
    wire [3:0] A,B;
	wire temp;
	wire [3:0] add, negA, negB, sub;
	wire [7:0] multi;
	reg [7:0] result;
	assign uo_out = result;
	assign A = ui_in [7:4];
	assign B = ui_in [3:0];
    four_add v1(.a(A), .b(B), .carin(0), .sum(add), .carout(temp));
    two_comp v2(.num(A), .negnum(negA));
    two_comp v3(.num(B), .negnum(negB));
    four_sub v4(.a(A), .b(B), .sub(sub));
    mult v5(.x(A), .y(B), .z(multi));
	always @(*) begin
		if (uio_in[7]) begin //addition
			result [7:4] = add;
			result [3:0] = 0;
		end
		else if (uio_in[6]) begin //negative of A
			result[7:4] = negA;
			result [3:0] = 0;
		end
        else if (uio_in[5]) begin //negative of B
	        result[7:4] = negB;
	        result [3:0] = 0;
        end
        else if (uio_in[4]) begin //subtraction
	        result[7:4] = sub;
	        result [3:0] = 0;
        end
        else if (uio_in[3]) begin //multiplication - takes all out pins
	        result = multi;
        end
        else if (uio_in[2]) begin //and
	        result[7:4] = A &B;
            result [3:0] = 0;
        end
        else if (uio_in[1]) begin //or
	        result[7:4] = A|B;
	        result [3:0] = 0;
        end
        else if (uio_in[0]) begin //xor
        	result[7:4] = A^B;
        	result [3:0] = 0;
        end
        else begin
        	result = 0;
        end
    end



  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
