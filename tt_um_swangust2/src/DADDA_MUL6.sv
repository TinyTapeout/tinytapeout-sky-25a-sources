module DADDA_MUL6
#(
	parameter WIDTH = 6
)
(
	input  wire [WIDTH  -1:0] A     , // Multiplication Factors A
	input  wire [WIDTH  -1:0] B     , // Multiplication Factors B

	output wire [WIDTH*2-1:0] PROD    // Multiplication Product
);

/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Dadda Stage 0
 * <Multiplier Row>_<Row Element Index> 
 * 
 * Column[10] F_05 
 * Column[09] E_05 F_04 
 * Column[08] D_05 E_04 F_03 
 * Column[07] C_05 D_04 E_03 F_02 
 * Column[06] B_05 C_04 D_03 E_02 F_01 
 * Column[05] A_05 B_04 C_03 D_02 E_01 F_00 
 * Column[04] A_04 B_03 C_02 D_01 E_00 
 * Column[03] A_03 B_02 C_01 D_00 
 * Column[02] A_02 B_01 C_00 
 * Column[01] A_01 B_00 
 * Column[00] A_00 
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

wire A_00; assign A_00 = A[0] & B[0];
wire A_01; assign A_01 = A[1] & B[0];
wire A_02; assign A_02 = A[2] & B[0];
wire A_03; assign A_03 = A[3] & B[0];
wire A_04; assign A_04 = A[4] & B[0];
wire A_05; assign A_05 = A[5] & B[0];

wire B_00; assign B_00 = A[0] & B[1];
wire B_01; assign B_01 = A[1] & B[1];
wire B_02; assign B_02 = A[2] & B[1];
wire B_03; assign B_03 = A[3] & B[1];
wire B_04; assign B_04 = A[4] & B[1];
wire B_05; assign B_05 = A[5] & B[1];

wire C_00; assign C_00 = A[0] & B[2];
wire C_01; assign C_01 = A[1] & B[2];
wire C_02; assign C_02 = A[2] & B[2];
wire C_03; assign C_03 = A[3] & B[2];
wire C_04; assign C_04 = A[4] & B[2];
wire C_05; assign C_05 = A[5] & B[2];

wire D_00; assign D_00 = A[0] & B[3];
wire D_01; assign D_01 = A[1] & B[3];
wire D_02; assign D_02 = A[2] & B[3];
wire D_03; assign D_03 = A[3] & B[3];
wire D_04; assign D_04 = A[4] & B[3];
wire D_05; assign D_05 = A[5] & B[3];

wire E_00; assign E_00 = A[0] & B[4];
wire E_01; assign E_01 = A[1] & B[4];
wire E_02; assign E_02 = A[2] & B[4];
wire E_03; assign E_03 = A[3] & B[4];
wire E_04; assign E_04 = A[4] & B[4];
wire E_05; assign E_05 = A[5] & B[4];

wire F_00; assign F_00 = A[0] & B[5];
wire F_01; assign F_01 = A[1] & B[5];
wire F_02; assign F_02 = A[2] & B[5];
wire F_03; assign F_03 = A[3] & B[5];
wire F_04; assign F_04 = A[4] & B[5];
wire F_05; assign F_05 = A[5] & B[5];

/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Dadda Stage 1, d4
 * "Su" = Sum, "Co" = Carry out
 * 
 * (Su00, Co00) = A_04 + B_03
 * (Su01, Co01) = A_05 + B_04 + C_03
 * (Su02, Co02) = D_02 + E_01
 * (Su03, Co03) = B_05 + C_04 + D_03
 * (Su04, Co04) = E_02 + F_01
 * (Su05, Co05) = C_05 + D_04 + E_03
 * 
 * Column[10] F_05 
 * Column[09] E_05 F_04 
 * Column[08] D_05 E_04 F_03 Co05 
 * Column[07] F_02 Co03 Co04 Su05 
 * Column[06] Co01 Co02 Su03 Su04 
 * Column[05] F_00 Co00 Su01 Su02 
 * Column[04] C_02 D_01 E_00 Su00 
 * Column[03] A_03 B_02 C_01 D_00 
 * Column[02] A_02 B_01 C_00 
 * Column[01] A_01 B_00 
 * Column[00] A_00 
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

wire Su00, Co00;
wire Su01, Co01;
wire Su02, Co02;
wire Su03, Co03;
wire Su04, Co04;
wire Su05, Co05;

HCA HCA000(.A(A_04), .B(B_03),              .SUM(Su00), .C_OUT(Co00));
FCA FCA000(.A(A_05), .B(B_04), .C_IN(C_03), .SUM(Su01), .C_OUT(Co01));
HCA HCA001(.A(D_02), .B(E_01),              .SUM(Su02), .C_OUT(Co02));
FCA FCA001(.A(B_05), .B(C_04), .C_IN(D_03), .SUM(Su03), .C_OUT(Co03));
HCA HCA002(.A(E_02), .B(F_01),              .SUM(Su04), .C_OUT(Co04));
FCA FCA002(.A(C_05), .B(D_04), .C_IN(E_03), .SUM(Su05), .C_OUT(Co05));

