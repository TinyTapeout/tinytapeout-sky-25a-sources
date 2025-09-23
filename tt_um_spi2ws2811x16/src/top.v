module ws2811_8
  (input  i_clock,
   input  i_reset,
   input  i_trigger,
   input  [7:0] i_pixel_data,
   output o_data);
  wire [3:0] cyc_count;
  wire [3:0] bit_count;
  reg bit_data_in;
  reg [7:0] rgb;
  reg running;
  wire n221;
  wire n222;
  wire n223;
  wire n225;
  wire [3:0] n227;
  wire n228;
  wire [7:0] n229;
  wire n231;
  wire [31:0] n232;
  wire n234;
  wire [31:0] n235;
  wire [31:0] n237;
  wire [3:0] n238;
  wire [31:0] n239;
  wire n241;
  wire n242;
  wire n243;
  wire [31:0] n244;
  wire n246;
  wire n247;
  wire n248;
  wire n250;
  wire [31:0] n251;
  wire n253;
  wire [31:0] n254;
  wire [31:0] n256;
  wire [3:0] n257;
  wire [31:0] n258;
  wire [31:0] n260;
  wire [31:0] n262;
  wire [2:0] n263;
  wire n268;
  wire [3:0] n270;
  wire n271;
  wire n273;
  wire n274;
  wire [3:0] n276;
  wire [3:0] n277;
  wire n278;
  wire n279;
  wire n280;
  wire [3:0] n281;
  wire [3:0] n282;
  wire n283;
  wire n284;
  wire n286;
  wire [3:0] n288;
  wire [3:0] n290;
  wire n292;
  wire [7:0] n294;
  wire n296;
  wire n311;
  wire [3:0] n312;
  reg [3:0] n313;
  wire n314;
  wire [3:0] n315;
  reg [3:0] n316;
  wire n317;
  wire n318;
  reg n319;
  wire n320;
  wire [7:0] n321;
  reg [7:0] n322;
  wire n323;
  wire n324;
  reg n325;
  reg n326;
  wire n327;
  assign o_data = n326; //(module output)
  /* src/ws2811.vhdl:26:16  */
  assign cyc_count = n313; // (signal)
  /* src/ws2811.vhdl:27:16  */
  assign bit_count = n316; // (signal)
  /* src/ws2811.vhdl:28:16  */
  always @*
    bit_data_in = n319; // (isignal)
  initial
    bit_data_in = 1'b0;
  /* src/ws2811.vhdl:30:16  */
  always @*
    rgb = n322; // (isignal)
  initial
    rgb = 8'b00000000;
  /* src/ws2811.vhdl:32:16  */
  always @*
    running = n325; // (isignal)
  initial
    running = 1'b0;
  /* src/ws2811.vhdl:50:44  */
  assign n221 = ~running;
  /* src/ws2811.vhdl:50:50  */
  assign n222 = i_trigger & n221;
  /* src/ws2811.vhdl:53:68  */
  assign n223 = i_pixel_data[7]; // extract
  /* src/ws2811.vhdl:50:33  */
  assign n225 = n222 ? 1'b1 : n326;
  /* src/ws2811.vhdl:50:33  */
  assign n227 = n222 ? 4'b0001 : cyc_count;
  /* src/ws2811.vhdl:50:33  */
  assign n228 = n222 ? n223 : bit_data_in;
  /* src/ws2811.vhdl:50:33  */
  assign n229 = n222 ? i_pixel_data : rgb;
  /* src/ws2811.vhdl:50:33  */
  assign n231 = n222 ? 1'b1 : running;
  /* src/ws2811.vhdl:59:54  */
  assign n232 = {28'b0, cyc_count};  //  uext
  /* src/ws2811.vhdl:59:54  */
  assign n234 = $signed(n232) < $signed(32'b00000000000000000000000000000111);
  /* src/ws2811.vhdl:60:72  */
  assign n235 = {28'b0, cyc_count};  //  uext
  /* src/ws2811.vhdl:60:72  */
  assign n237 = n235 + 32'b00000000000000000000000000000001;
  /* src/ws2811.vhdl:60:62  */
  assign n238 = n237[3:0];  // trunc
  /* src/ws2811.vhdl:61:85  */
  assign n239 = {28'b0, cyc_count};  //  uext
  /* src/ws2811.vhdl:61:85  */
  assign n241 = n239 == 32'b00000000000000000000000000000101;
  /* src/ws2811.vhdl:61:71  */
  assign n242 = n241 & bit_data_in;
  /* src/ws2811.vhdl:61:113  */
  assign n243 = ~bit_data_in;
  /* src/ws2811.vhdl:61:133  */
  assign n244 = {28'b0, cyc_count};  //  uext
  /* src/ws2811.vhdl:61:133  */
  assign n246 = n244 == 32'b00000000000000000000000000000011;
  /* src/ws2811.vhdl:61:119  */
  assign n247 = n246 & n243;
  /* src/ws2811.vhdl:61:97  */
  assign n248 = n242 | n247;
  /* src/ws2811.vhdl:61:49  */
  assign n250 = n248 ? 1'b0 : n225;
  /* src/ws2811.vhdl:66:62  */
  assign n251 = {28'b0, bit_count};  //  uext
  /* src/ws2811.vhdl:66:62  */
  assign n253 = $signed(n251) < $signed(32'b00000000000000000000000000000111);
  /* src/ws2811.vhdl:67:80  */
  assign n254 = {28'b0, bit_count};  //  uext
  /* src/ws2811.vhdl:67:80  */
  assign n256 = n254 + 32'b00000000000000000000000000000001;
  /* src/ws2811.vhdl:67:70  */
  assign n257 = n256[3:0];  // trunc
  /* src/ws2811.vhdl:68:87  */
  assign n258 = {28'b0, bit_count};  //  uext
  /* src/ws2811.vhdl:68:87  */
  assign n260 = 32'b00000000000000000000000000000111 - n258;
  /* src/ws2811.vhdl:68:99  */
  assign n262 = n260 - 32'b00000000000000000000000000000001;
  /* src/ws2811.vhdl:68:99  */
  assign n263 = n262[2:0];  // trunc
  /* src/ws2811.vhdl:66:49  */
  assign n268 = n253 ? 1'b1 : 1'b0;
  /* src/ws2811.vhdl:66:49  */
  assign n270 = n253 ? n257 : 4'b0000;
  /* src/ws2811.vhdl:66:49  */
  assign n271 = n253 ? n327 : n228;
  /* src/ws2811.vhdl:66:49  */
  assign n273 = n253 ? n231 : 1'b0;
  /* src/ws2811.vhdl:59:41  */
  assign n274 = n234 ? n250 : n268;
  /* src/ws2811.vhdl:59:41  */
  assign n276 = n234 ? n238 : 4'b0000;
  /* src/ws2811.vhdl:59:41  */
  assign n277 = n234 ? bit_count : n270;
  /* src/ws2811.vhdl:59:41  */
  assign n278 = n234 ? n228 : n271;
  /* src/ws2811.vhdl:59:41  */
  assign n279 = n234 ? n231 : n273;
  /* src/ws2811.vhdl:58:33  */
  assign n280 = running ? n274 : n225;
  /* src/ws2811.vhdl:58:33  */
  assign n281 = running ? n276 : n227;
  /* src/ws2811.vhdl:58:33  */
  assign n282 = running ? n277 : bit_count;
  /* src/ws2811.vhdl:58:33  */
  assign n283 = running ? n278 : n228;
  /* src/ws2811.vhdl:58:33  */
  assign n284 = running ? n279 : n231;
  /* src/ws2811.vhdl:41:25  */
  assign n286 = i_reset ? 1'b0 : n280;
  /* src/ws2811.vhdl:41:25  */
  assign n288 = i_reset ? 4'b0000 : n281;
  /* src/ws2811.vhdl:41:25  */
  assign n290 = i_reset ? 4'b0000 : n282;
  /* src/ws2811.vhdl:41:25  */
  assign n292 = i_reset ? 1'b0 : n283;
  /* src/ws2811.vhdl:41:25  */
  assign n294 = i_reset ? 8'b00000000 : n229;
  /* src/ws2811.vhdl:41:25  */
  assign n296 = i_reset ? 1'b0 : n284;
  /* src/ws2811.vhdl:36:9  */
  assign n311 = ~i_reset;
  /* src/ws2811.vhdl:40:17  */
  assign n312 = n311 ? n288 : cyc_count;
  /* src/ws2811.vhdl:40:17  */
  always @(posedge i_clock)
    n313 <= n312;
  /* src/ws2811.vhdl:36:9  */
  assign n314 = ~i_reset;
  /* src/ws2811.vhdl:40:17  */
  assign n315 = n314 ? n290 : bit_count;
  /* src/ws2811.vhdl:40:17  */
  always @(posedge i_clock)
    n316 <= n315;
  /* src/ws2811.vhdl:36:9  */
  assign n317 = ~i_reset;
  /* src/ws2811.vhdl:40:17  */
  assign n318 = n317 ? n292 : bit_data_in;
  /* src/ws2811.vhdl:40:17  */
  always @(posedge i_clock)
    n319 <= n318;
  initial
    n319 = 1'b0;
  /* src/ws2811.vhdl:36:9  */
  assign n320 = ~i_reset;
  /* src/ws2811.vhdl:40:17  */
  assign n321 = n320 ? n294 : rgb;
  /* src/ws2811.vhdl:40:17  */
  always @(posedge i_clock)
    n322 <= n321;
  initial
    n322 = 8'b00000000;
  /* src/ws2811.vhdl:36:9  */
  assign n323 = ~i_reset;
  /* src/ws2811.vhdl:40:17  */
  assign n324 = n323 ? n296 : running;
  /* src/ws2811.vhdl:40:17  */
  always @(posedge i_clock)
    n325 <= n324;
  initial
    n325 = 1'b0;
  /* src/ws2811.vhdl:40:17  */
  always @(posedge i_clock or posedge i_reset)
    if (i_reset)
      n326 <= 1'b0;
    else
      n326 <= n286;
  /* src/ws2811.vhdl:68:99  */
  assign n327 = rgb[n263 * 1 +: 1]; //(Bmux)
endmodule

module spi_8
  (input  i_clock,
   input  i_reset,
   input  i_copi,
   input  i_cs,
   output [7:0] o_word,
   output o_word_ready);
  reg [3:0] bit_count;
  reg [7:0] current_word;
  wire state;
  wire n114;
  wire [31:0] n115;
  wire n117;
  wire [6:0] n118;
  wire [7:0] n119;
  wire [2:0] n120;
  wire [2:0] n122;
  wire [31:0] n125;
  wire [31:0] n127;
  wire [3:0] n128;
  wire [7:0] n129;
  wire n132;
  wire [3:0] n134;
  wire [7:0] n135;
  wire [7:0] n136;
  wire n137;
  wire [3:0] n138;
  wire [7:0] n139;
  wire n141;
  wire n143;
  wire n145;
  wire n147;
  wire [1:0] n148;
  reg [7:0] n149;
  reg n151;
  reg [3:0] n153;
  reg [7:0] n154;
  reg n156;
  reg [3:0] n173;
  reg [7:0] n174;
  reg n175;
  reg [7:0] n176;
  reg n177;
  wire n178;
  wire n179;
  wire n180;
  wire n181;
  wire n182;
  wire n183;
  wire n184;
  wire n185;
  wire n186;
  wire n187;
  wire n188;
  wire n189;
  wire n190;
  wire n191;
  wire n192;
  wire n193;
  wire n194;
  wire n195;
  wire n196;
  wire n197;
  wire n198;
  wire n199;
  wire n200;
  wire n201;
  wire n202;
  wire n203;
  wire n204;
  wire n205;
  wire n206;
  wire n207;
  wire n208;
  wire n209;
  wire n210;
  wire n211;
  wire [7:0] n212;
  assign o_word = n176; //(module output)
  assign o_word_ready = n177; //(module output)
  /* src/spi.vhdl:25:12  */
  always @*
    bit_count = n173; // (isignal)
  initial
    bit_count = 4'b0000;
  /* src/spi.vhdl:26:12  */
  always @*
    current_word = n174; // (isignal)
  initial
    current_word = 8'b00000000;
  /* src/spi.vhdl:33:12  */
  assign state = n175; // (signal)
  /* src/spi.vhdl:47:29  */
  assign n114 = ~i_cs;
  /* src/spi.vhdl:50:38  */
  assign n115 = {28'b0, bit_count};  //  uext
  /* src/spi.vhdl:50:38  */
  assign n117 = n115 == 32'b00000000000000000000000000000111;
  /* src/spi.vhdl:51:51  */
  assign n118 = current_word[7:1]; // extract
  /* src/spi.vhdl:51:69  */
  assign n119 = {n118, i_copi};
  /* src/spi.vhdl:55:42  */
  assign n120 = bit_count[2:0];  // trunc
  /* src/spi.vhdl:55:42  */
  assign n122 = 3'b111 - n120;
  /* src/spi.vhdl:57:52  */
  assign n125 = {28'b0, bit_count};  //  uext
  /* src/spi.vhdl:57:52  */
  assign n127 = n125 + 32'b00000000000000000000000000000001;
  /* src/spi.vhdl:57:42  */
  assign n128 = n127[3:0];  // trunc
  /* src/spi.vhdl:50:25  */
  assign n129 = n117 ? n119 : n176;
  /* src/spi.vhdl:50:25  */
  assign n132 = n117 ? 1'b1 : 1'b0;
  /* src/spi.vhdl:50:25  */
  assign n134 = n117 ? 4'b0000 : n128;
  /* src/spi.vhdl:50:25  */
  assign n135 = n117 ? current_word : n212;
  /* src/spi.vhdl:47:21  */
  assign n136 = n114 ? n176 : n129;
  /* src/spi.vhdl:47:21  */
  assign n137 = n114 ? n177 : n132;
  /* src/spi.vhdl:47:21  */
  assign n138 = n114 ? bit_count : n134;
  /* src/spi.vhdl:47:21  */
  assign n139 = n114 ? current_word : n135;
  /* src/spi.vhdl:47:21  */
  assign n141 = n114 ? 1'b0 : state;
  /* src/spi.vhdl:46:17  */
  assign n143 = state == 1'b1;
  /* src/spi.vhdl:64:21  */
  assign n145 = i_cs ? 1'b1 : state;
  /* src/spi.vhdl:61:17  */
  assign n147 = state == 1'b0;
  assign n148 = {n147, n143};
  /* src/spi.vhdl:45:13  */
  always @*
    case (n148)
      2'b10: n149 = n176;
      2'b01: n149 = n136;
      default: n149 = n176;
    endcase
  /* src/spi.vhdl:45:13  */
  always @*
    case (n148)
      2'b10: n151 = 1'b0;
      2'b01: n151 = n137;
      default: n151 = n177;
    endcase
  /* src/spi.vhdl:45:13  */
  always @*
    case (n148)
      2'b10: n153 = 4'b0000;
      2'b01: n153 = n138;
      default: n153 = bit_count;
    endcase
  /* src/spi.vhdl:45:13  */
  always @*
    case (n148)
      2'b10: n154 = current_word;
      2'b01: n154 = n139;
      default: n154 = current_word;
    endcase
  /* src/spi.vhdl:45:13  */
  always @*
    case (n148)
      2'b10: n156 = n145;
      2'b01: n156 = n141;
      default: n156 = 1'b0;
    endcase
  /* src/spi.vhdl:44:9  */
  always @(posedge i_clock or posedge i_reset)
    if (i_reset)
      n173 <= 4'b0000;
    else
      n173 <= n153;
  /* src/spi.vhdl:44:9  */
  always @(posedge i_clock or posedge i_reset)
    if (i_reset)
      n174 <= 8'b00000000;
    else
      n174 <= n154;
  /* src/spi.vhdl:44:9  */
  always @(posedge i_clock or posedge i_reset)
    if (i_reset)
      n175 <= 1'b1;
    else
      n175 <= n156;
  /* src/spi.vhdl:44:9  */
  always @(posedge i_clock or posedge i_reset)
    if (i_reset)
      n176 <= 8'b00000000;
    else
      n176 <= n149;
  /* src/spi.vhdl:44:9  */
  always @(posedge i_clock or posedge i_reset)
    if (i_reset)
      n177 <= 1'b0;
    else
      n177 <= n151;
  /* src/spi.vhdl:55:29  */
  assign n178 = n122[2]; // extract
  /* src/spi.vhdl:55:29  */
  assign n179 = ~n178;
  /* src/spi.vhdl:55:29  */
  assign n180 = n122[1]; // extract
  /* src/spi.vhdl:55:29  */
  assign n181 = ~n180;
  /* src/spi.vhdl:55:29  */
  assign n182 = n179 & n181;
  /* src/spi.vhdl:55:29  */
  assign n183 = n179 & n180;
  /* src/spi.vhdl:55:29  */
  assign n184 = n178 & n181;
  /* src/spi.vhdl:55:29  */
  assign n185 = n178 & n180;
  /* src/spi.vhdl:55:29  */
  assign n186 = n122[0]; // extract
  /* src/spi.vhdl:55:29  */
  assign n187 = ~n186;
  /* src/spi.vhdl:55:29  */
  assign n188 = n182 & n187;
  /* src/spi.vhdl:55:29  */
  assign n189 = n182 & n186;
  /* src/spi.vhdl:55:29  */
  assign n190 = n183 & n187;
  /* src/spi.vhdl:55:29  */
  assign n191 = n183 & n186;
  /* src/spi.vhdl:55:29  */
  assign n192 = n184 & n187;
  /* src/spi.vhdl:55:29  */
  assign n193 = n184 & n186;
  /* src/spi.vhdl:55:29  */
  assign n194 = n185 & n187;
  /* src/spi.vhdl:55:29  */
  assign n195 = n185 & n186;
  assign n196 = current_word[0]; // extract
  /* src/spi.vhdl:55:29  */
  assign n197 = n188 ? i_copi : n196;
  assign n198 = current_word[1]; // extract
  /* src/spi.vhdl:55:29  */
  assign n199 = n189 ? i_copi : n198;
  assign n200 = current_word[2]; // extract
  /* src/spi.vhdl:55:29  */
  assign n201 = n190 ? i_copi : n200;
  assign n202 = current_word[3]; // extract
  /* src/spi.vhdl:55:29  */
  assign n203 = n191 ? i_copi : n202;
  assign n204 = current_word[4]; // extract
  /* src/spi.vhdl:55:29  */
  assign n205 = n192 ? i_copi : n204;
  assign n206 = current_word[5]; // extract
  /* src/spi.vhdl:55:29  */
  assign n207 = n193 ? i_copi : n206;
  assign n208 = current_word[6]; // extract
  /* src/spi.vhdl:55:29  */
  assign n209 = n194 ? i_copi : n208;
  assign n210 = current_word[7]; // extract
  /* src/spi.vhdl:55:29  */
  assign n211 = n195 ? i_copi : n210;
  assign n212 = {n211, n209, n207, n205, n203, n201, n199, n197};
endmodule

module tt_um_spi2ws2811x16
  (input  clk,
   input  rst_n,
   input  ena,
   input  [7:0] ui_in,
   input  [7:0] uio_in,
   output [7:0] uio_oe,
   output [7:0] uo_out,
   output [7:0] uio_out);
  wire rst;
  wire led_rst;
  wire [7:0] word;
  wire word_ready;
  wire [7:0] strip_trigger;
  reg [2:0] strip_counter;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  localparam [7:0] n8 = 8'b00000000;
  localparam [7:0] n9 = 8'b00000000;
  wire n10;
  wire n11;
  wire \led_o_n1_led.o_data ;
  wire n14;
  wire \led_o_n2_led.o_data ;
  wire n16;
  wire \led_o_n3_led.o_data ;
  wire n18;
  wire \led_o_n4_led.o_data ;
  wire n20;
  wire \led_o_n5_led.o_data ;
  wire n22;
  wire \led_o_n6_led.o_data ;
  wire n24;
  wire \led_o_n7_led.o_data ;
  wire n26;
  wire \led_o_n8_led.o_data ;
  wire n28;
  wire [31:0] n33;
  wire n35;
  wire [31:0] n36;
  wire [31:0] n38;
  wire [2:0] n39;
  wire [2:0] n41;
  wire [31:0] n47;
  wire n49;
  wire n50;
  wire n51;
  wire [31:0] n54;
  wire n56;
  wire n57;
  wire n58;
  wire [31:0] n61;
  wire n63;
  wire n64;
  wire n65;
  wire [31:0] n68;
  wire n70;
  wire n71;
  wire n72;
  wire [31:0] n75;
  wire n77;
  wire n78;
  wire n79;
  wire [31:0] n82;
  wire n84;
  wire n85;
  wire n86;
  wire [31:0] n89;
  wire n91;
  wire n92;
  wire n93;
  wire [31:0] n96;
  wire n98;
  wire n99;
  wire n100;
  wire [7:0] n104;
  reg [2:0] n105;
  wire [7:0] n106;
  assign uio_oe = n8; //(module output)
  assign uo_out = n106; //(module output)
  assign uio_out = n9; //(module output)
  /* src/top.vhdl:21:16  */
  assign rst = n4; // (signal)
  /* src/top.vhdl:22:16  */
  assign led_rst = n7; // (signal)
  /* src/top.vhdl:29:16  */
  assign strip_trigger = n104; // (signal)
  /* src/top.vhdl:30:16  */
  always @*
    strip_counter = n105; // (isignal)
  initial
    strip_counter = 3'b000;
  /* src/top.vhdl:32:16  */
  assign n4 = ~rst_n;
  /* src/top.vhdl:33:40  */
  assign n5 = ui_in[0]; // extract
  /* src/top.vhdl:33:31  */
  assign n6 = rst_n & n5;
  /* src/top.vhdl:33:20  */
  assign n7 = ~n6;
  /* src/top.vhdl:37:9  */
  spi_8 spi_controller (
    .i_clock(clk),
    .i_reset(rst),
    .i_copi(n10),
    .i_cs(n11),
    .o_word(word),
    .o_word_ready(word_ready));
  /* src/top.vhdl:43:32  */
  assign n10 = ui_in[1]; // extract
  /* src/top.vhdl:42:30  */
  assign n11 = ui_in[0]; // extract
  /* src/top.vhdl:52:17  */
  ws2811_8 led_o_n1_led (
    .i_clock(clk),
    .i_reset(led_rst),
    .i_trigger(n14),
    .i_pixel_data(word),
    .o_data(\led_o_n1_led.o_data ));
  /* src/top.vhdl:57:51  */
  assign n14 = strip_trigger[0]; // extract
  /* src/top.vhdl:52:17  */
  ws2811_8 led_o_n2_led (
    .i_clock(clk),
    .i_reset(led_rst),
    .i_trigger(n16),
    .i_pixel_data(word),
    .o_data(\led_o_n2_led.o_data ));
  /* src/top.vhdl:57:51  */
  assign n16 = strip_trigger[1]; // extract
  /* src/top.vhdl:52:17  */
  ws2811_8 led_o_n3_led (
    .i_clock(clk),
    .i_reset(led_rst),
    .i_trigger(n18),
    .i_pixel_data(word),
    .o_data(\led_o_n3_led.o_data ));
  /* src/top.vhdl:57:51  */
  assign n18 = strip_trigger[2]; // extract
  /* src/top.vhdl:52:17  */
  ws2811_8 led_o_n4_led (
    .i_clock(clk),
    .i_reset(led_rst),
    .i_trigger(n20),
    .i_pixel_data(word),
    .o_data(\led_o_n4_led.o_data ));
  /* src/top.vhdl:57:51  */
  assign n20 = strip_trigger[3]; // extract
  /* src/top.vhdl:52:17  */
  ws2811_8 led_o_n5_led (
    .i_clock(clk),
    .i_reset(led_rst),
    .i_trigger(n22),
    .i_pixel_data(word),
    .o_data(\led_o_n5_led.o_data ));
  /* src/top.vhdl:57:51  */
  assign n22 = strip_trigger[4]; // extract
  /* src/top.vhdl:52:17  */
  ws2811_8 led_o_n6_led (
    .i_clock(clk),
    .i_reset(led_rst),
    .i_trigger(n24),
    .i_pixel_data(word),
    .o_data(\led_o_n6_led.o_data ));
  /* src/top.vhdl:57:51  */
  assign n24 = strip_trigger[5]; // extract
  /* src/top.vhdl:52:17  */
  ws2811_8 led_o_n7_led (
    .i_clock(clk),
    .i_reset(led_rst),
    .i_trigger(n26),
    .i_pixel_data(word),
    .o_data(\led_o_n7_led.o_data ));
  /* src/top.vhdl:57:51  */
  assign n26 = strip_trigger[6]; // extract
  /* src/top.vhdl:52:17  */
  ws2811_8 led_o_n8_led (
    .i_clock(clk),
    .i_reset(led_rst),
    .i_trigger(n28),
    .i_pixel_data(word),
    .o_data(\led_o_n8_led.o_data ));
  /* src/top.vhdl:57:51  */
  assign n28 = strip_trigger[7]; // extract
  /* src/top.vhdl:69:42  */
  assign n33 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:69:42  */
  assign n35 = $signed(n33) < $signed(32'b00000000000000000000000000000111);
  /* src/top.vhdl:70:64  */
  assign n36 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:70:64  */
  assign n38 = n36 + 32'b00000000000000000000000000000001;
  /* src/top.vhdl:70:50  */
  assign n39 = n38[2:0];  // trunc
  /* src/top.vhdl:69:25  */
  assign n41 = n35 ? n39 : 3'b000;
  /* src/top.vhdl:78:82  */
  assign n47 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:78:82  */
  assign n49 = n47 == 32'b00000000000000000000000000000000;
  /* src/top.vhdl:78:64  */
  assign n50 = n49 & word_ready;
  /* src/top.vhdl:78:41  */
  assign n51 = n50 ? 1'b1 : 1'b0;
  /* src/top.vhdl:78:82  */
  assign n54 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:78:82  */
  assign n56 = n54 == 32'b00000000000000000000000000000001;
  /* src/top.vhdl:78:64  */
  assign n57 = n56 & word_ready;
  /* src/top.vhdl:78:41  */
  assign n58 = n57 ? 1'b1 : 1'b0;
  /* src/top.vhdl:78:82  */
  assign n61 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:78:82  */
  assign n63 = n61 == 32'b00000000000000000000000000000010;
  /* src/top.vhdl:78:64  */
  assign n64 = n63 & word_ready;
  /* src/top.vhdl:78:41  */
  assign n65 = n64 ? 1'b1 : 1'b0;
  /* src/top.vhdl:78:82  */
  assign n68 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:78:82  */
  assign n70 = n68 == 32'b00000000000000000000000000000011;
  /* src/top.vhdl:78:64  */
  assign n71 = n70 & word_ready;
  /* src/top.vhdl:78:41  */
  assign n72 = n71 ? 1'b1 : 1'b0;
  /* src/top.vhdl:78:82  */
  assign n75 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:78:82  */
  assign n77 = n75 == 32'b00000000000000000000000000000100;
  /* src/top.vhdl:78:64  */
  assign n78 = n77 & word_ready;
  /* src/top.vhdl:78:41  */
  assign n79 = n78 ? 1'b1 : 1'b0;
  /* src/top.vhdl:78:82  */
  assign n82 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:78:82  */
  assign n84 = n82 == 32'b00000000000000000000000000000101;
  /* src/top.vhdl:78:64  */
  assign n85 = n84 & word_ready;
  /* src/top.vhdl:78:41  */
  assign n86 = n85 ? 1'b1 : 1'b0;
  /* src/top.vhdl:78:82  */
  assign n89 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:78:82  */
  assign n91 = n89 == 32'b00000000000000000000000000000110;
  /* src/top.vhdl:78:64  */
  assign n92 = n91 & word_ready;
  /* src/top.vhdl:78:41  */
  assign n93 = n92 ? 1'b1 : 1'b0;
  /* src/top.vhdl:78:82  */
  assign n96 = {29'b0, strip_counter};  //  uext
  /* src/top.vhdl:78:82  */
  assign n98 = n96 == 32'b00000000000000000000000000000111;
  /* src/top.vhdl:78:64  */
  assign n99 = n98 & word_ready;
  /* src/top.vhdl:78:41  */
  assign n100 = n99 ? 1'b1 : 1'b0;
  assign n104 = {n100, n93, n86, n79, n72, n65, n58, n51};
  /* src/top.vhdl:68:17  */
  always @(negedge word_ready or posedge rst)
    if (rst)
      n105 <= 3'b000;
    else
      n105 <= n41;
  /* src/top.vhdl:66:17  */
  assign n106 = {\led_o_n8_led.o_data , \led_o_n7_led.o_data , \led_o_n6_led.o_data , \led_o_n5_led.o_data , \led_o_n4_led.o_data , \led_o_n3_led.o_data , \led_o_n2_led.o_data , \led_o_n1_led.o_data };
endmodule

