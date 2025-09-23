//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: FPGA Verilog full testbench for top-level netlist of design: maskmul
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Jan 15 17:23:49 2024
//-------------------------------------------
//----- Default net type -----
`default_nettype wire

module maskmul_autocheck_top_tb;
// ----- Local wires for global ports of FPGA fabric -----
wire [0:0] prog_clk;
wire [0:0] set;
wire [0:0] reset;
wire [0:0] clk;

// ----- Local wires for I/Os of FPGA fabric -----
wire [0:63] gfpga_pad_GPIO_PAD;



reg [0:0] __config_done__;
wire [0:0] __config_all_done__;
wire [0:0] __prog_clock__;
reg [0:0] __prog_clock___reg__;
wire [0:0] __op_clock__;
reg [0:0] __op_clock___reg__;
reg [0:0] __prog_reset__;
reg [0:0] __prog_set_;
reg [0:0] __greset__;
reg [0:0] __gset__;
// ---- Configuration-chain head -----
reg [0:0] ccff_head;
// ---- Configuration-chain tail -----
wire [0:0] ccff_tail;
// ----- Shared inputs -------

   wire [1:0] qm;
   reg [1:0]  am, bm, ma, mb, mq;

	wire [0:0] reset_shared_input;

 
// ----- Number of clock cycles in configuration phase: 1259 -----
// ----- Begin configuration done signal generation -----
initial
	begin
		__config_done__[0] = 1'b0;
	end

// ----- End configuration done signal generation -----

// ----- Begin raw programming clock signal generation -----
initial
	begin
		__prog_clock___reg__[0] = 1'b0;
	end
always
	begin
		#25.00000191	__prog_clock___reg__[0] = ~__prog_clock___reg__[0];
	end

// ----- End raw programming clock signal generation -----

// ----- Actual programming clock is triggered only when __config_done__ and __prog_reset__ are disabled -----
	assign __prog_clock__[0] = __prog_clock___reg__[0] & (~__config_done__[0]) & (~__prog_reset__[0]);

	assign __config_all_done__[0] = __config_done__[0];
// ----- Begin raw operating clock signal generation -----
initial
	begin
		__op_clock___reg__[0] = 1'b0;
	end
always wait(~__greset__)
	begin
		#25.00000191	__op_clock___reg__[0] = ~__op_clock___reg__[0];
	end

// ----- End raw operating clock signal generation -----
// ----- Actual operating clock is triggered only when __config_all_done__ is enabled -----
	assign __op_clock__[0] = __op_clock___reg__[0] & __config_all_done__[0];

// ----- Begin programming reset signal generation -----
initial
	begin
		__prog_reset__[0] = 1'b1;
	#50.00000381	__prog_reset__[0] = 1'b0;
	end

// ----- End programming reset signal generation -----

// ----- Begin programming set signal generation -----
initial
	begin
		__prog_set_[0] = 1'b1;
	#50.00000381	__prog_set_[0] = 1'b0;
	end

// ----- End programming set signal generation -----

// ----- Begin operating reset signal generation -----
// ----- Reset signal is enabled until the first clock cycle in operation phase -----
initial
	begin
		__greset__[0] = 1'b1;
	wait(__config_all_done__)
	#50.00000381	__greset__[0] = 1'b1;
	#100.0000076	__greset__[0] = 1'b0;
	end

// ----- End operating reset signal generation -----
// ----- Begin operating set signal generation: always disabled -----
initial
	begin
		__gset__[0] = 1'b0;
	end

// ----- End operating set signal generation: always disabled -----

// ----- Begin connecting global ports of FPGA fabric to stimuli -----
	assign clk[0] = __op_clock__[0];
	assign prog_clk[0] = __prog_clock__[0];
	assign reset[0] = reset_shared_input[0];
	assign set[0] = __gset__[0];
// ----- End connecting global ports of FPGA fabric to stimuli -----
// ----- FPGA top-level module to be capsulated -----
	fpga_top FPGA_DUT (
		.prog_clk(prog_clk[0]),
		.set(set[0]),
		.reset(reset[0]),
		.clk(clk[0]),
		.gfpga_pad_GPIO_PAD(gfpga_pad_GPIO_PAD[0:63]),
		.ccff_head(ccff_head[0]),
		.ccff_tail(ccff_tail[0]));

// ----- Link BLIF Benchmark I/Os to FPGA I/Os -----
// ----- Blif Benchmark input am_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[35] -----
	assign gfpga_pad_GPIO_PAD[35] = am[0];

// ----- Blif Benchmark input am_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[41] -----
	assign gfpga_pad_GPIO_PAD[41] = am[1];

// ----- Blif Benchmark input bm_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[34] -----
	assign gfpga_pad_GPIO_PAD[34] = bm[0];

// ----- Blif Benchmark input bm_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[42] -----
	assign gfpga_pad_GPIO_PAD[42] = bm[1];

// ----- Blif Benchmark input ma_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[28] -----
	assign gfpga_pad_GPIO_PAD[28] = ma[0];

// ----- Blif Benchmark input ma_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[55] -----
	assign gfpga_pad_GPIO_PAD[55] = ma[1];

// ----- Blif Benchmark input mb_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[33] -----
	assign gfpga_pad_GPIO_PAD[33] = mb[0];

// ----- Blif Benchmark input mb_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[40] -----
	assign gfpga_pad_GPIO_PAD[40] = mb[1];

// ----- Blif Benchmark input mq_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[47] -----
	assign gfpga_pad_GPIO_PAD[47] = mq[0];

// ----- Blif Benchmark input mq_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[31] -----
	assign gfpga_pad_GPIO_PAD[31] = mq[1];

// ----- Blif Benchmark input reset is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[44] -----
	assign gfpga_pad_GPIO_PAD[44] = reset_shared_input[0];

// ----- Blif Benchmark input clk is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[53] -----
	assign gfpga_pad_GPIO_PAD[53] = clk[0];

// ----- Blif Benchmark output qm_0_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[48] -----
	assign qm[0] = gfpga_pad_GPIO_PAD[48];

// ----- Blif Benchmark output qm_1_ is mapped to FPGA IOPAD gfpga_pad_GPIO_PAD[26] -----
	assign qm[1] = gfpga_pad_GPIO_PAD[26];

// ----- Wire unused FPGA I/Os to constants -----
	assign gfpga_pad_GPIO_PAD[0] = 1'b0;
	assign gfpga_pad_GPIO_PAD[1] = 1'b0;
	assign gfpga_pad_GPIO_PAD[2] = 1'b0;
	assign gfpga_pad_GPIO_PAD[3] = 1'b0;
	assign gfpga_pad_GPIO_PAD[4] = 1'b0;
	assign gfpga_pad_GPIO_PAD[5] = 1'b0;
	assign gfpga_pad_GPIO_PAD[6] = 1'b0;
	assign gfpga_pad_GPIO_PAD[7] = 1'b0;
	assign gfpga_pad_GPIO_PAD[8] = 1'b0;
	assign gfpga_pad_GPIO_PAD[9] = 1'b0;
	assign gfpga_pad_GPIO_PAD[10] = 1'b0;
	assign gfpga_pad_GPIO_PAD[11] = 1'b0;
	assign gfpga_pad_GPIO_PAD[12] = 1'b0;
	assign gfpga_pad_GPIO_PAD[13] = 1'b0;
	assign gfpga_pad_GPIO_PAD[14] = 1'b0;
	assign gfpga_pad_GPIO_PAD[15] = 1'b0;
	assign gfpga_pad_GPIO_PAD[16] = 1'b0;
	assign gfpga_pad_GPIO_PAD[17] = 1'b0;
	assign gfpga_pad_GPIO_PAD[18] = 1'b0;
	assign gfpga_pad_GPIO_PAD[19] = 1'b0;
	assign gfpga_pad_GPIO_PAD[20] = 1'b0;
	assign gfpga_pad_GPIO_PAD[21] = 1'b0;
	assign gfpga_pad_GPIO_PAD[22] = 1'b0;
	assign gfpga_pad_GPIO_PAD[23] = 1'b0;
	assign gfpga_pad_GPIO_PAD[24] = 1'b0;
	assign gfpga_pad_GPIO_PAD[25] = 1'b0;
	assign gfpga_pad_GPIO_PAD[27] = 1'b0;
	assign gfpga_pad_GPIO_PAD[29] = 1'b0;
	assign gfpga_pad_GPIO_PAD[30] = 1'b0;
	assign gfpga_pad_GPIO_PAD[32] = 1'b0;
	assign gfpga_pad_GPIO_PAD[36] = 1'b0;
	assign gfpga_pad_GPIO_PAD[37] = 1'b0;
	assign gfpga_pad_GPIO_PAD[38] = 1'b0;
	assign gfpga_pad_GPIO_PAD[39] = 1'b0;
	assign gfpga_pad_GPIO_PAD[43] = 1'b0;
	assign gfpga_pad_GPIO_PAD[45] = 1'b0;
	assign gfpga_pad_GPIO_PAD[46] = 1'b0;
	assign gfpga_pad_GPIO_PAD[49] = 1'b0;
	assign gfpga_pad_GPIO_PAD[50] = 1'b0;
	assign gfpga_pad_GPIO_PAD[51] = 1'b0;
	assign gfpga_pad_GPIO_PAD[52] = 1'b0;
	assign gfpga_pad_GPIO_PAD[54] = 1'b0;
	assign gfpga_pad_GPIO_PAD[56] = 1'b0;
	assign gfpga_pad_GPIO_PAD[57] = 1'b0;
	assign gfpga_pad_GPIO_PAD[58] = 1'b0;
	assign gfpga_pad_GPIO_PAD[59] = 1'b0;
	assign gfpga_pad_GPIO_PAD[60] = 1'b0;
	assign gfpga_pad_GPIO_PAD[61] = 1'b0;
	assign gfpga_pad_GPIO_PAD[62] = 1'b0;
	assign gfpga_pad_GPIO_PAD[63] = 1'b0;

// ----- Begin bitstream loading during configuration phase -----
`define BITSTREAM_LENGTH 1258
`define BITSTREAM_WIDTH 1
// ----- Virtual memory to store the bitstream from external file -----
reg [0:`BITSTREAM_WIDTH - 1] bit_mem[0:`BITSTREAM_LENGTH - 1];
reg [$clog2(`BITSTREAM_LENGTH):0] bit_index;
// ----- Registers used for fast configuration logic -----
reg [$clog2(`BITSTREAM_LENGTH):0] ibit;
reg [0:0] skip_bits;
// ----- Preload bitstream file to a virtual memory -----
initial begin
	$readmemb("fabric_bitstream.bit", bit_mem);
// ----- Configuration chain default input -----
	ccff_head[0] <= 1'b0;
	bit_index <= 0;
	skip_bits[0] <= 1'b0;
	for (ibit = 0; ibit < `BITSTREAM_LENGTH + 1; ibit = ibit + 1) begin
		if (1'b0 == bit_mem[ibit]) begin
			if (1'b1 == skip_bits[0]) begin
				bit_index <= bit_index + 1;
			end
		end else begin
			skip_bits[0] <= 1'b0;
		end
	end
end
// ----- 'else if' condition is required by Modelsim to synthesis the Verilog correctly -----
always @(negedge __prog_clock___reg__[0]) begin
	if (bit_index >= `BITSTREAM_LENGTH) begin
		__config_done__[0] <= 1'b1;
	end else if (bit_index >= 0 && bit_index < `BITSTREAM_LENGTH) begin
		ccff_head[0] <= bit_mem[bit_index];
		bit_index <= bit_index + 1;
	end
end
// ----- End bitstream loading during configuration phase -----
// ----- Begin reset signal generation -----
	assign reset_shared_input[0] = __greset__[0];

   integer plaina;
   integer plainb;
   integer plainq;
   integer a00, a01, a10, a11;
   integer b00, b01, b10, b11;
   integer q00, q01, q10, q11;

   initial
     begin

	wait(__config_done__[0]==1'b1);
        wait(__greset__[0]==1'b0);
	
	$dumpfile("maskmul_formal.vcd");
	$dumpvars(0, maskmul_autocheck_top_tb);

	plaina = $fopen("plaina.txt", "w");
	plainb = $fopen("plainb.txt", "w");
	plainq = $fopen("plainq.txt", "w");

//	reset = 1'b1;
//	@(posedge clk);
//	reset = 1'b0;

	a00 = 0;
	a01 = 0;
	a10 = 0;
	a11 = 0;
	b00 = 0;
	b01 = 0;
	b10 = 0;
	b11 = 0;
	q00 = 0;
	q01 = 0;
	q10 = 0;
	q11 = 0;

	repeat (500) 
	  begin
	     am = $unsigned($random) % 4;
	     bm = $unsigned($random) % 4;
	     ma = $unsigned($random) % 4;
	     mb = $unsigned($random) % 4;
	     mq = $unsigned($random) % 4;

	     @(posedge clk);
	     #1;
//	     $display("am %b ma %b bm %b mb %b qm %b mq %b", am, ma, bm, mb, qm, mq);
//	     $display("        ambm %b ammb %b bmma %b mamb %b", dut.ambm, dut.ammb, dut.bmma, dut.mamb);
//	     $display("        a %b b %b q %b", am ^ ma, bm ^ mb, mq ^ qm);

	     if ((am ^ ma) == 0)
	       a00 = a00 + 1;
	     else if ((am ^ ma) == 1)
	       a01 = a01 + 1;
	     else if ((am ^ ma) == 2)
	       a10 = a10 + 1;
	     else
	       a11 = a11 + 1;
	     
	     if ((bm ^ mb) == 0)
	       b00 = b00 + 1;
	     else if ((bm ^ mb) == 1)
	       b01 = b01 + 1;
	     else if ((bm ^ mb) == 2)
	       b10 = b10 + 1;
	     else
	       b11 = b11 + 1;
	     
	     if ((qm ^ mq) == 0)
	       q00 = q00 + 1;
	     else if ((qm ^ mq) == 1)
	       q01 = q01 + 1;
	     else if ((qm ^ mq) == 2)
	       q10 = q10 + 1;
	     else
	       q11 = q11 + 1;
	     
	     $fwrite(plaina, "%d\n", am ^ ma);
	     $fwrite(plainb, "%d\n", bm ^ mb);
	     $fwrite(plainq, "%d\n", qm ^ mq);

	  end

	$fclose(plaina);
	$fclose(plainb);	
	$fclose(plainq);

	$display("a stats: %d %d %d %d", a00, a01, a10, a11);
	$display("b stats: %d %d %d %d", b00, b01, b10, b11);
	$display("q stats: %d %d %d %d", q00, q01, q10, q11);
	
	$finish;
     end
   
endmodule
