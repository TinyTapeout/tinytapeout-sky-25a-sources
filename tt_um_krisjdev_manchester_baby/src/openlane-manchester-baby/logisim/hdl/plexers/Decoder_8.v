/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : Decoder_8                                                    **
 **                                                                          **
 *****************************************************************************/

module Decoder_8( decoderOut_0,
                  decoderOut_1,
                  decoderOut_2,
                  decoderOut_3,
                  decoderOut_4,
                  decoderOut_5,
                  decoderOut_6,
                  decoderOut_7,
                  enable,
                  sel );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       enable;
   input [2:0] sel;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output decoderOut_0;
   output decoderOut_1;
   output decoderOut_2;
   output decoderOut_3;
   output decoderOut_4;
   output decoderOut_5;
   output decoderOut_6;
   output decoderOut_7;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/
   assign decoderOut_0  = (enable&(sel == 3'b000)) ? 1'b1 : 1'b0;
   assign decoderOut_1  = (enable&(sel == 3'b001)) ? 1'b1 : 1'b0;
   assign decoderOut_2  = (enable&(sel == 3'b010)) ? 1'b1 : 1'b0;
   assign decoderOut_3  = (enable&(sel == 3'b011)) ? 1'b1 : 1'b0;
   assign decoderOut_4  = (enable&(sel == 3'b100)) ? 1'b1 : 1'b0;
   assign decoderOut_5  = (enable&(sel == 3'b101)) ? 1'b1 : 1'b0;
   assign decoderOut_6  = (enable&(sel == 3'b110)) ? 1'b1 : 1'b0;
   assign decoderOut_7  = (enable&(sel == 3'b111)) ? 1'b1 : 1'b0;
endmodule
