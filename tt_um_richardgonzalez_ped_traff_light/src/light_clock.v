module light_clock (
	input wire tick,
	input wire reset,
	output reg green_light,
	output reg red_light,
	output reg [1:0] countdown // shows 3,2,1, may change to a countdown from 10
);

reg mode; //0 will equal green, and 1 will equal red


always @(posedge tick or posedge reset) begin
	if (reset) begin 
		mode <= 0; //green
		countdown <= 3;
	end else begin
		if (countdown == 0) begin
			mode <= ~mode; //switch
			countdown <=3;
		end else begin
			countdown <= countdown -1;
		end
	end
end



always @(*) begin
	case (mode)
		0:begin
			green_light = 1;
			red_light = 0;
		end
		1: begin
			green_light = 0;
			red_light = 1;
		end
	endcase
end

endmodule
