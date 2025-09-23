/*
 * full wrapper with set wired internally
 *
 * Inputs:
 * 	ui_in[0] -> gfpga_pad_GPIO_PAD_fm[35] // am_0_
 * 	ui_in[1] -> gfpga_pad_GPIO_PAD_fm[41] // am_1_
 * 	ui_in[2] -> gfpga_pad_GPIO_PAD_fm[34] // bm_0_
 * 	ui_in[3] -> gfpga_pad_GPIO_PAD_fm[42] // bm_1_
 * 	ui_in[4] -> gfpga_pad_GPIO_PAD_fm[28] // ma_0_
 * 	ui_in[5] -> gfpga_pad_GPIO_PAD_fm[55] // ma_1_
 * 	ui_in[6] -> gfpga_pad_GPIO_PAD_fm[33] // mb_0_
 * 	ui_in[7] -> gfpga_pad_GPIO_PAD_fm[40] // mb_1_
 *
 * 	uio_in[0] -> gfpga_pad_GPIO_PAD_fm[47] // mq_0_
 * 	uio_in[1] -> gfpga_pad_GPIO_PAD_fm[31] // mq_1_
 * 	uio_in[2] -> ccff_head_fm 
 * 	uio_in[3] -> prog_clk_fm
 * 	uio_in[4] -> set_fm (always 0)
 * 	uio_in[5] -> unset (hardcoded)
 * 	uio_in[6] -> unset (hardcoded)
 * 	uio_in[7] -> unset (hardcoded)
 *
 * Outputs:
 * 	uo_out[0] <- gfpga_pad_GPIO_PAD_fm[48] // qm_0_
 * 	uo_out[1] <- gfpga_pad_GPIO_PAD_fm[26] // qm_1_
 * 	uo_out[2] <- ccff_tail_fm 
 * 	uo_out[3] <- gfpga_pad_GPIO_PAD_fm[11] // unused
 * 	uo_out[4] <- gfpga_pad_GPIO_PAD_fm[22] // unused
 * 	uo_out[5] <- gfpga_pad_GPIO_PAD_fm[36] // unused
 * 	uo_out[6] <- gfpga_pad_GPIO_PAD_fm[45] // unused
 * 	uo_out[7] <- gfpga_pad_GPIO_PAD_fm[63] // unused
 *
 * 	uio_out[0] <- unset (hardcoded)
 * 	uio_out[1] <- unset (hardcoded)
 * 	uio_out[2] <- unset (hardcoded)
 * 	uio_out[3] <- unset (hardcoded)
 * 	uio_out[4] <- unset (hardcoded)
 * 	uio_out[5] <- gfpga_pad_GPIO_PAD_fm[0] // unused
 * 	uio_out[6] <- gfpga_pad_GPIO_PAD_fm[30] // unused
 * 	uio_out[7] <- gfpga_pad_GPIO_PAD_fm[50] // unused
 *
 * User Defined OE = 8'b11100000;
 *
 */

`default_nettype wire

module tt_um_openfpga22 (
    input  wire        clk,        // system clock
    input  wire        rst_n,      // active-low reset
    input  wire        ena,	   // always 1 when the design is powered, so you can ignore it
    input  wire [7:0]  ui_in,      // dedicated inputs
    output wire [7:0]  uo_out,     // dedicated outputs
    input  wire [7:0]  uio_in,     // bidir: input path
    output wire [7:0]  uio_out,    // bidir: output path
    output wire [7:0]  uio_oe      // IO direction control (1 = output)
);

    // --------------------------------------------------------
    // directions: lower nibble inputs, upper nibble outputs
    // --------------------------------------------------------
    assign uio_oe = 8'b11100000; // uio[4:0] inputs, uio[7:5] outputs
    assign uio_out[4:0] = 5'd0;

    maskmul_top_formal_verification dut_0 (
	.am_0_(ui_in[0]),
	.am_1_(ui_in[1]),
	.bm_0_(ui_in[2]),
	.bm_1_(ui_in[3]),
	.ma_0_(ui_in[4]),
	.ma_1_(ui_in[5]),
	.mb_0_(ui_in[6]),
	.mb_1_(ui_in[7]),
	.mq_0_(uio_in[0]),
	.mq_1_(uio_in[1]),
	.reset(~rst_n),
	.clk(clk),
	.qm_0_(uo_out[0]),
	.qm_1_(uo_out[1]),
	.ccff_head_fm(uio_in[2]),
	.ccff_tail_fm(uo_out[2]),
	.prog_clk_fm(uio_in[3]),
	.set_fm(uio_in[4]),
	.uio_out_wire(uio_out[7:5]),
	.uo_out_wire(uo_out[7:3])
	);

endmodule

