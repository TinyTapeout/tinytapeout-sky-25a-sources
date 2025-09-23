`timescale 1ns / 1ps
/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 07/18/2025
 * Module Name: RCA
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   This is a ripple carry adder. This is used to sum multiple input bits.  The longterm goal is 
 *   to use this as a submodule and create a square root carry select adder.
 * 
 * Dependencies:
 *   FCA, HCA
 * 
 * Additional Comments: 
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


module RCA 
#(
    parameter WIDTH = 10, // width of addr
    parameter ADD1  = 0,  // this parameter is used if the value is just adding 1 and a number note, this is inefficient
    parameter C     = 0   // this is the C_in. Its primarally used to choose what HCA to start with
)
(
    input  wire [WIDTH-1:0] A   ,
    input  wire [WIDTH-1:0] B   ,

    output wire [WIDTH-1:0] SUM  ,
    output wire             C_OUT
);

wire [WIDTH-1:0] c_stage;

generate
    if(ADD1) begin : G_0_C
        assign SUM[0]     = ~A[0];
        assign c_stage[0] =  A[0];
    end else begin : G_0_HCA
       HCA #(C) hca_stage_0(.A(A[0]), .B(B[0]), .SUM(SUM[0]), .C_OUT(c_stage[0]));
    end
endgenerate

generate
    if(ADD1) begin : G_N_C
        /** Generate HCA for all stages since inputs should all be 0 */
        for(genvar i = 1; i < WIDTH; i++) begin : SN
            HCA hca_stage_n(.A(A[i]), .B(c_stage[i-1]), .SUM(SUM[i]), .C_OUT(c_stage[i]));
        end
    end else begin : G_N_FCA
        /** Generate FCA for all stages beyond the first stage. Note, this is using the c_value
         *  from the previous stage as C_IN. */
        for(genvar i = 1; i < WIDTH; i++) begin : SN
            FCA fca_stage_n(.A(A[i]), .B(B[i]), .C_IN(c_stage[i-1]), .SUM(SUM[i]), .C_OUT(c_stage[i]));
        end
    end
endgenerate

/* Assign the cout of the RCA to the last c_out of the FCA stages */
assign C_OUT = c_stage[WIDTH-1];

endmodule
