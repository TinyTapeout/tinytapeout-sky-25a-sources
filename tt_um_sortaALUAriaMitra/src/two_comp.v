module two_comp (input [3:0] num, output [3:0] negnum);
	wire [3:0] temp;
	wire c;
	assign temp = ~num;
	four_add v1 (.a(temp), .b(4'b0), .carin(1), .sum(negnum), .carout(c));
endmodule
