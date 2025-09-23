/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : logisimTopLevelShell                                         **
 **                                                                          **
 *****************************************************************************/

module logisimTopLevelShell( clock_i_0,
                             ram_addr_o_0,
                             ram_addr_o_1,
                             ram_addr_o_2,
                             ram_addr_o_3,
                             ram_addr_o_4,
                             ram_data_i_0,
                             ram_data_i_1,
                             ram_data_i_10,
                             ram_data_i_11,
                             ram_data_i_12,
                             ram_data_i_13,
                             ram_data_i_14,
                             ram_data_i_15,
                             ram_data_i_16,
                             ram_data_i_17,
                             ram_data_i_18,
                             ram_data_i_19,
                             ram_data_i_2,
                             ram_data_i_20,
                             ram_data_i_21,
                             ram_data_i_22,
                             ram_data_i_23,
                             ram_data_i_24,
                             ram_data_i_25,
                             ram_data_i_26,
                             ram_data_i_27,
                             ram_data_i_28,
                             ram_data_i_29,
                             ram_data_i_3,
                             ram_data_i_30,
                             ram_data_i_31,
                             ram_data_i_4,
                             ram_data_i_5,
                             ram_data_i_6,
                             ram_data_i_7,
                             ram_data_i_8,
                             ram_data_i_9,
                             ram_data_o_0,
                             ram_data_o_1,
                             ram_data_o_10,
                             ram_data_o_11,
                             ram_data_o_12,
                             ram_data_o_13,
                             ram_data_o_14,
                             ram_data_o_15,
                             ram_data_o_16,
                             ram_data_o_17,
                             ram_data_o_18,
                             ram_data_o_19,
                             ram_data_o_2,
                             ram_data_o_20,
                             ram_data_o_21,
                             ram_data_o_22,
                             ram_data_o_23,
                             ram_data_o_24,
                             ram_data_o_25,
                             ram_data_o_26,
                             ram_data_o_27,
                             ram_data_o_28,
                             ram_data_o_29,
                             ram_data_o_3,
                             ram_data_o_30,
                             ram_data_o_31,
                             ram_data_o_4,
                             ram_data_o_5,
                             ram_data_o_6,
                             ram_data_o_7,
                             ram_data_o_8,
                             ram_data_o_9,
                             ram_rw_en_o_0,
                             reset_i_0,
                             stop_lamp_o_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input clock_i_0;
   input ram_data_i_0;
   input ram_data_i_1;
   input ram_data_i_10;
   input ram_data_i_11;
   input ram_data_i_12;
   input ram_data_i_13;
   input ram_data_i_14;
   input ram_data_i_15;
   input ram_data_i_16;
   input ram_data_i_17;
   input ram_data_i_18;
   input ram_data_i_19;
   input ram_data_i_2;
   input ram_data_i_20;
   input ram_data_i_21;
   input ram_data_i_22;
   input ram_data_i_23;
   input ram_data_i_24;
   input ram_data_i_25;
   input ram_data_i_26;
   input ram_data_i_27;
   input ram_data_i_28;
   input ram_data_i_29;
   input ram_data_i_3;
   input ram_data_i_30;
   input ram_data_i_31;
   input ram_data_i_4;
   input ram_data_i_5;
   input ram_data_i_6;
   input ram_data_i_7;
   input ram_data_i_8;
   input ram_data_i_9;
   input reset_i_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output ram_addr_o_0;
   output ram_addr_o_1;
   output ram_addr_o_2;
   output ram_addr_o_3;
   output ram_addr_o_4;
   output ram_data_o_0;
   output ram_data_o_1;
   output ram_data_o_10;
   output ram_data_o_11;
   output ram_data_o_12;
   output ram_data_o_13;
   output ram_data_o_14;
   output ram_data_o_15;
   output ram_data_o_16;
   output ram_data_o_17;
   output ram_data_o_18;
   output ram_data_o_19;
   output ram_data_o_2;
   output ram_data_o_20;
   output ram_data_o_21;
   output ram_data_o_22;
   output ram_data_o_23;
   output ram_data_o_24;
   output ram_data_o_25;
   output ram_data_o_26;
   output ram_data_o_27;
   output ram_data_o_28;
   output ram_data_o_29;
   output ram_data_o_3;
   output ram_data_o_30;
   output ram_data_o_31;
   output ram_data_o_4;
   output ram_data_o_5;
   output ram_data_o_6;
   output ram_data_o_7;
   output ram_data_o_8;
   output ram_data_o_9;
   output ram_rw_en_o_0;
   output stop_lamp_o_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire        s_clock_i;
   wire [4:0]  s_ram_addr_o;
   wire [31:0] s_ram_data_i;
   wire [31:0] s_ram_data_o;
   wire        s_ram_rw_en_o;
   wire        s_reset_i;
   wire        s_stop_lamp_o;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** All signal adaptations are performed here                                  **
   *******************************************************************************/
   assign ram_addr_o_0     = s_ram_addr_o[0];
   assign ram_addr_o_1     = s_ram_addr_o[1];
   assign ram_addr_o_2     = s_ram_addr_o[2];
   assign ram_addr_o_3     = s_ram_addr_o[3];
   assign ram_addr_o_4     = s_ram_addr_o[4];
   assign ram_data_o_0     = s_ram_data_o[0];
   assign ram_data_o_1     = s_ram_data_o[1];
   assign ram_data_o_10    = s_ram_data_o[10];
   assign ram_data_o_11    = s_ram_data_o[11];
   assign ram_data_o_12    = s_ram_data_o[12];
   assign ram_data_o_13    = s_ram_data_o[13];
   assign ram_data_o_14    = s_ram_data_o[14];
   assign ram_data_o_15    = s_ram_data_o[15];
   assign ram_data_o_16    = s_ram_data_o[16];
   assign ram_data_o_17    = s_ram_data_o[17];
   assign ram_data_o_18    = s_ram_data_o[18];
   assign ram_data_o_19    = s_ram_data_o[19];
   assign ram_data_o_2     = s_ram_data_o[2];
   assign ram_data_o_20    = s_ram_data_o[20];
   assign ram_data_o_21    = s_ram_data_o[21];
   assign ram_data_o_22    = s_ram_data_o[22];
   assign ram_data_o_23    = s_ram_data_o[23];
   assign ram_data_o_24    = s_ram_data_o[24];
   assign ram_data_o_25    = s_ram_data_o[25];
   assign ram_data_o_26    = s_ram_data_o[26];
   assign ram_data_o_27    = s_ram_data_o[27];
   assign ram_data_o_28    = s_ram_data_o[28];
   assign ram_data_o_29    = s_ram_data_o[29];
   assign ram_data_o_3     = s_ram_data_o[3];
   assign ram_data_o_30    = s_ram_data_o[30];
   assign ram_data_o_31    = s_ram_data_o[31];
   assign ram_data_o_4     = s_ram_data_o[4];
   assign ram_data_o_5     = s_ram_data_o[5];
   assign ram_data_o_6     = s_ram_data_o[6];
   assign ram_data_o_7     = s_ram_data_o[7];
   assign ram_data_o_8     = s_ram_data_o[8];
   assign ram_data_o_9     = s_ram_data_o[9];
   assign ram_rw_en_o_0    = s_ram_rw_en_o;
   assign s_clock_i        = clock_i_0;
   assign s_ram_data_i[0]  = ram_data_i_0;
   assign s_ram_data_i[10] = ram_data_i_10;
   assign s_ram_data_i[11] = ram_data_i_11;
   assign s_ram_data_i[12] = ram_data_i_12;
   assign s_ram_data_i[13] = ram_data_i_13;
   assign s_ram_data_i[14] = ram_data_i_14;
   assign s_ram_data_i[15] = ram_data_i_15;
   assign s_ram_data_i[16] = ram_data_i_16;
   assign s_ram_data_i[17] = ram_data_i_17;
   assign s_ram_data_i[18] = ram_data_i_18;
   assign s_ram_data_i[19] = ram_data_i_19;
   assign s_ram_data_i[1]  = ram_data_i_1;
   assign s_ram_data_i[20] = ram_data_i_20;
   assign s_ram_data_i[21] = ram_data_i_21;
   assign s_ram_data_i[22] = ram_data_i_22;
   assign s_ram_data_i[23] = ram_data_i_23;
   assign s_ram_data_i[24] = ram_data_i_24;
   assign s_ram_data_i[25] = ram_data_i_25;
   assign s_ram_data_i[26] = ram_data_i_26;
   assign s_ram_data_i[27] = ram_data_i_27;
   assign s_ram_data_i[28] = ram_data_i_28;
   assign s_ram_data_i[29] = ram_data_i_29;
   assign s_ram_data_i[2]  = ram_data_i_2;
   assign s_ram_data_i[30] = ram_data_i_30;
   assign s_ram_data_i[31] = ram_data_i_31;
   assign s_ram_data_i[3]  = ram_data_i_3;
   assign s_ram_data_i[4]  = ram_data_i_4;
   assign s_ram_data_i[5]  = ram_data_i_5;
   assign s_ram_data_i[6]  = ram_data_i_6;
   assign s_ram_data_i[7]  = ram_data_i_7;
   assign s_ram_data_i[8]  = ram_data_i_8;
   assign s_ram_data_i[9]  = ram_data_i_9;
   assign s_reset_i        = reset_i_0;
   assign stop_lamp_o_0    = s_stop_lamp_o;

   /*******************************************************************************
   ** The toplevel component is connected here                                   **
   *******************************************************************************/
   main   CIRCUIT_0 (.clock_i(s_clock_i),
                     .ram_addr_o(s_ram_addr_o),
                     .ram_data_i(s_ram_data_i),
                     .ram_data_o(s_ram_data_o),
                     .ram_rw_en_o(s_ram_rw_en_o),
                     .reset_i(s_reset_i),
                     .stop_lamp_o(s_stop_lamp_o));
endmodule
