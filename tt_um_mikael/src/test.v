module test
  (input  clk,
   input  rst_n,
   input  ena,
   input  [7:0] ui_in,
   input  [7:0] uio_in,
   output [7:0] uo_out,
   output [7:0] uio_out,
   output [7:0] uio_oe);
  wire [7:0] num;
  wire [7:0] den;
  wire [3:0] n3;
  wire [3:0] n5;
  wire n6;
  wire n7;
  wire [1:0] n8;
  wire n9;
  wire [2:0] n10;
  wire n11;
  wire [3:0] n12;
  wire n16;
  wire [7:0] n17;
  wire [7:0] n19;
  wire [7:0] n22;
  wire [7:0] n23;
  reg [7:0] n24;
  localparam [7:0] n25 = 8'bZ;
  localparam [7:0] n26 = 8'bZ;
  assign uo_out = n24; //(module output)
  assign uio_out = n25; //(module output)
  assign uio_oe = n26; //(module output)
  /* test.vhdl:22:12  */
  assign num = n22; // (signal)
  /* test.vhdl:23:12  */
  assign den = n23; // (signal)
  /* test.vhdl:27:36  */
  assign n3 = ui_in[7:4]; // extract
  /* test.vhdl:31:36  */
  assign n5 = ui_in[3:0]; // extract
  /* test.vhdl:32:29  */
  assign n6 = ui_in[3]; // extract
  /* test.vhdl:32:40  */
  assign n7 = ui_in[3]; // extract
  /* test.vhdl:32:33  */
  assign n8 = {n6, n7};
  /* test.vhdl:32:51  */
  assign n9 = ui_in[3]; // extract
  /* test.vhdl:32:44  */
  assign n10 = {n8, n9};
  /* test.vhdl:32:62  */
  assign n11 = ui_in[3]; // extract
  /* test.vhdl:32:55  */
  assign n12 = {n10, n11};
  /* test.vhdl:36:22  */
  assign n16 = ~rst_n;
  /* test.vhdl:39:48  */
  assign n17 = $signed(num) / $signed(den); // sdiv
  /* test.vhdl:36:13  */
  assign n19 = n16 ? 8'b00000000 : n17;
  assign n22 = {n3, 4'b0000};
  assign n23 = {n12, n5};
  /* test.vhdl:35:9  */
  always @(posedge clk)
    n24 <= n19;
endmodule

