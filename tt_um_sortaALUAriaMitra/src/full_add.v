module full_add (input a, input b, input carin, output sum, output carout);
	assign sum = a ^ b ^ carin;
	assign carout = (a&b) | (carin & (a^b));
endmodule