/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Dadda Stage 2, d3
 * "Su" = Sum, "Co" = Carry out
 * 
 * (Su06, Co06) = A_03 + B_02
 * (Su07, Co07) = C_02 + D_01 + E_00
 * (Su08, Co08) = F_00 + Co00 + Su01
 * (Su09, Co09) = Co01 + Co02 + Su03
 * (Su10, Co10) = F_02 + Co03 + Co04
 * (Su11, Co11) = D_05 + E_04 + F_03
 * 
 * Column[10] F_05 
 * Column[09] E_05 F_04 Co11 
 * Column[08] Co05 Co10 Su11 
 * Column[07] Su05 Co09 Su10 
 * Column[06] Su04 Co08 Su09 
 * Column[05] Su02 Co07 Su08 
 * Column[04] Su00 Co06 Su07 
 * Column[03] C_01 D_00 Su06 
 * Column[02] A_02 B_01 C_00 
 * Column[01] A_01 B_00 
 * Column[00] A_00 
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

wire Su06, Co06;
wire Su07, Co07;
wire Su08, Co08;
wire Su09, Co09;
wire Su10, Co10;
wire Su11, Co11;

HCA HCA003(.A(A_03), .B(B_02),              .SUM(Su06), .C_OUT(Co06));
FCA FCA003(.A(C_02), .B(D_01), .C_IN(E_00), .SUM(Su07), .C_OUT(Co07));
FCA FCA004(.A(F_00), .B(Co00), .C_IN(Su01), .SUM(Su08), .C_OUT(Co08));
FCA FCA005(.A(Co01), .B(Co02), .C_IN(Su03), .SUM(Su09), .C_OUT(Co09));
FCA FCA006(.A(F_02), .B(Co03), .C_IN(Co04), .SUM(Su10), .C_OUT(Co10));
FCA FCA007(.A(D_05), .B(E_04), .C_IN(F_03), .SUM(Su11), .C_OUT(Co11));

/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * Dadda Stage 3, d2
 * "Su" = Sum, "Co" = Carry out
 * 
 * (Su12, Co12) = A_02 + B_01
 * (Su13, Co13) = C_01 + D_00 + Su06
 * (Su14, Co14) = Su00 + Co06 + Su07
 * (Su15, Co15) = Su02 + Co07 + Su08
 * (Su16, Co16) = Su04 + Co08 + Su09
 * (Su17, Co17) = Su05 + Co09 + Su10
 * (Su18, Co18) = Co05 + Co10 + Su11
 * (Su19, Co19) = E_05 + F_04 + Co11
 * 
 * Column[10] F_05 Co19 
 * Column[09] Co18 Su19 
 * Column[08] Co17 Su18 
 * Column[07] Co16 Su17 
 * Column[06] Co15 Su16 
 * Column[05] Co14 Su15 
 * Column[04] Co13 Su14 
 * Column[03] Co12 Su13 
 * Column[02] C_00 Su12 
 * Column[01] A_01 B_00 
 * Column[00] A_00 
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

wire Su12, Co12;
wire Su13, Co13;
wire Su14, Co14;
wire Su15, Co15;
wire Su16, Co16;
wire Su17, Co17;
wire Su18, Co18;
wire Su19, Co19;

HCA HCA004(.A(A_02), .B(B_01),              .SUM(Su12), .C_OUT(Co12));
FCA FCA008(.A(C_01), .B(D_00), .C_IN(Su06), .SUM(Su13), .C_OUT(Co13));
FCA FCA009(.A(Su00), .B(Co06), .C_IN(Su07), .SUM(Su14), .C_OUT(Co14));
FCA FCA010(.A(Su02), .B(Co07), .C_IN(Su08), .SUM(Su15), .C_OUT(Co15));
FCA FCA011(.A(Su04), .B(Co08), .C_IN(Su09), .SUM(Su16), .C_OUT(Co16));
FCA FCA012(.A(Su05), .B(Co09), .C_IN(Su10), .SUM(Su17), .C_OUT(Co17));
FCA FCA013(.A(Co05), .B(Co10), .C_IN(Su11), .SUM(Su18), .C_OUT(Co18));
FCA FCA014(.A(E_05), .B(F_04), .C_IN(Co11), .SUM(Su19), .C_OUT(Co19));

/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
 * FCA = 15, HCA = 5
 * AND = 71, OR = 15, XOR = 35, Total = 121
 * MOS (Assuming NOT after AND/OR) = 796
 * MOS (SQRTCSA Estimate) = 612
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

wire [9:0]Su_final;
wire C_final;
ADD #(
	.TYPE("SQRTCSA"), 
	.WIDTH(10)
) ADD_0 (
	.A({F_05, Co18, Co17, Co16, Co15, Co14, Co13, Co12, C_00, A_01}), 
	.B({Co19, Su19, Su18, Su17, Su16, Su15, Su14, Su13, Su12, B_00}), 
	.SUM(Su_final), 
	.C(C_final)
);

assign PROD = {C_final, Su_final, A_00};

endmodule
