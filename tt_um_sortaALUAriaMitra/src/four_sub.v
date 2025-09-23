module four_sub (input [3:0] a, input [3:0] b, output [3:0] sub);
	wire [3:0] neg;
	wire c;
	two_comp b1 (.num(b), .negnum(neg));
  four_add v1 (.a(a), .b(neg), .carin(0), .sum(sub), .carout(c));
endmodule

