//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Multiplexer primitives
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Jan 15 17:23:49 2024
//-------------------------------------------
// ----- Verilog module for mux_tree_tapbuf_basis_input2_mem1 -----

`default_nettype wire

module mux_tree_tapbuf_basis_input2_mem1(in,
                                         mem,
                                         mem_inv,
                                         out);
//----- INPUT PORTS -----
input [0:1] in;
//----- INPUT PORTS -----
input [0:0] mem;
//----- INPUT PORTS -----
input [0:0] mem_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

/*
	TGATE TGATE_0_ (
		.in(in[0]),
		.sel(mem),
		.selb(mem_inv),
		.out(out));

	TGATE TGATE_1_ (
		.in(in[1]),
		.sel(mem_inv),
		.selb(mem),
		.out(out));
*/
	assign out = mem ? in[0] :
             mem_inv ? in[1] : 1'b0;  // or 'bz if you want tri-state

endmodule
// ----- END Verilog module for mux_tree_tapbuf_basis_input2_mem1 -----




// ----- Verilog module for mux_tree_basis_input2_mem1 -----
module mux_tree_basis_input2_mem1(in,
                                  mem,
                                  mem_inv,
                                  out);
//----- INPUT PORTS -----
input [0:1] in;
//----- INPUT PORTS -----
input [0:0] mem;
//----- INPUT PORTS -----
input [0:0] mem_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

/*
	TGATE TGATE_0_ (
		.in(in[0]),
		.sel(mem),
		.selb(mem_inv),
		.out(out));

	TGATE TGATE_1_ (
		.in(in[1]),
		.sel(mem_inv),
		.selb(mem),
		.out(out));
*/
 // if mem=1, pick in[0]; if mem_inv=1, pick in[1]
  assign out = mem ? in[0] :
               mem_inv ? in[1] : 1'b0; // or 'bz if it should float



endmodule
// ----- END Verilog module for mux_tree_basis_input2_mem1 -----




// ----- Verilog module for lut4_mux_basis_input2_mem1 -----
module lut4_mux_basis_input2_mem1(in,
                                  mem,
                                  mem_inv,
                                  out);
//----- INPUT PORTS -----
input [0:1] in;
//----- INPUT PORTS -----
input [0:0] mem;
//----- INPUT PORTS -----
input [0:0] mem_inv;
//----- OUTPUT PORTS -----
output [0:0] out;

//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

/*
	TGATE TGATE_0_ (
		.in(in[0]),
		.sel(mem),
		.selb(mem_inv),
		.out(out));

	TGATE TGATE_1_ (
		.in(in[1]),
		.sel(mem_inv),
		.selb(mem),
		.out(out));
*/

 // if mem=1, pick in[0]; if mem_inv=1, pick in[1]
  assign out = mem ? in[0] :
               mem_inv ? in[1] : 1'b0; // or 'bz if it should float

endmodule
// ----- END Verilog module for lut4_mux_basis_input2_mem1 -----




