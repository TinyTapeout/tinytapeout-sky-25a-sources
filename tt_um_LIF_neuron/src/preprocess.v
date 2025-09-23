`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 08:55:33 PM
// Design Name: 
// Module Name: preprocess
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


module preprocess(
input [15:0] data,
output [15:0] out,
output [3:0] kout,
output zout
    );

reg [3:0] k1;
reg [15:0] dataout;
reg z;
assign kout = k1;
assign out = dataout;
assign zout = z;


always@(*)begin
    if(data[15])begin
        k1 = 4'd0;
        z = 0;
        end
    else if (data[15]^data[14])begin
        k1 = 4'd1;
        z = 0;
        end          
    else if (data[14]^data[13])begin
        k1 = 4'd2;
        z = 0;
        end              
    else if (data[13]^data[12])begin
        k1 = 4'd3;
        z = 0;
        end                
    else if (data[12]^data[11])begin
        k1 = 4'd4;
        z = 0;
        end                
    else if (data[11]^data[10])begin
        k1 = 4'd5;
        z = 0;
        end     
    else if (data[10]^data[9])begin
        k1 = 4'd6;
        z = 0;
        end   
    else if (data[9]^data[8])begin
        k1 = 4'd7;
        z = 0;
        end            
    else if (data[8]^data[7])begin 
        k1 = 4'd8;
        z = 0;
        end          
    else if (data[7]^data[6])begin
        k1 = 4'd9;
        z = 0;
        end             
    else if (data[6]^data[5])begin 
        k1 = 4'd10;
        z = 0;
        end            
    else if (data[5]^data[4])begin
        k1 = 4'd11;
        z = 0;
        end            
    else if (data[4]^data[3])begin
        k1 = 4'd12;
        z = 0;
        end             
    else if (data[3]^data[2])begin
        k1 = 4'd13;
        z = 0;
        end              
    else if (data[2]^data[1])begin
        k1 = 4'd14;
        z = 0;
        end              
    else if (data[1]^data[0])begin
        k1 = 4'd15;
        z = 0;
        end
    else begin
        k1 = 4'd0;
        z = 1;
    end


    dataout = data << k1;
    
end

endmodule
