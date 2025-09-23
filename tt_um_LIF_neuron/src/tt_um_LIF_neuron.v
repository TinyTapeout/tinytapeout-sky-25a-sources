`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 09:32:11 PM
// Design Name: 
// Module Name: LIF_neuron
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

`default_nettype none

module tt_um_LIF_neuron(
input clk,
input rst_n,//HIGH to Reset
//input [15:0] v, //(1,6,9)
//input [15:0] i,
//output [15:0] vout,
//output spike,
//output done
input wire ena,
input  wire [7:0] ui_in,    // Dedicated inputs
output wire [7:0] uo_out,   // Dedicated outputs
input  wire [7:0] uio_in,   // IOs: Input path
output wire [7:0] uio_out,  // IOs: Output path
output wire [7:0] uio_oe  // IOs: Enable path (active high: 0=input, 1=output)
    );

//localparam [15:0] E_REST = 16'b1100010000000000;  //-30 
//localparam [15:0] E_REST = 16'b1100010111111111;  //-29 
//localparam [15:0] E_TAU = 16'b0000000100110110;   //0.60546875
//localparam [15:0] E_TAU = 16'b0000000110001110;   //0.7788007830714049
//localparam [15:0] V_TH = 16'b0011110000000000;    //30
 
//localparam [15:0] E_REST = 16'd5;  
//localparam [15:0] E_TAU = 16'd5;   
//localparam [15:0] V_TH = 16'd5;    
wire [15:0] vout;
wire [7:0] i;
wire spike;

wire [16:0] v_e;
wire [16:0] e_i;
wire [31:0] vet;
wire [15:0] scl_vet;
wire [15:0] scl_ve;
wire [17:0] v_new;
wire [15:0] vout0;

reg sign_ve;

//reg [16:0] pip1_ei;
reg [16:0] pip2_ei,pip3_ei,pip4_ei,pip5_ei,pip6_ei,pip7_ei,pip8_ei,pip9_ei;
reg [16:0] pip2_ve;
//reg [16:0] pip1_ve;
//reg [16:0] pip9_ei;
reg [16:0] pip9_vet;
reg pip3_sve, pip4_sve,pip5_sve,pip6_sve,pip7_sve,pip8_sve,pip9_sve;

//reg [15:0] voutbuffer;
reg [15:0] buffer0,buffer1,buffer2,buffer3,buffer4,buffer5,buffer6,buffer7;
reg [15:0] vin;
wire [15:0] wi_vin;

// List all unused inputs to prevent warnings
wire _unused = ena;


///////////////Prarmeters & Inial Data Input/////////////////////
reg [15:0] E_REST;
reg [15:0] E_TAU;
reg [15:0] V_TH;
reg [15:0] v_ini;
reg [3:0] parcount;

/////////set up/////////////////
reg [3:0] cycle,ini_count;

reg ini;


////////////////STATE MACHINE//////////////////
reg par;
reg set;
reg inter;
reg [3:0] state;
reg ioctrl;
reg i_c;

assign uio_oe = ioctrl;

