module four_add (input [3:0] a, input [3:0] b, input carin, output [3:0] sum, output carout);
	wire c1, c2, c3, c4;
	full_add v1 (.a(a[0]), .b(b[0]), .carin(carin), .sum(sum[0]), .carout(c1));
	full_add v2 (.a(a[1]), .b(b[1]), .carin(c1), .sum(sum[1]), .carout(c2));
full_add v3 (.a(a[2]), .b(b[2]), .carin(c2), .sum(sum[2]), .carout(c3));
full_add v4 (.a(a[3]), .b(b[3]), .carin(c3), .sum(sum[3]), .carout(c4));
assign carout = c4;
endmodule
