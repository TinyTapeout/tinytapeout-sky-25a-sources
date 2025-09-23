`timescale 1ns / 1ps

/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 08/14/2025
 * Module Name: scale_and_add
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   This module takes two decoded posits and adds them together.
 * Path Length : 
 *    [SUB4, SHIFT4, ADD12, MUX1] 
 * Dependencies:
 *   TODO add Dependencies
 * 
 * Additional Comments: 
 *   This code has its own testbench
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

module scale_and_add #(
    parameter SPEED = 0
    )(
    input  wire signed [ 3:0] SCALE_A,
    input  wire signed [ 3:0] SCALE_B,
    input  wire signed [11:0] FRAC_A,
    input  wire signed [11:0] FRAC_B,
    
    output wire [ 3:0] SCALE_C,
    output wire [11:0] FRAC_C
    );
generate 
if(SPEED) begin : G_SPD
    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Calculate everything assuming A is greater than B. This cost more logic but is a shorter
     * critical path
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    wire        [ 3:0] scale_sub_a;
    wire signed [11:0] frac_shift_a;
    wire signed [11:0] frac_sum_a;

    SUB #(.WIDTH(4), .TYPE("RCA")) sub_scale_sub_a (.A(SCALE_A), .B(SCALE_B), .SUM(scale_sub_a), .C());        // P=[SUB4]
    assign frac_shift_a = FRAC_B >>> scale_sub_a;                                                              // P=[SUB4, SHIFT4]
    ADD #(.WIDTH(12), .TYPE("SQRTCSA")) add_frac_sum_a (.A(FRAC_A), .B(frac_shift_a), .SUM(frac_sum_a), .C()); // P=[SUB4, SHIFT4, ADD12]

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Calculate everything assuming B is greater than A. This cost more logic but is a shorter
     * critical path
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    wire        [ 3:0] scale_sub_b;
    wire signed [11:0] frac_shift_b;
    wire signed [11:0] frac_sum_b;

    SUB #(.WIDTH(4), .TYPE("RCA")) sub_scale_sub_b (.A(SCALE_B), .B(SCALE_A), .SUM(scale_sub_b), .C());        // P=[SUB4]
    assign frac_shift_b = FRAC_A >>> scale_sub_b;                                                              // P=[SUB4, SHIFT4]
    ADD #(.WIDTH(12), .TYPE("SQRTCSA")) add_frac_sum_b (.A(FRAC_B), .B(frac_shift_b), .SUM(frac_sum_b), .C()); // P=[SUB4, SHIFT4, ADD12]

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * Mux the outputs of the two paths
     * TODO Would be nice to find a way to avoid the GT signal
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

    wire a_gt_b;
    
    assign a_gt_b = (SCALE_A > SCALE_B);               // P=[GT]
    assign SCALE_C = a_gt_b ? SCALE_A    : SCALE_B;    // P=[GT, MUX1]
    assign FRAC_C  = a_gt_b ? frac_sum_a : frac_sum_b; // P=[SUB4, SHIFT4, ADD12, MUX1], [SUB4, SHIFT4, ADD12] > [GT, MUX1]

end else begin : G_SLW

    /** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
     * First version of the code which uses less logic but is slower
     * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
    wire [3:0] min_scale;
    wire [3:0] max_scale;
    wire [3:0] sum_scale;
    
    assign min_scale = (SCALE_A > SCALE_B) ? SCALE_A : SCALE_B; // P=[GT, MUX1]
    assign max_scale = (SCALE_A > SCALE_B) ? SCALE_B : SCALE_A; // P=[GT, MUX1]
    
    assign SCALE_C = max_scale; // P=[GT, MUX1]
    
    SUB #(.WIDTH(4), .TYPE("RCA")) sub_scale (.A(max_scale), .B(min_scale), .SUM(sum_scale), .C()); // P=[GT, MUX1, SUB4]
    
    wire signed [11:0] min_frac;
    wire [11:0] max_frac;
    wire [11:0] scaled_frac;
    
    assign min_frac = (SCALE_A > SCALE_B) ? FRAC_A : FRAC_B;                                          // P=[GT, MUX1]
    assign max_frac = (SCALE_A > SCALE_B) ? FRAC_B : FRAC_A;                                          // P=[GT, MUX1]
    assign scaled_frac = min_frac >>> sum_scale;                                                      // P=[GT, MUX1, SUB4, SHIFT4]
    ADD #(.WIDTH(12), .TYPE("SQRTCSA")) add_frac (.A(max_frac), .B(scaled_frac), .SUM(FRAC_C), .C()); // P=[GT, MUX1, SUB4, SHIFT4, ADD12]
end
endgenerate


endmodule