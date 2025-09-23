//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog netlist for pre-configured FPGA fabric by design: maskmul
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Jan 15 17:23:49 2024
//-------------------------------------------
//----- Default net type -----
`default_nettype wire

module maskmul_top_formal_verification (
input [0:0] am_0_,
input [0:0] am_1_,
input [0:0] bm_0_,
input [0:0] bm_1_,
input [0:0] ma_0_,
input [0:0] ma_1_,
input [0:0] mb_0_,
input [0:0] mb_1_,
input [0:0] mq_0_,
input [0:0] mq_1_,
input [0:0] reset,
input [0:0] clk,
output [0:0] qm_0_,
output [0:0] qm_1_,
input [0:0] ccff_head_fm,
output [0:0] ccff_tail_fm,
input [0:0] prog_clk_fm,
input [0:0] set_fm,
output [0:2] uio_out_wire,
output [0:4] uo_out_wire);

// ----- Local wires for FPGA fabric -----
wire [0:63] gfpga_pad_GPIO_PAD_fm;
//wire [0:0] ccff_head_fm;
//wire [0:0] ccff_tail_fm;
//wire [0:0] prog_clk_fm;
//wire [0:0] set_fm;
wire [0:0] reset_fm;
wire [0:0] clk_fm;

// ----- FPGA top-level module to be capsulated -----
	fpga_top U0_formal_verification (
		.prog_clk(prog_clk_fm[0]),
		.set(set_fm[0]),
		.reset(reset_fm[0]),
		.clk(clk_fm[0]),
		.gfpga_pad_GPIO_PAD(gfpga_pad_GPIO_PAD_fm[0:63]),
		.ccff_head(ccff_head_fm[0]),
		.ccff_tail(ccff_tail_fm[0]));

// ----- Begin Connect Global ports of FPGA top module -----
	//assign set_fm[0] = 1'b0;
	assign reset_fm[0] = reset[0];
	assign clk_fm[0] = clk[0];
	//assign prog_clk_fm[0] = 1'b0;
// ----- End Connect Global ports of FPGA top module -----

// ----- Link BLIF Benchmark I/Os to FPGA I/Os -----
// ----- Blif Benchmark input am_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[35] -----
	assign gfpga_pad_GPIO_PAD_fm[35] = am_0_[0];

// ----- Blif Benchmark input am_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[41] -----
	assign gfpga_pad_GPIO_PAD_fm[41] = am_1_[0];

// ----- Blif Benchmark input bm_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[34] -----
	assign gfpga_pad_GPIO_PAD_fm[34] = bm_0_[0];

// ----- Blif Benchmark input bm_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[42] -----
	assign gfpga_pad_GPIO_PAD_fm[42] = bm_1_[0];

// ----- Blif Benchmark input ma_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[28] -----
	assign gfpga_pad_GPIO_PAD_fm[28] = ma_0_[0];

// ----- Blif Benchmark input ma_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[55] -----
	assign gfpga_pad_GPIO_PAD_fm[55] = ma_1_[0];

// ----- Blif Benchmark input mb_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[33] -----
	assign gfpga_pad_GPIO_PAD_fm[33] = mb_0_[0];

// ----- Blif Benchmark input mb_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[40] -----
	assign gfpga_pad_GPIO_PAD_fm[40] = mb_1_[0];

// ----- Blif Benchmark input mq_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[47] -----
	assign gfpga_pad_GPIO_PAD_fm[47] = mq_0_[0];

// ----- Blif Benchmark input mq_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[31] -----
	assign gfpga_pad_GPIO_PAD_fm[31] = mq_1_[0];

// ----- Blif Benchmark input reset is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[44] -----
	assign gfpga_pad_GPIO_PAD_fm[44] = reset[0];

// ----- Blif Benchmark input clk is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[53] -----
	assign gfpga_pad_GPIO_PAD_fm[53] = clk[0];

// ----- Blif Benchmark output qm_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[48] -----
	assign qm_0_[0] = gfpga_pad_GPIO_PAD_fm[48];

// ----- Blif Benchmark output qm_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD_fm[26] -----
	assign qm_1_[0] = gfpga_pad_GPIO_PAD_fm[26];

	assign uio_out_wire = {gfpga_pad_GPIO_PAD_fm[0],gfpga_pad_GPIO_PAD_fm[30],gfpga_pad_GPIO_PAD_fm[50]};
	assign uo_out_wire = {gfpga_pad_GPIO_PAD_fm[11],gfpga_pad_GPIO_PAD_fm[22],gfpga_pad_GPIO_PAD_fm[36],gfpga_pad_GPIO_PAD_fm[45],gfpga_pad_GPIO_PAD_fm[63]};

wire _unused = &{gfpga_pad_GPIO_PAD_fm[1] ,
gfpga_pad_GPIO_PAD_fm[2] ,
gfpga_pad_GPIO_PAD_fm[3] ,
gfpga_pad_GPIO_PAD_fm[4] ,
gfpga_pad_GPIO_PAD_fm[5] ,
gfpga_pad_GPIO_PAD_fm[6] ,
gfpga_pad_GPIO_PAD_fm[7] ,
gfpga_pad_GPIO_PAD_fm[8] ,
gfpga_pad_GPIO_PAD_fm[9] ,
gfpga_pad_GPIO_PAD_fm[10],
gfpga_pad_GPIO_PAD_fm[12],
gfpga_pad_GPIO_PAD_fm[13],
gfpga_pad_GPIO_PAD_fm[14],
gfpga_pad_GPIO_PAD_fm[15],
gfpga_pad_GPIO_PAD_fm[16],
gfpga_pad_GPIO_PAD_fm[17],
gfpga_pad_GPIO_PAD_fm[18],
gfpga_pad_GPIO_PAD_fm[19],
gfpga_pad_GPIO_PAD_fm[20],
gfpga_pad_GPIO_PAD_fm[21],
gfpga_pad_GPIO_PAD_fm[23],
gfpga_pad_GPIO_PAD_fm[24],
gfpga_pad_GPIO_PAD_fm[25],
gfpga_pad_GPIO_PAD_fm[27],
gfpga_pad_GPIO_PAD_fm[29],
gfpga_pad_GPIO_PAD_fm[32],
gfpga_pad_GPIO_PAD_fm[37],
gfpga_pad_GPIO_PAD_fm[38],
gfpga_pad_GPIO_PAD_fm[39],
gfpga_pad_GPIO_PAD_fm[43],
gfpga_pad_GPIO_PAD_fm[46],
gfpga_pad_GPIO_PAD_fm[49],
gfpga_pad_GPIO_PAD_fm[51],
gfpga_pad_GPIO_PAD_fm[52],
gfpga_pad_GPIO_PAD_fm[54],
gfpga_pad_GPIO_PAD_fm[56],
gfpga_pad_GPIO_PAD_fm[57],
gfpga_pad_GPIO_PAD_fm[58],
gfpga_pad_GPIO_PAD_fm[59],
gfpga_pad_GPIO_PAD_fm[60],
gfpga_pad_GPIO_PAD_fm[61],
gfpga_pad_GPIO_PAD_fm[62]};


// ----- Wire unused FPGA I/Os to constants -----
/*
	assign gfpga_pad_GPIO_PAD_fm[1] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[2] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[3] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[4] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[5] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[6] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[7] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[8] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[9] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[10] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[12] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[13] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[14] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[15] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[16] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[17] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[18] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[19] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[20] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[21] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[23] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[24] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[25] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[27] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[29] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[32] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[37] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[38] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[39] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[43] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[46] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[49] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[51] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[52] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[54] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[56] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[57] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[58] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[59] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[60] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[61] = 1'b0;
	assign gfpga_pad_GPIO_PAD_fm[62] = 1'b0;
*/
endmodule
// ----- END Verilog module for maskmul_top_formal_verification -----

