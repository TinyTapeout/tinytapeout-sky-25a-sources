/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : main                                                         **
 **                                                                          **
 *****************************************************************************/

module main( clock_i,
             ram_addr_o,
             ram_data_i,
             ram_data_o,
             ram_rw_en_o,
             reset_i,
             stop_lamp_o,
             state_ir_o,
             state_acc_o,
             state_pc_o );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        clock_i;
   input [31:0] ram_data_i;
   input        reset_i;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [4:0]  ram_addr_o;
   output [31:0] ram_data_o;
   output        ram_rw_en_o;
   output        stop_lamp_o;

   output [4:0] state_ir_o;
   output [31:0] state_acc_o;
   output [31:0] state_pc_o;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [4:0]  s_logisimBus1;
   wire [31:0] s_logisimBus11;
   wire [4:0]  s_logisimBus13;
   wire [4:0]  s_logisimBus15;
   wire [2:0]  s_logisimBus16;
   wire [4:0]  s_logisimBus17;
   wire [4:0]  s_logisimBus19;
   wire [31:0] s_logisimBus2;
   wire [4:0]  s_logisimBus20;
   wire [4:0]  s_logisimBus23;
   wire [4:0]  s_logisimBus25;
   wire [4:0]  s_logisimBus28;
   wire [31:0] s_logisimBus30;
   wire [4:0]  s_logisimBus31;
   wire [4:0]  s_logisimBus32;
   wire [4:0]  s_logisimBus36;
   wire [31:0] s_logisimBus37;
   wire [31:0] s_logisimBus38;
   wire [4:0]  s_logisimBus4;
   wire [31:0] s_logisimBus42;
   wire [4:0]  s_logisimBus44;
   wire [4:0]  s_logisimBus47;
   wire [4:0]  s_logisimBus5;
   wire [4:0]  s_logisimBus55;
   wire [31:0] s_logisimBus6;
   wire [4:0]  s_logisimBus68;
   wire [4:0]  s_logisimBus69;
   wire [4:0]  s_logisimBus70;
   wire [4:0]  s_logisimBus71;
   wire [4:0]  s_logisimBus72;
   wire [31:0] s_logisimBus73;
   wire [31:0] s_logisimBus74;
   wire [4:0]  s_logisimBus75;
   wire [4:0]  s_logisimBus76;
   wire [4:0]  s_logisimBus77;
   wire [4:0]  s_logisimBus78;
   wire [4:0]  s_logisimBus79;
   wire [31:0] s_logisimBus8;
   wire [31:0] s_logisimBus80;
   wire [31:0] s_logisimBus81;
   wire [4:0]  s_logisimBus82;
   wire        s_logisimNet10;
   wire        s_logisimNet14;
   wire        s_logisimNet18;
   wire        s_logisimNet21;
   wire        s_logisimNet22;
   wire        s_logisimNet24;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet39;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet46;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet59;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet7;
   wire        s_logisimNet83;
   wire        s_logisimNet84;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus11[31:0] = ram_data_i;
   assign s_logisimNet48       = reset_i;
   assign s_logisimNet84       = clock_i;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ram_addr_o  = s_logisimBus28[4:0];
   assign ram_data_o  = s_logisimBus8[31:0];
   assign ram_rw_en_o = s_logisimNet41;
   assign stop_lamp_o = s_logisimNet46;

   
   // expose internal register states
   assign state_ir_o = s_logisimBus6[31:0];
   assign state_acc_o = s_logisimBus8[31:0];
   assign state_pc_o = s_logisimBus4[4:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Constant
   assign  s_logisimBus80[31:0]  =  32'h00000000;


   // Constant
   assign  s_logisimBus68[4:0]  =  {1'b0, 4'h0};


   // Constant
   assign  s_logisimBus69[4:0]  =  {1'b0, 4'h0};


   // Constant
   assign  s_logisimBus70[4:0]  =  {1'b0, 4'h0};


   // Constant
   assign  s_logisimBus71[4:0]  =  {1'b0, 4'h0};


   // Constant
   assign  s_logisimBus72[4:0]  =  {1'b0, 4'h0};


   // Constant
   assign  s_logisimBus73[31:0]  =  32'h00000000;


   // Constant
   assign  s_logisimBus74[31:0]  =  32'h00000000;


   // Constant
   assign  s_logisimNet83  =  1'b0;


   // Constant
   assign  s_logisimBus81[31:0]  =  32'h00000000;


   // Constant
   assign  s_logisimNet33  =  1'b1;


   // Constant
   assign  s_logisimBus31[4:1]  =  4'h0;


   // Constant
   assign  s_logisimBus82[4:0]  =  {1'b0, 4'h1};


   // Constant
   assign  s_logisimBus75[4:0]  =  {1'b0, 4'h0};


   // Constant
   assign  s_logisimBus76[4:0]  =  {1'b0, 4'h0};


   // Constant
   assign  s_logisimBus77[4:0]  =  {1'b0, 4'h0};


   // Constant
   assign  s_logisimBus78[4:0]  =  {1'b0, 4'h0};


   // Constant
   assign  s_logisimBus79[4:0]  =  {1'b0, 4'h0};


   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet59),
               .input2(s_logisimNet60),
               .result(s_logisimNet34));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet62),
               .input2(s_logisimNet64),
               .result(s_logisimNet3));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet62),
               .input2(s_logisimNet61),
               .result(s_logisimNet41));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet62),
               .input2(s_logisimNet65),
               .result(s_logisimNet40));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet63),
               .input2(s_logisimNet34),
               .result(s_logisimNet29));

   OR_GATE_BUS_5_INPUTS #(.BubblesMask({1'b0, 4'h0}),
                          .NrOfBits(5))
      GATES_6 (.input1(s_logisimBus55[4:0]),
               .input2(s_logisimBus13[4:0]),
               .input3(s_logisimBus23[4:0]),
               .input4(s_logisimBus1[4:0]),
               .input5(s_logisimBus32[4:0]),
               .result(s_logisimBus28[4:0]));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet63),
               .input2(s_logisimNet65),
               .result(s_logisimNet7));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet63),
               .input2(s_logisimNet64),
               .result(s_logisimNet14));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet35),
               .input2(s_logisimNet63),
               .result(s_logisimNet51));

   OR_GATE_BUS #(.BubblesMask(2'b00),
                 .NrOfBits(32))
      GATES_10 (.input1(s_logisimBus2[31:0]),
                .input2(s_logisimBus30[31:0]),
                .result(s_logisimBus37[31:0]));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimNet14),
                .input2(s_logisimNet7),
                .result(s_logisimNet24));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimNet21),
                .input2(s_logisimNet54),
                .result(s_logisimNet65));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_13 (.input1(s_logisimNet65),
                .input2(s_logisimNet64),
                .input3(s_logisimNet61),
                .result(s_logisimNet52));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet59),
                .input2(s_logisimNet67),
                .result(s_logisimNet27));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimNet57),
                .input2(s_logisimNet67),
                .result(s_logisimNet10));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimNet60),
                .input2(s_logisimNet67),
                .result(s_logisimNet39));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimNet52),
                .input2(s_logisimNet67),
                .result(s_logisimNet22));

   OR_GATE_BUS_5_INPUTS #(.BubblesMask({1'b0, 4'h0}),
                          .NrOfBits(5))
      GATES_18 (.input1(s_logisimBus44[4:0]),
                .input2(s_logisimBus17[4:0]),
                .input3(s_logisimBus25[4:0]),
                .input4(s_logisimBus20[4:0]),
                .input5(s_logisimBus5[4:0]),
                .result(s_logisimBus36[4:0]));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_19 (.input1(s_logisimNet66),
                .input2(s_logisimNet67),
                .result(s_logisimNet9));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_20 (.enable(1'b1),
                  .muxIn_0(s_logisimBus68[4:0]),
                  .muxIn_1(s_logisimBus4[4:0]),
                  .muxOut(s_logisimBus55[4:0]),
                  .sel(s_logisimNet56));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_21 (.enable(1'b1),
                  .muxIn_0(s_logisimBus69[4:0]),
                  .muxIn_1(s_logisimBus6[4:0]),
                  .muxOut(s_logisimBus13[4:0]),
                  .sel(s_logisimNet3));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_22 (.enable(1'b1),
                  .muxIn_0(s_logisimBus70[4:0]),
                  .muxIn_1(s_logisimBus6[4:0]),
                  .muxOut(s_logisimBus23[4:0]),
                  .sel(s_logisimNet41));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_23 (.enable(1'b1),
                  .muxIn_0(s_logisimBus71[4:0]),
                  .muxIn_1(s_logisimBus6[4:0]),
                  .muxOut(s_logisimBus1[4:0]),
                  .sel(s_logisimNet40));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_24 (.enable(1'b1),
                  .muxIn_0(s_logisimBus72[4:0]),
                  .muxIn_1(s_logisimBus6[4:0]),
                  .muxOut(s_logisimBus32[4:0]),
                  .sel(s_logisimNet29));

   Multiplexer_bus_2 #(.nrOfBits(32))
      PLEXERS_25 (.enable(1'b1),
                  .muxIn_0(s_logisimBus73[31:0]),
                  .muxIn_1(s_logisimBus38[31:0]),
                  .muxOut(s_logisimBus30[31:0]),
                  .sel(s_logisimNet7));

   Multiplexer_bus_2 #(.nrOfBits(32))
      PLEXERS_26 (.enable(1'b1),
                  .muxIn_0(s_logisimBus74[31:0]),
                  .muxIn_1(s_logisimBus42[31:0]),
                  .muxOut(s_logisimBus2[31:0]),
                  .sel(s_logisimNet14));

   Decoder_8   PLEXERS_27 (.decoderOut_0(s_logisimNet59),
                           .decoderOut_1(s_logisimNet60),
                           .decoderOut_2(s_logisimNet64),
                           .decoderOut_3(s_logisimNet61),
                           .decoderOut_4(s_logisimNet21),
                           .decoderOut_5(s_logisimNet54),
                           .decoderOut_6(s_logisimNet57),
                           .decoderOut_7(s_logisimNet35),
                           .enable(1'b1),
                           .sel(s_logisimBus6[15:13]));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_28 (.enable(1'b1),
                  .muxIn_0(s_logisimBus75[4:0]),
                  .muxIn_1(s_logisimBus15[4:0]),
                  .muxOut(s_logisimBus44[4:0]),
                  .sel(s_logisimNet66));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_29 (.enable(1'b1),
                  .muxIn_0(s_logisimBus76[4:0]),
                  .muxIn_1(s_logisimBus11[4:0]),
                  .muxOut(s_logisimBus17[4:0]),
                  .sel(s_logisimNet27));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_30 (.enable(1'b1),
                  .muxIn_0(s_logisimBus77[4:0]),
                  .muxIn_1(s_logisimBus19[4:0]),
                  .muxOut(s_logisimBus25[4:0]),
                  .sel(s_logisimNet10));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_31 (.enable(1'b1),
                  .muxIn_0(s_logisimBus78[4:0]),
                  .muxIn_1(s_logisimBus47[4:0]),
                  .muxOut(s_logisimBus20[4:0]),
                  .sel(s_logisimNet39));

   Multiplexer_bus_2 #(.nrOfBits(5))
      PLEXERS_32 (.enable(1'b1),
                  .muxIn_0(s_logisimBus79[4:0]),
                  .muxIn_1(s_logisimBus4[4:0]),
                  .muxOut(s_logisimBus5[4:0]),
                  .sel(s_logisimNet22));

   Decoder_8   PLEXERS_33 (.decoderOut_0(s_logisimNet66),
                           .decoderOut_1(s_logisimNet56),
                           .decoderOut_2(s_logisimNet50),
                           .decoderOut_3(s_logisimNet62),
                           .decoderOut_4(s_logisimNet63),
                           .decoderOut_5(s_logisimNet67),
                           .decoderOut_6(s_logisimNet53),
                           .decoderOut_7(s_logisimNet26),
                           .enable(1'b1),
                           .sel(s_logisimBus16[2:0]));

   Subtractor #(.extendedBits(33),
                .nrOfBits(32))
      ARITH_34 (.borrowIn(1'b0),
                .borrowOut(),
                .dataA(s_logisimBus8[31:0]),
                .dataB(s_logisimBus11[31:0]),
                .result(s_logisimBus38[31:0]));

   Subtractor #(.extendedBits(33),
                .nrOfBits(32))
      ARITH_35 (.borrowIn(1'b0),
                .borrowOut(),
                .dataA(s_logisimBus80[31:0]),
                .dataB(s_logisimBus11[31:0]),
                .result(s_logisimBus42[31:0]));

   Comparator #(.nrOfBits(32),
                .twosComplement(1))
      ARITH_36 (.aEqualsB(),
                .aGreaterThanB(),
                .aLessThanB(s_logisimBus31[0]),
                .dataA(s_logisimBus8[31:0]),
                .dataB(s_logisimBus81[31:0]));

   Adder #(.extendedBits(6),
           .nrOfBits(5))
      ARITH_37 (.carryIn(1'b0),
                .carryOut(),
                .dataA(s_logisimBus11[4:0]),
                .dataB(s_logisimBus4[4:0]),
                .result(s_logisimBus47[4:0]));

   Adder #(.extendedBits(6),
           .nrOfBits(5))
      ARITH_38 (.carryIn(1'b0),
                .carryOut(),
                .dataA(s_logisimBus82[4:0]),
                .dataB(s_logisimBus4[4:0]),
                .result(s_logisimBus15[4:0]));

   Adder #(.extendedBits(6),
           .nrOfBits(5))
      ARITH_39 (.carryIn(1'b0),
                .carryOut(),
                .dataA(s_logisimBus4[4:0]),
                .dataB(s_logisimBus31[4:0]),
                .result(s_logisimBus19[4:0]));

   REGISTER_FLIP_FLOP #(.invertClock(0),
                        .nrOfBits(32))
      IR (.clock(s_logisimNet84),
          .clockEnable(s_logisimNet50),
          .d(s_logisimBus11[31:0]),
          .q(s_logisimBus6[31:0]),
          .reset(s_logisimNet48),
          .tick(1'b1));

   S_R_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_41 (.clock(s_logisimNet84),
                 .preset(1'b0),
                 .q(s_logisimNet46),
                 .qBar(s_logisimNet18),
                 .r(s_logisimNet83),
                 .reset(s_logisimNet48),
                 .s(s_logisimNet51),
                 .tick(1'b1));

   REGISTER_FLIP_FLOP #(.invertClock(0),
                        .nrOfBits(32))
      Acc (.clock(s_logisimNet84),
           .clockEnable(s_logisimNet24),
           .d(s_logisimBus37[31:0]),
           .q(s_logisimBus8[31:0]),
           .reset(s_logisimNet48),
           .tick(1'b1));

   LogisimCounter #(.invertClock(0),
                    .maxVal(3'b111),
                    .mode(0),
                    .width(3))
      MEMORY_43 (.clear(s_logisimNet48),
                 .clock(s_logisimNet84),
                 .compareOut(),
                 .countValue(s_logisimBus16[2:0]),
                 .enable(s_logisimNet18),
                 .load(1'b0),
                 .loadData(3'd0),
                 .tick(1'b1),
                 .upNotDown(s_logisimNet33));

   REGISTER_FLIP_FLOP #(.invertClock(0),
                        .nrOfBits(5))
      PC (.clock(s_logisimNet84),
          .clockEnable(s_logisimNet9),
          .d(s_logisimBus36[4:0]),
          .q(s_logisimBus4[4:0]),
          .reset(s_logisimNet48),
          .tick(1'b1));


endmodule