always@(posedge clk)begin
	if (rst_n == 0) begin
	state <= 0;
	E_REST <= 0;
	E_TAU <= 0;
	V_TH <= 0;
	parcount <= 0;
	cycle <= 0;
	inter <= 0;
	ini_count <= 0;
	ini <= 0;
	vin <= v_ini;
	i_c <=0;
	end
	
	case(state)
	4'd0: begin   //idle
		par <= 0;
		set <= 0;
		inter <= 0;
		ioctrl <= 0;//inout work as input
		state <= 4'd1;
		end

	4'd1: begin  //read parameters and Inial V input
		par <= 1;
		set <= 0;
		inter <= 0;
		ioctrl <= 0;//inout work as input
		end

	4'd2: begin  //LIF neuron model setup
		par <= 0;
		set <= 1;
		inter <= 0;
		ioctrl <= 0;//inout work as input
		end

	4'd3: begin  //LIF neuron model work
		par <= 0;
		set <= 0;
		inter <= 1;
		ioctrl <= 1;//inout work as output
		end
	endcase
	
	///////////////Prarmeters & Inial Data Input/////////////////////
	
	
	if (par) begin
		parcount <= parcount + 1;
		case(parcount)
		4'd0: E_REST <= {ui_in,uio_in}; //E_REST is setup 
		4'd1: E_TAU <= {ui_in,uio_in}; //E_TAU is setup 
		4'd2: V_TH <= {ui_in,uio_in}; //V_TH is setup
		//4'd3: v_ini = {ui_in,uio_in}; //v_ini is setup 
		endcase
	end

	if(parcount == 4'd2)begin
		state <= 4'd2;
	end
	
	////////////////////set up////////////////////////////////
	if (inter == 0 & ini == 0  & set == 1)begin
	v_ini <= {ui_in,uio_in};
	buffer0 <= v_ini;
	buffer1 <= buffer0;
	buffer2 <= buffer1;
	buffer3 <= buffer2;
	buffer4 <= buffer3;
	buffer5 <= buffer4;
	buffer6 <= buffer5;
	buffer7 <= buffer6;
	//buffer8 <= buffer7;
	cycle <= cycle + 1;
    end

	if(cycle == 8) begin
		cycle <= 0;
		ini <= 1;
		end
	
	if(ini & set == 1)begin
	i_c <= 1;
	vin <= buffer7;
	//buffer8 <= buffer7;
	buffer7 <= buffer6;
	buffer6 <= buffer5;
	buffer5 <= buffer4;
	buffer4 <= buffer3;
	buffer3 <= buffer2;
	buffer2 <= buffer1;
	buffer1 <= buffer0;
	buffer0 <= 0;
	ini_count <= ini_count + 1;
	end
	
	if(ini_count == 7)begin
	ini <= 0;
	//inter <= 1;
	ini_count <= 0;
	state <= 4'd3;
	end
	
	if(inter)begin
	//counter <= 0;
	//clk7 <= 0;
	cycle <= 0;
	ini_count <= 0;
	//buffer0 <= vout;
	//vin <= vout;
	end
	
	
end

assign wi_vin = (inter)? vout: vin;
assign i = (inter || i_c )? ui_in:0; // the I input is 8 bit and always > 0
assign uio_out = {vout[7:1],spike};
assign uo_out = {vout[15:8]};



///////////////pipline stage 0////////////////////
//always@(posedge clk)begin
//    if(rst)begin
    
//    pip1_ei <= 0;
//    pip1_ve <= 0;
    
//    end
//    else begin
    
//    pip1_ei <= e_i;
//    pip1_ve <= v_e;
       
//    end
//end

signed_adder_16bit adder0(.s_a({2'b0,i,6'b0}), .s_b(E_REST), .s_c(e_i)); //i (5,3) -> (1,6,9)
signed_substrator_16bit substrator0(.s_a(wi_vin), .s_b(E_REST), .s_c(v_e));
///////////////pipline stage 1////////////////////
always@(posedge clk)begin
    if(rst_n == 0)begin
    
    pip2_ei <= 0;
    sign_ve <= 0;
    
    end
    else begin
    
    pip2_ei <= e_i;
    pip2_ve <= v_e;
    sign_ve <= v_e[16];
   
    end
end

assign scl_ve = (pip2_ve[16] == 0)? pip2_ve[15:0]: (~pip2_ve[15:0] + 1);

folded_mul_16bit mul0(.clk(clk), .a(scl_ve), .b(E_TAU), .out(vet));

assign scl_vet = vet[23:8];//scal the vet to 33-16 {14,18} -> {7,9}

///////////////pipline stage 2////////////////////1


always@(posedge clk)begin
    if(rst_n == 0)begin
    
    pip3_ei <= 0;
    pip3_sve <= 0;
    
    end
    else begin
    pip3_ei <= pip2_ei;
    pip3_sve <= sign_ve;
    end
end



///////////////pipline stage 3////////////////////2

always@(posedge clk)begin
    if(rst_n == 0)begin
    
    pip4_ei <= 0;
    pip4_sve <= 0;
    
    end
    else begin
    pip4_ei <= pip3_ei;
    pip4_sve <= pip3_sve;
    end
end



///////////////pipline stage 4////////////////////3


always@(posedge clk)begin
    if(rst_n == 0)begin
    
    pip5_ei <= 0;
    pip5_sve <= 0;
    
    end
    else begin
    pip5_ei <= pip4_ei;
    pip5_sve <= pip4_sve;
    end
end


///////////////pipline stage 5////////////////////4


always@(posedge clk)begin
    if(rst_n == 0)begin
    
    pip6_ei <= 0;
    pip6_sve <= 0;
    
    end
    else begin
    pip6_ei <= pip5_ei;
    pip6_sve <= pip5_sve;
    end
end


///////////////pipline stage 6////////////////////5


always@(posedge clk)begin
    if(rst_n == 0)begin
    
    pip7_ei <= 0;
    pip7_sve <= 0;
    
    end
    else begin
    pip7_ei <= pip6_ei;
    pip7_sve <= pip6_sve;
    end
end



///////////////pipline stage 7////////////////////6


always@(posedge clk)begin
    if(rst_n == 0)begin
    
    pip8_ei <= 0;
    pip8_sve <= 0;
    
    end
    else begin
    pip8_ei <= pip7_ei;
    pip8_sve <= pip7_sve;
    end
end


///////////////pipline stage 8////////////////////
always@(posedge clk)begin
    if(rst_n == 0)begin
    
    pip9_ei <= 0;
    pip9_vet <= 0;
    pip9_sve <= 0;
    //voutbuffer <= 0;
    end
    else begin
    
    pip9_ei <= pip8_ei;
    pip9_sve <= pip8_sve;
        if (pip9_sve) pip9_vet <= {pip8_sve, (~scl_vet + 1'b1)};
        else pip9_vet <= {pip8_sve,scl_vet};    
    	  //if ((vout0[15]==0)&(vout0 >= 16'b0011110000000000)) voutbuffer <= E_REST;
        //else voutbuffer <= vout0;
    end
end
///////////////pipline stage 7////////////////////
signed_adder_17bit adder1(.s_a(pip9_vet), .s_b(pip9_ei), .s_c(v_new));
assign vout0 = {v_new[16],v_new[14:0]};
assign vout = ((vout0[15]==0)&(vout0 >= V_TH))? E_REST: vout0;
assign spike = ((vout0[15]==0)&(vout0 >= V_TH))? 1'b1: 1'b0;

//////////output buffer///////////////
//always@(posedge clk)begin
//    if(rst)begin
//    voutbuffer <= 0;
//    end
//    else if (inter) begin
//    voutbuffer <= 0;
//    end
//    else begin	
//    voutbuffer <= vout;
//    end
//end

endmodule

