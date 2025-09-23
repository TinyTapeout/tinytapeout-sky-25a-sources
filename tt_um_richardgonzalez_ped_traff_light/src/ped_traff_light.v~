module ped_traff_light (
	input wire clk,
	input wire reset,
	output wire green_light,
	output wire red_light,
	output wire [1:0] countdown
);


wire tick;

clock_divider my_divider (
	.clk(clk),
	.reset(reset),
	.tick(tick)
);

light_clock my_light_clock (
	.tick(tick),
	.reset(reset),
	.green_light(green_light),
	.red_light(red_light),
	.countdown(countdown)
);

endmodule

