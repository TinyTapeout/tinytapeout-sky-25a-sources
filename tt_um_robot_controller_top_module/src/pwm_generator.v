//////////////////////////////////////////////////////////////////////////////////
// Company: Gelisim University
// 
// Date: 2025
// Design Name: AR Chip
// Module Name: pwm_generator
// Project Name: Gelisim Chip
// 
//////////////////////////////////////////////////////////////////////////////////

module pwm_generator(
    input wire clk,

    input wire pwm_en,
    input wire [31:0] period,         
    input wire [31:0] duty_cycle,      
    
    output reg pwm_out
    
    );
    
    reg [31:0] period_counter = 0;
    
    always@(posedge clk) begin
        if (pwm_en) begin
            period_counter = period_counter + 1;
            if(period_counter <= duty_cycle) pwm_out = 1'b1;
            else pwm_out = 1'b0;
            if(period_counter == (period)) period_counter = 0;
        end else begin
            pwm_out = 0;
            period_counter = 0;
        end
    end
    
endmodule
