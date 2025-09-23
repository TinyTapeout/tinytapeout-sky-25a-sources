module clock_divider (
	input wire clk,
	input wire reset,
	output reg tick
);

reg [23:0] counter;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		counter <= 0;
		tick <= 0;
	end else begin
		if (counter == 15) begin
			tick <= 1;
			counter <= 0;
		end else begin
			tick <= 0;
			counter <= counter + 1;
		end
	end
end

endmodule
