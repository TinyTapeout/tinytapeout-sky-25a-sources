/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : LogisimCounter                                               **
 **                                                                          **
 *****************************************************************************/

module LogisimCounter( clear,
                       clock,
                       compareOut,
                       countValue,
                       enable,
                       load,
                       loadData,
                       tick,
                       upNotDown );

   /*******************************************************************************
   ** Here all module parameters are defined with a dummy value                  **
   *******************************************************************************/
   parameter [64:0] maxVal = 1;
   parameter invertClock = 1;
   parameter mode = 1;
   parameter width = 1;

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input             clear;
   input             clock;
   input             enable;
   input             load;
   input [width-1:0] loadData;
   input             tick;
   input             upNotDown;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output             compareOut;
   output [width-1:0] countValue;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_clock;
   wire s_realEnable;

   /*******************************************************************************
   ** The registers are defined here                                             **
   *******************************************************************************/
   reg             s_carry;
   reg [width-1:0] s_counterValue;
   reg [width-1:0] s_nextCounterValue;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Functionality of the counter:                                              **
   **   Load Count | mode                                                        **
   **                                                                            **
   ** -----------+-------------------                                            **
   **     0    0   | halt                                                        **
   **     0    1   | count                                                       **
   ** up (default)                                                               **
   **     1    0   | load                                                        **
   **     1    1   | count down                                                  **
   *******************************************************************************/

   assign compareOut = s_carry;
   assign countValue = s_counterValue;
   assign s_clock = (invertClock == 0) ? clock : ~clock;

   always@(*)
   begin
   if (upNotDown)
      s_carry = (s_counterValue == maxVal) ? 1'b1 : 1'b0;
   else
      s_carry = (s_counterValue == 0) ? 1'b1 : 1'b0;
   end

   assign s_realEnable = ((~(load)&~(enable))|
                           ((mode==1)&s_carry&~(load))) ? 1'b0 : tick;

   always @(*)
   begin
      if ((load)|((mode==3)&s_carry))
         s_nextCounterValue = loadData;
      else if ((mode==0)&s_carry&upNotDown)
         s_nextCounterValue = 0;
      else if ((mode==0)&s_carry)
         s_nextCounterValue = maxVal;
      else if (upNotDown)
         s_nextCounterValue = s_counterValue + 1;
      else
         s_nextCounterValue = s_counterValue - 1;
   end

   always @(posedge s_clock or posedge clear)
   begin
      if (clear) s_counterValue <= 0;
      else if (s_realEnable) s_counterValue <= s_nextCounterValue;
   end

endmodule
