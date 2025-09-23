module mult (input [3:0] x, input [3:0] y, output [7:0] z);
	wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;
	wire s1, s21, s22, s31, s32, s4;
	assign z[0] = x[0] & y[0];
	half_add h1 (.a(x[1]&y[0]), .b(x[0]&y[1]), .sum(z[1]), .carry(c1));
	full_add f1 (.a(x[2]&y[0]),.b(x[1]&y[1]), .carin(c1), .sum(s1), .carout(c2));
	half_add h2(.a(s1), .b(x[0]&y[2]), .sum(z[2]), .carry(c3));
	full_add f2 (.a(x[3]&y[0]), .b(x[2]&y[1]), .carin(c2), .sum(s21), .carout(c4));
	full_add f21 (.a(s21), .b(x[1]&y[2]), .carin(c3), .sum(s22), .carout(c5));
	half_add h3 (.a(s22), .b(x[0]&y[3]), .sum(z[3]), .carry(c6));
	half_add h4 (.a(x[3]&y[1]), .b(c4), .sum(s31), .carry(c7));
	full_add f4 (.a(s31), .b(x[2]&y[2]), .carin(c5), .sum(s32), .carout(c8));
	full_add f41 (.a(s32), .b(x[1]&y[3]), .carin(c6), .sum(z[4]), .carout(c9));
	full_add f5 (.a(c7), .b(x[3]&y[2]), .carin(c8), .sum(s4), .carout(c10));
	full_add f51 (.a(s4), .b(x[2]&y[3]), .carin(c9), .sum(z[5]), .carout(c11));
	full_add f6 (.a(c10), .b(x[3]&y[3]), .carin(c11), .sum(z[6]), .carout(z[7]));
endmodule

