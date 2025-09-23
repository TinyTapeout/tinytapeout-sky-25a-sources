`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 09:16:39 PM
// Design Name: 
// Module Name: preprocess_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module preprocess_8bit(
input [7:0] data,
output [7:0] out,
output [3:0] kout,
output z
    );

reg [3:0] k1;
reg [7:0] dataout;
reg z1;

assign kout = k1;
assign out = dataout;
assign z = z1;


always@(*)begin
    if(data[7])begin
        k1 = 4'd0;
        z1 = 0; 
        end
    else if (data[7]^data[6])begin
        k1 = 4'd1;
        z1 = 0; 
        end          
    else if (data[6]^data[5])begin
        k1 = 4'd2;
        z1 = 0; 
        end              
    else if (data[5]^data[4])begin
        k1 = 4'd3;
        z1 = 0; 
        end                
    else if (data[4]^data[3])begin
        k1 = 4'd4;
        z1 = 0; 
        end                
    else if (data[3]^data[2])begin
        k1 = 4'd5;
        z1 = 0; 
        end     
    else if (data[2]^data[1])begin
        k1 = 4'd6;
        z1 = 0; 
        end   
    else if (data[1]^data[0])begin
        k1 = 4'd7;
        z1 = 0; 
        end
    else begin
        k1 = 0;
        z1 = 1;            
        end
    dataout = data << k1;
    
end

endmodule
