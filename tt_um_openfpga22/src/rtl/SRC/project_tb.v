//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: FPGA Verilog Testbench for Formal Top-level netlist of Design: maskmul
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Jan 15 17:23:49 2024
//-------------------------------------------
//----- Default net type -----
`default_nettype wire

module maskmul_top_formal_verification_random_tb;

   wire [1:0] qm;
   reg [1:0]  am, bm, ma, mb, mq;
   reg ccff_head_fm, prog_clk_fm, set_fm;
   wire ccff_tail_fm;
   reg ena;
   reg clk;
   reg reset;
   wire [7:0] uio_oe, uio_out;
   wire [4:0] uo_out;

// ----- FPGA fabric instanciation -------
	tt_openfpga_top FPGA_DUT(
		.ena(ena),
		.ui_in({mb,ma,bm,am}),
		.uo_out({uo_out,ccff_tail_fm,qm}),
		.uio_in({3'h0,set_fm,prog_clk_fm,ccff_head_fm,mq}),
		.uio_out(uio_out),
		.uio_oe(uio_oe),
		.rst_n(~reset),
		.clk(clk)
	);

   always
     begin
	clk = 1'b0;
	#25;
	clk = 1'b1;
	#25;
     end

   integer plaina;
   integer plainb;
   integer plainq;
   integer a00, a01, a10, a11;
   integer b00, b01, b10, b11;
   integer q00, q01, q10, q11;

   initial
     begin

	prog_clk_fm = 1'b0;
	set_fm = 1'b0;

	$dumpfile("maskmul_formal.vcd");
	$dumpvars(0, maskmul_top_formal_verification_random_tb);

	plaina = $fopen("plaina.txt", "w");
	plainb = $fopen("plainb.txt", "w");
	plainq = $fopen("plainq.txt", "w");

	reset = 1'b1;
	@(posedge clk);
	reset = 1'b0;

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

	repeat (999) 
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
