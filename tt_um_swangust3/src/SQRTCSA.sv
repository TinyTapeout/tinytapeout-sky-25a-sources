`timescale 1ns / 1ps
/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * Engineer: Gustaf Swansen
 * 
 * Create Date: 07/18/2025
 * Module Name: SQRTCSA
 * Target Devices: Aller A7 FPGA Board with M.2 Interface
 * Tool Versions: Vivado 2025.1
 * Description: 
 *   This module is a square root carry select adder SQRTCSA. This module is used to add two inputs
 *   of multiple bit widths. The intention of SQRTCSA is to minimize the critical path of the 
 *   addition circuit by adding additional logic.
 * 
 * Dependencies:
 *   RCA, FCA, HCA
 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */


module SQRTCSA 
#(
    parameter WIDTH = 10
)
(
    input  wire [WIDTH-1:0] A   ,
    input  wire [WIDTH-1:0] B   ,

    output wire [WIDTH-1:0] SUM  ,
    output wire             C_OUT
);
wire c_stage_0;
wire c_stage_1;
wire c_stage_2;
wire c_stage_3;
wire c_stage_4;
wire c_stage_5;
wire c_stage_6;
wire c_stage_7;

/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Stage 0 of SQRTCSA
 * P=[HA,FCA]
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

RCA #(.WIDTH(2), .C(0)) RCA_STAGE_0 (.A(A[1:0]), .B(B[1:0]), .SUM(SUM[1:0]), .C_OUT(c_stage_0));

generate

/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Stage 1 of SQRTCSA
 * P=[HA, FCA, MUX1]
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

if (WIDTH > 2) begin : S1
    if (WIDTH > 4) begin : W1

        wire [1:0] sum_stage_1_0;
        wire [1:0] sum_stage_1_1;
        wire       c_stage_1_0;
        wire       c_stage_1_1;

        RCA #(.WIDTH(2), .C(0)) RCA_A_0 (.A(A[3:2]), .B(B[3:2]), .SUM(sum_stage_1_0), .C_OUT(c_stage_1_0));
        RCA #(.WIDTH(2), .C(1)) RCA_B_0 (.A(A[3:2]), .B(B[3:2]), .SUM(sum_stage_1_1), .C_OUT(c_stage_1_1));

        assign SUM[3:2]  = c_stage_0 ? sum_stage_1_1 : sum_stage_1_0;
        assign c_stage_1 = c_stage_0 ?   c_stage_1_1 :   c_stage_1_0;

    end else begin : W0

        wire [WIDTH-3:0] sum_stage_1_0;
        wire [WIDTH-3:0] sum_stage_1_1;
        wire             c_stage_1_0;
        wire             c_stage_1_1;

        RCA #(.WIDTH(WIDTH-2), .C(0)) RCA_A_0 (.A(A[WIDTH-1:2]), .B(B[WIDTH-1:2]), .SUM(sum_stage_1_0), .C_OUT(c_stage_1_0));
        RCA #(.WIDTH(WIDTH-2), .C(1)) RCA_B_0 (.A(A[WIDTH-1:2]), .B(B[WIDTH-1:2]), .SUM(sum_stage_1_1), .C_OUT(c_stage_1_1));

        assign SUM[WIDTH-1:2] = c_stage_0 ? sum_stage_1_1 : sum_stage_1_0;
        assign C_OUT          = c_stage_0 ?   c_stage_1_1 :   c_stage_1_0;
    end
end


/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Stage 2 of SQRTCSA
 * P=[HA, FCA, MUX1, MUX1]
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

if (WIDTH > 4) begin : S2
    if (WIDTH > 7) begin : W1

        wire [2:0] sum_stage_2_0;
        wire [2:0] sum_stage_2_1;
        wire           c_stage_2_0;
        wire           c_stage_2_1;

        RCA #(.WIDTH(3), .C(0)) RCA_A_1 (.A(A[6:4]), .B(B[6:4]), .SUM(sum_stage_2_0), .C_OUT(c_stage_2_0));
        RCA #(.WIDTH(3), .C(1)) RCA_B_1 (.A(A[6:4]), .B(B[6:4]), .SUM(sum_stage_2_1), .C_OUT(c_stage_2_1));

        assign SUM[6:4]  = c_stage_1 ? sum_stage_2_1 : sum_stage_2_0;
        assign c_stage_2 = c_stage_1 ?   c_stage_2_1 :   c_stage_2_0;

    end else begin : W0

        wire [WIDTH-5:0] sum_stage_2_0;
        wire [WIDTH-5:0] sum_stage_2_1;
        wire           c_stage_2_0;
        wire           c_stage_2_1;

        RCA #(.WIDTH(WIDTH-4), .C(0)) RCA_A_1 (.A(A[WIDTH-1:4]), .B(B[WIDTH-1:4]), .SUM(sum_stage_2_0), .C_OUT(c_stage_2_0));
        RCA #(.WIDTH(WIDTH-4), .C(1)) RCA_B_1 (.A(A[WIDTH-1:4]), .B(B[WIDTH-1:4]), .SUM(sum_stage_2_1), .C_OUT(c_stage_2_1));

        assign SUM[WIDTH-1:4] = c_stage_1 ? sum_stage_2_1 : sum_stage_2_0;
        assign C_OUT          = c_stage_1 ?   c_stage_2_1 :   c_stage_2_0;

    end
end


/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Stage 3 of SQRTCSA
 * P=[HA, FCA, MUX1, MUX1, MUX1]
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

if (WIDTH > 7) begin : S3
    if (WIDTH > 11) begin : W1

        wire [3:0] sum_stage_3_0;
        wire [3:0] sum_stage_3_1;
        wire           c_stage_3_0;
        wire           c_stage_3_1;

        RCA #(.WIDTH(4), .C(0)) RCA_A_2 (.A(A[10:7]), .B(B[10:7]), .SUM(sum_stage_3_0), .C_OUT(c_stage_3_0));
        RCA #(.WIDTH(4), .C(1)) RCA_B_2 (.A(A[10:7]), .B(B[10:7]), .SUM(sum_stage_3_1), .C_OUT(c_stage_3_1));

        assign SUM[10:7] = c_stage_2 ? sum_stage_3_1 : sum_stage_3_0;
        assign c_stage_3 = c_stage_2 ?   c_stage_3_1 :   c_stage_3_0;

    end else begin : W0

        wire [WIDTH-8:0] sum_stage_3_0;
        wire [WIDTH-8:0] sum_stage_3_1;
        wire             c_stage_3_0;
        wire             c_stage_3_1;

        RCA #(.WIDTH(WIDTH-7), .C(0)) RCA_A_2 (.A(A[WIDTH-1:7]), .B(B[WIDTH-1:7]), .SUM(sum_stage_3_0), .C_OUT(c_stage_3_0));
        RCA #(.WIDTH(WIDTH-7), .C(1)) RCA_B_2 (.A(A[WIDTH-1:7]), .B(B[WIDTH-1:7]), .SUM(sum_stage_3_1), .C_OUT(c_stage_3_1));

        assign SUM[WIDTH-1:7] = c_stage_2 ? sum_stage_3_1 : sum_stage_3_0;
        assign C_OUT          = c_stage_2 ?   c_stage_3_1 :   c_stage_3_0;
    end
end


/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Stage 4 of SQRTCSA
 * P=[HA, FCA, MUX1, MUX1, MUX1, MUX1]
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

if (WIDTH > 11) begin : S4
    if (WIDTH > 16) begin : W1

        wire [4:0] sum_stage_4_0;
        wire [4:0] sum_stage_4_1;
        wire       c_stage_4_0;
        wire       c_stage_4_1;

        RCA #(.WIDTH(5), .C(0)) RCA_A_3 (.A(A[15:11]), .B(B[15:11]), .SUM(sum_stage_4_0), .C_OUT(c_stage_4_0));
        RCA #(.WIDTH(5), .C(1)) RCA_B_3 (.A(A[15:11]), .B(B[15:11]), .SUM(sum_stage_4_1), .C_OUT(c_stage_4_1));

        assign SUM[15:11] = c_stage_3 ? sum_stage_4_1 : sum_stage_4_0;
        assign c_stage_4  = c_stage_3 ?   c_stage_4_1 :   c_stage_4_0;

    end else begin : W0

        wire [WIDTH-12:0] sum_stage_4_0;
        wire [WIDTH-12:0] sum_stage_4_1;
        wire              c_stage_4_0;
        wire              c_stage_4_1;

        RCA #(.WIDTH(WIDTH-11), .C(0)) RCA_A_3 (.A(A[WIDTH-1:11]), .B(B[WIDTH-1:11]), .SUM(sum_stage_4_0), .C_OUT(c_stage_4_0));
        RCA #(.WIDTH(WIDTH-11), .C(1)) RCA_B_3 (.A(A[WIDTH-1:11]), .B(B[WIDTH-1:11]), .SUM(sum_stage_4_1), .C_OUT(c_stage_4_1));

        assign SUM[WIDTH-1:11] = c_stage_3 ? sum_stage_4_1 : sum_stage_4_0;
        assign C_OUT           = c_stage_3 ?   c_stage_4_1 :   c_stage_4_0;
    end
end


/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Stage 5 of SQRTCSA
 * P=[HA, FCA, MUX1, MUX1, MUX1, MUX1, MUX1]
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

if (WIDTH > 16) begin : S5
    if (WIDTH > 22) begin : W1

        wire [5:0] sum_stage_5_0;
        wire [5:0] sum_stage_5_1;
        wire       c_stage_5_0;
        wire       c_stage_5_1;

        RCA #(.WIDTH(6), .C(0)) RCA_A_4 (.A(A[21:16]), .B(B[21:16]), .SUM(sum_stage_5_0), .C_OUT(c_stage_5_0));
        RCA #(.WIDTH(6), .C(1)) RCA_B_4 (.A(A[21:16]), .B(B[21:16]), .SUM(sum_stage_5_1), .C_OUT(c_stage_5_1));

        assign SUM[21:16] = c_stage_4 ? sum_stage_5_1 : sum_stage_5_0;
        assign c_stage_5  = c_stage_4 ?   c_stage_5_1 :   c_stage_5_0;

    end else begin : W0

        wire [WIDTH-17:0] sum_stage_5_0;
        wire [WIDTH-17:0] sum_stage_5_1;
        wire           c_stage_5_0;
        wire           c_stage_5_1;

        RCA #(.WIDTH(WIDTH-16), .C(0)) RCA_A_4 (.A(A[WIDTH-1:16]), .B(B[WIDTH-1:16]), .SUM(sum_stage_5_0), .C_OUT(c_stage_5_0));
        RCA #(.WIDTH(WIDTH-16), .C(1)) RCA_B_4 (.A(A[WIDTH-1:16]), .B(B[WIDTH-1:16]), .SUM(sum_stage_5_1), .C_OUT(c_stage_5_1));

        assign SUM[WIDTH-1:16] = c_stage_4 ? sum_stage_5_1 : sum_stage_5_0;
        assign C_OUT           = c_stage_4 ?   c_stage_5_1 :   c_stage_5_0;
    end
end


/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Stage 6 of SQRTCSA
 * P=[HA, FCA, MUX1, MUX1, MUX1, MUX1, MUX1, MUX1]
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

if (WIDTH > 22) begin : S6
    if (WIDTH > 29) begin : W1

        wire [6:0] sum_stage_6_0;
        wire [6:0] sum_stage_6_1;
        wire       c_stage_6_0;
        wire       c_stage_6_1;

        RCA #(.WIDTH(7), .C(0)) RCA_A_5 (.A(A[28:22]), .B(B[28:22]), .SUM(sum_stage_6_0), .C_OUT(c_stage_6_0));
        RCA #(.WIDTH(7), .C(1)) RCA_B_5 (.A(A[28:22]), .B(B[28:22]), .SUM(sum_stage_6_1), .C_OUT(c_stage_6_1));

        assign SUM[28:22] = c_stage_5 ? sum_stage_6_1 : sum_stage_6_0;
        assign c_stage_6 = c_stage_5 ?   c_stage_6_1 :   c_stage_6_0;

    end else begin : W0

        wire [WIDTH-23:0] sum_stage_6_0;
        wire [WIDTH-23:0] sum_stage_6_1;
        wire              c_stage_6_0;
        wire              c_stage_6_1;

        RCA #(.WIDTH(WIDTH-22), .C(0)) RCA_A_5 (.A(A[WIDTH-1:22]), .B(B[WIDTH-1:22]), .SUM(sum_stage_6_0), .C_OUT(c_stage_6_0));
        RCA #(.WIDTH(WIDTH-22), .C(1)) RCA_B_5 (.A(A[WIDTH-1:22]), .B(B[WIDTH-1:22]), .SUM(sum_stage_6_1), .C_OUT(c_stage_6_1));

        assign SUM[WIDTH-1:22] = c_stage_5 ? sum_stage_6_1 : sum_stage_6_0;
        assign C_OUT           = c_stage_5 ?   c_stage_6_1 :   c_stage_6_0;
    end
end


/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Stage 7 of SQRTCSA
 * P=[HA, FCA, MUX1, MUX1, MUX1, MUX1, MUX1, MUX1, MUX1]
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

if (WIDTH > 29) begin : S7
    if (WIDTH > 37) begin : W1

        wire [7:0] sum_stage_7_0;
        wire [7:0] sum_stage_7_1;
        wire       c_stage_7_0;
        wire       c_stage_7_1;

        RCA #(.WIDTH(8), .C(0)) RCA_A_6 (.A(A[36:29]), .B(B[36:29]), .SUM(sum_stage_7_0), .C_OUT(c_stage_7_0));
        RCA #(.WIDTH(8), .C(1)) RCA_B_6 (.A(A[36:29]), .B(B[36:29]), .SUM(sum_stage_7_1), .C_OUT(c_stage_7_1));

        assign SUM[36:29] = c_stage_6 ? sum_stage_7_1 : sum_stage_7_0;
        assign c_stage_7  = c_stage_6 ?   c_stage_7_1 :   c_stage_7_0;

    end else begin : W0

        wire [WIDTH-30:0] sum_stage_7_0;
        wire [WIDTH-30:0] sum_stage_7_1;
        wire              c_stage_7_0;
        wire              c_stage_7_1;

        RCA #(.WIDTH(WIDTH-29), .C(0)) RCA_A_6 (.A(A[WIDTH-1:29]), .B(B[WIDTH-1:29]), .SUM(sum_stage_7_0), .C_OUT(c_stage_7_0));
        RCA #(.WIDTH(WIDTH-29), .C(1)) RCA_B_6 (.A(A[WIDTH-1:29]), .B(B[WIDTH-1:29]), .SUM(sum_stage_7_1), .C_OUT(c_stage_7_1));

        assign SUM[WIDTH-1:29] = c_stage_6 ? sum_stage_7_1 : sum_stage_7_0;
        assign C_OUT           = c_stage_6 ?   c_stage_7_1 :   c_stage_7_0;
    end
end

endgenerate

endmodule