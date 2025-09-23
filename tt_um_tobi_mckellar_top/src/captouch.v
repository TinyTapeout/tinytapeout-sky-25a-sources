module capacitivetouch
  (input  clk,
   input  reset,
   input  cap_in,
   output cap_out,
   output cap_oe,
   output btn);
  reg [1:0] state;
  wire [14:0] counter;
  wire [14:0] calibration_rise_time;
  wire discharging;
  wire btn_state;
  wire [3:0] btn_state_debouncer;
  wire debounced_btn_state;
  wire sync_ff1;
  wire sync_ff2;
  localparam n4_o = 1'b0;
  wire n6_o;
  wire n12_o;
  wire [31:0] n14_o;
  wire [31:0] n16_o;
  wire [14:0] n17_o;
  wire [31:0] n18_o;
  wire n20_o;
  wire [1:0] n22_o;
  wire [14:0] n24_o;
  wire n27_o;
  wire n30_o;
  wire [31:0] n31_o;
  wire [31:0] n33_o;
  wire [14:0] n34_o;
  wire [1:0] n36_o;
  wire [14:0] n38_o;
  wire [14:0] n39_o;
  wire n41_o;
  wire n43_o;
  wire [31:0] n44_o;
  wire [31:0] n46_o;
  wire [14:0] n47_o;
  wire [31:0] n48_o;
  wire n50_o;
  wire [1:0] n52_o;
  wire [14:0] n54_o;
  wire n57_o;
  wire n60_o;
  wire [31:0] n61_o;
  wire [31:0] n63_o;
  wire [14:0] n64_o;
  wire [31:0] n65_o;
  wire [31:0] n66_o;
  wire [9:0] n68_o;
  wire [9:0] n70_o;
  wire [30:0] n71_o;
  wire [31:0] n72_o;
  wire [31:0] n73_o;
  wire n74_o;
  wire n77_o;
  wire [2:0] n78_o;
  wire n80_o;
  wire n82_o;
  wire n84_o;
  wire n86_o;
  wire [1:0] n88_o;
  wire [14:0] n90_o;
  wire n92_o;
  wire n93_o;
  wire [3:0] n94_o;
  wire [3:0] n95_o;
  wire n96_o;
  wire n99_o;
  wire [3:0] n100_o;
  reg [1:0] n102_o;
  reg [14:0] n104_o;
  reg [14:0] n106_o;
  reg n108_o;
  reg n110_o;
  reg [3:0] n112_o;
  reg n114_o;
  reg [1:0] n148_q;
  reg [14:0] n149_q;
  wire n150_o;
  wire [14:0] n151_o;
  reg [14:0] n152_q;
  reg n153_q;
  reg n154_q;
  reg [3:0] n155_q;
  reg n156_q;
  reg n157_q;
  reg n158_q;
  assign cap_out = n4_o;
  assign cap_oe = n6_o;
  assign btn = debounced_btn_state;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:20:12  */
  always @*
    state = n148_q; // (isignal)
  initial
    state = 2'b00;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:25:12  */
  assign counter = n149_q; // (signal)
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:26:12  */
  assign calibration_rise_time = n152_q; // (signal)
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:28:12  */
  assign discharging = n153_q; // (signal)
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:29:12  */
  assign btn_state = n154_q; // (signal)
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:30:12  */
  assign btn_state_debouncer = n155_q; // (signal)
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:31:12  */
  assign debounced_btn_state = n156_q; // (signal)
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:33:12  */
  assign sync_ff1 = n157_q; // (signal)
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:34:12  */
  assign sync_ff2 = n158_q; // (signal)
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:38:19  */
  assign n6_o = discharging ? 1'b1 : 1'b0;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:45:18  */
  assign n12_o = ~reset;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:63:40  */
  assign n14_o = {17'b0, counter};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:63:40  */
  assign n16_o = n14_o + 32'b00000000000000000000000000000001;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:63:32  */
  assign n17_o = n16_o[14:0];  // trunc
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:65:32  */
  assign n18_o = {17'b0, counter};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:65:32  */
  assign n20_o = $signed(n18_o) >= $signed(32'b00000000000000000000000000001010);
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:65:21  */
  assign n22_o = n20_o ? 2'b01 : state;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:65:21  */
  assign n24_o = n20_o ? 15'b000000000000000 : n17_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:65:21  */
  assign n27_o = n20_o ? 1'b0 : 1'b1;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:62:17  */
  assign n30_o = state == 2'b00;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:72:40  */
  assign n31_o = {17'b0, counter};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:72:40  */
  assign n33_o = n31_o + 32'b00000000000000000000000000000001;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:72:32  */
  assign n34_o = n33_o[14:0];  // trunc
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:73:21  */
  assign n36_o = sync_ff2 ? 2'b10 : state;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:73:21  */
  assign n38_o = sync_ff2 ? 15'b000000000000000 : n34_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:73:21  */
  assign n39_o = sync_ff2 ? counter : calibration_rise_time;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:73:21  */
  assign n41_o = sync_ff2 ? 1'b1 : discharging;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:71:17  */
  assign n43_o = state == 2'b01;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:81:40  */
  assign n44_o = {17'b0, counter};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:81:40  */
  assign n46_o = n44_o + 32'b00000000000000000000000000000001;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:81:32  */
  assign n47_o = n46_o[14:0];  // trunc
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:83:32  */
  assign n48_o = {17'b0, counter};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:83:32  */
  assign n50_o = $signed(n48_o) >= $signed(32'b00000000000000000000000000001010);
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:83:21  */
  assign n52_o = n50_o ? 2'b11 : state;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:83:21  */
  assign n54_o = n50_o ? 15'b000000000000000 : n47_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:83:21  */
  assign n57_o = n50_o ? 1'b0 : 1'b1;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:80:17  */
  assign n60_o = state == 2'b10;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:90:36  */
  assign n61_o = {17'b0, counter};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:90:36  */
  assign n63_o = n61_o + 32'b00000000000000000000000000000001;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:90:28  */
  assign n64_o = n63_o[14:0];  // trunc
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:92:25  */
  assign n65_o = {17'b0, counter};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:96:66  */
  assign n66_o = {17'b0, calibration_rise_time};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:96:91  */
  assign n68_o = calibration_rise_time[9:0];  // trunc
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:96:79  */
  assign n70_o = n68_o >> 31'b0000000000000000000000000000011;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:96:68  */
  assign n71_o = {21'b0, n70_o};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:96:66  */
  assign n72_o = {1'b0, n71_o};  //  uext
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:96:66  */
  assign n73_o = n66_o + n72_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:96:42  */
  assign n74_o = $signed(n65_o) > $signed(n73_o);
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:96:25  */
  assign n77_o = n74_o ? 1'b1 : 1'b0;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:101:79  */
  assign n78_o = btn_state_debouncer[2:0];
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:107:48  */
  assign n80_o = btn_state_debouncer == 4'b1111;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:109:51  */
  assign n82_o = btn_state_debouncer == 4'b0000;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:109:25  */
  assign n84_o = n82_o ? 1'b0 : debounced_btn_state;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:107:25  */
  assign n86_o = n80_o ? 1'b1 : n84_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:91:21  */
  assign n88_o = sync_ff2 ? 2'b10 : state;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:91:21  */
  assign n90_o = sync_ff2 ? 15'b000000000000000 : n64_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:91:21  */
  assign n92_o = sync_ff2 ? 1'b1 : discharging;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:91:21  */
  assign n93_o = sync_ff2 ? n77_o : btn_state;
  assign n94_o = {n78_o, btn_state};
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:91:21  */
  assign n95_o = sync_ff2 ? n94_o : btn_state_debouncer;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:91:21  */
  assign n96_o = sync_ff2 ? n86_o : debounced_btn_state;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:89:17  */
  assign n99_o = state == 2'b11;
  assign n100_o = {n99_o, n60_o, n43_o, n30_o};
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:61:13  */
  always @*
    case (n100_o)
      4'b1000: n102_o = n88_o;
      4'b0100: n102_o = n52_o;
      4'b0010: n102_o = n36_o;
      4'b0001: n102_o = n22_o;
      default: n102_o = 2'bX;
    endcase
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:61:13  */
  always @*
    case (n100_o)
      4'b1000: n104_o = n90_o;
      4'b0100: n104_o = n54_o;
      4'b0010: n104_o = n38_o;
      4'b0001: n104_o = n24_o;
      default: n104_o = 15'bX;
    endcase
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:61:13  */
  always @*
    case (n100_o)
      4'b1000: n106_o = calibration_rise_time;
      4'b0100: n106_o = calibration_rise_time;
      4'b0010: n106_o = n39_o;
      4'b0001: n106_o = calibration_rise_time;
      default: n106_o = 15'bX;
    endcase
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:61:13  */
  always @*
    case (n100_o)
      4'b1000: n108_o = n92_o;
      4'b0100: n108_o = n57_o;
      4'b0010: n108_o = n41_o;
      4'b0001: n108_o = n27_o;
      default: n108_o = 1'bX;
    endcase
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:61:13  */
  always @*
    case (n100_o)
      4'b1000: n110_o = n93_o;
      4'b0100: n110_o = btn_state;
      4'b0010: n110_o = btn_state;
      4'b0001: n110_o = btn_state;
      default: n110_o = 1'bX;
    endcase
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:61:13  */
  always @*
    case (n100_o)
      4'b1000: n112_o = n95_o;
      4'b0100: n112_o = btn_state_debouncer;
      4'b0010: n112_o = btn_state_debouncer;
      4'b0001: n112_o = btn_state_debouncer;
      default: n112_o = 4'bX;
    endcase
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:61:13  */
  always @*
    case (n100_o)
      4'b1000: n114_o = n96_o;
      4'b0100: n114_o = debounced_btn_state;
      4'b0010: n114_o = debounced_btn_state;
      4'b0001: n114_o = debounced_btn_state;
      default: n114_o = 1'bX;
    endcase
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  always @(posedge clk or posedge n12_o)
    if (n12_o)
      n148_q <= 2'b00;
    else
      n148_q <= n102_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  always @(posedge clk or posedge n12_o)
    if (n12_o)
      n149_q <= 15'b000000000000000;
    else
      n149_q <= n104_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:41:5  */
  assign n150_o = ~n12_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  assign n151_o = n150_o ? n106_o : calibration_rise_time;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  always @(posedge clk)
    n152_q <= n151_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  always @(posedge clk or posedge n12_o)
    if (n12_o)
      n153_q <= 1'b1;
    else
      n153_q <= n108_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  always @(posedge clk or posedge n12_o)
    if (n12_o)
      n154_q <= 1'b0;
    else
      n154_q <= n110_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  always @(posedge clk or posedge n12_o)
    if (n12_o)
      n155_q <= 4'b0000;
    else
      n155_q <= n112_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  always @(posedge clk or posedge n12_o)
    if (n12_o)
      n156_q <= 1'b0;
    else
      n156_q <= n114_o;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  always @(posedge clk or posedge n12_o)
    if (n12_o)
      n157_q <= 1'b0;
    else
      n157_q <= cap_in;
  /* /Users/tobimckellar/Desktop/TinyTapeout/ttsky-verilog-template/test/../src/captouch.vhd:57:9  */
  always @(posedge clk or posedge n12_o)
    if (n12_o)
      n158_q <= 1'b0;
    else
      n158_q <= sync_ff1;
endmodule

