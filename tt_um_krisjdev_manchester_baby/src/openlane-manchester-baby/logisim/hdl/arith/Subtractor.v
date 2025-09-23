/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : Subtractor                                                   **
 **                                                                          **
 *****************************************************************************/

module Subtractor( borrowIn,
                   borrowOut,
                   dataA,
                   dataB,
                   result );

   /*******************************************************************************
   ** Here all module parameters are defined with a dummy value                  **
   *******************************************************************************/
   parameter extendedBits = 1;
   parameter nrOfBits = 1;

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input                borrowIn;
   input [nrOfBits-1:0] dataA;
   input [nrOfBits-1:0] dataB;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output                borrowOut;
   output [nrOfBits-1:0] result;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire                    n_bIn;
   wire                    s_carry;
   wire [extendedBits-1:0] s_extendeddataA;
   wire [extendedBits-1:0] s_extendeddataB;
   wire [extendedBits-1:0] s_sumresult;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/
   assign n_bIn = ~borrowIn;
   assign {s_carry,result} = dataA + ~(dataB) + n_bIn;
   assign borrowOut        = ~s_carry;

endmodule
