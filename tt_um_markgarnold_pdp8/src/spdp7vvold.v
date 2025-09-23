//copyright 1997 Mark G. Arnold
//all rights reserved
//spdp1.v with link
`define CLK @(posedge sysclk)
`define ENS #1

module  pdp8_cpu(write,membus,contin,
                    ba,ma,mb,
                    halt,reset,sysclk);

  output write;
  input membus;
  input contin;
  input reset,sysclk;
  output [3:0] ba;
  output [6:0] ma;
  output mb;
  output halt;


  reg write;
  wire membus;
  wire contin;
  wire reset,sysclk;

  reg [12:0] lac;
  reg [6:0] ma;
  reg [11:0] pc,ir;
  reg mb;
  reg [3:0] ba;
  reg halt;
  reg c;

  reg contd1,contd2,contd3;
  reg cont;
  
  always @(contin) 
    contd1 = contin;

  always @(posedge sysclk)
    contd2 <= contd1;
    
  always @(contd1 or contd2)
    contd3 <= contd2&(~contd1);
 
  always @(posedge sysclk)
    cont <= contd3;

  function car;
    input a,b,c;
    begin
      car = a&b|a&c|b&c;
    end
  endfunction

  function sum;
    input a,b,c;
    begin
      sum = a+b+c;
    end
  endfunction

  function [11:0] ea;
    input [11:0] ir;
    begin
      ea = ir[6:0];
    end
  endfunction

  
  wire s_1,s_2,s_3,s_4,s_5,s_6,s_7,s_8,s_9,s_10,
        s_11,s_12,s_13,s_14,s_15,s_16,s_17,s_18,s_19,s_20,
        s_21,s_22,s_23,s_24,s_25,s_26,s_27,s_28,s_29,s_30,
        s_31,s_32,s_33,s_34,s_35,s_36,s_37,s_38,s_39,s_40,
        s_41,s_42,s_43,s_44,s_45,s_46,s_47,s_48,s_49,s_50,
        s_51,s_52,s_53,s_54,s_55,s_56,s_57,s_58,s_59,s_60,
        s_61,s_62,s_63,s_64,s_65,s_66,s_67,s_68,s_69,s_70,
        s_71,s_72,s_73,s_74,s_75,s_76,s_77,s_78,s_79,s_80,
        s_81,s_82,s_83,s_84,s_85,s_86,s_87,s_88,s_89,s_90,
        s_91,s_92,s_93,s_94,s_95,s_96,s_97,s_98,s_99,s_100,
        s_101,s_102,s_103,s_104,s_105,s_106,s_107,s_108,s_109,s_110,
        s_111,s_112,s_113,s_114,s_115,s_116,s_117,s_118,s_119,s_120,
        s_121,s_122,s_123,s_124,s_125,s_126,s_127,s_128,s_129,s_130,
        s_131,s_132,s_133,s_134,s_135,s_136,s_137,s_138,s_139,s_140,
        s_141,s_142,s_143,s_144,s_145,s_146;
  reg ff_999;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_999 <= 0;
    else
      ff_999 <= 1;
  wire s_999 = ~ff_999;
  assign s_1  = s_999|s_146;
  assign s_2  = s_1;
  wire tmp_3 = s_2;
  reg ff_3;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_3 <= 0;
    else
      ff_3 <= tmp_3;
  assign s_3 = ff_3;
  assign s_4  = s_3;
  assign s_5  = s_4;
  assign s_6  = s_5;
  assign s_7  = s_6|s_145;
  assign s_8  = s_7;
  wire tmp_9 = s_8;
  reg ff_9;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_9 <= 0;
    else
      ff_9 <= tmp_9;
  assign s_9 = ff_9;
  assign s_10  = s_9;
  assign s_11  = s_10;
  assign s_12  = s_11;
  wire tmp_13 = s_12;
  wire qual_13 = (halt);
  assign s_13 = tmp_13&(~qual_13);
  wire  sT_13 = tmp_13&qual_13;
  assign s_14  = sT_13;
  wire tmp_15 = s_14|s_21;
  wire qual_15 = (~cont);
  assign s_15 = tmp_15&(~qual_15);
  wire  sT_15 = tmp_15&qual_15;
  assign s_16  = sT_15;
  wire tmp_17 = s_16;
  reg ff_17;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_17 <= 0;
    else
      ff_17 <= tmp_17;
  assign s_17 = ff_17;
  assign s_18  = s_17;
  assign s_19  = s_18;
  assign s_20  = s_19;
  assign s_21  = s_20;
  assign s_22  = s_15;
  assign s_23  = s_13;
  assign s_24  = s_23;
  wire tmp_25 = s_24;
  reg ff_25;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_25 <= 0;
    else
      ff_25 <= tmp_25;
  assign s_25 = ff_25;
  wire tmp_26 = s_25|s_33;
  wire qual_26 = (ba!=11);
  assign s_26 = tmp_26&(~qual_26);
  wire  sT_26 = tmp_26&qual_26;
  assign s_27  = sT_26;
  wire tmp_28 = s_27;
  reg ff_28;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_28 <= 0;
    else
      ff_28 <= tmp_28;
  assign s_28 = ff_28;
  assign s_29  = s_28;
  assign s_30  = s_29;
  assign s_31  = s_30;
  assign s_32  = s_31;
  assign s_33  = s_32;
  wire tmp_34 = s_26;
  reg ff_34;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_34 <= 0;
    else
      ff_34 <= tmp_34;
  assign s_34 = ff_34;
  assign s_35  = s_34;
  assign s_36  = s_35;
  assign s_37  = s_36;
  assign s_38  = s_37;
  wire tmp_39 = s_38;
  wire qual_39 = (ir[11:9]==1);
  assign s_39 = tmp_39&(~qual_39);
  wire  sT_39 = tmp_39&qual_39;
  assign s_40  = sT_39;
  wire tmp_41 = s_40|s_47;
  wire qual_41 = (ba!=11);
  assign s_41 = tmp_41&(~qual_41);
  wire  sT_41 = tmp_41&qual_41;
  assign s_42  = sT_41;
  wire tmp_43 = s_42;
  reg ff_43;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_43 <= 0;
    else
      ff_43 <= tmp_43;
  assign s_43 = ff_43;
  assign s_44  = s_43;
  assign s_45  = s_44;
  assign s_46  = s_45;
  assign s_47  = s_46;
  wire tmp_48 = s_41;
  reg ff_48;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_48 <= 0;
    else
      ff_48 <= tmp_48;
  assign s_48 = ff_48;
  assign s_49  = s_48;
  assign s_50  = s_49;
  assign s_51  = s_39;
  assign s_52  = s_51;
  wire tmp_53 = s_52;
  wire qual_53 = (ir[11:9]==3);
  assign s_53 = tmp_53&(~qual_53);
  wire  sT_53 = tmp_53&qual_53;
  assign s_54  = sT_53;
  wire tmp_55 = s_54|s_65;
  wire qual_55 = (ba!=11);
  assign s_55 = tmp_55&(~qual_55);
  wire  sT_55 = tmp_55&qual_55;
  assign s_56  = sT_55;
  wire tmp_57 = s_56;
  reg ff_57;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_57 <= 0;
    else
      ff_57 <= tmp_57;
  assign s_57 = ff_57;
  assign s_58  = s_57;
  assign s_59  = s_58;
  wire tmp_60 = s_59;
  reg ff_60;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_60 <= 0;
    else
      ff_60 <= tmp_60;
  assign s_60 = ff_60;
  assign s_61  = s_60;
  wire tmp_62 = s_61;
  reg ff_62;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_62 <= 0;
    else
      ff_62 <= tmp_62;
  assign s_62 = ff_62;
  assign s_63  = s_62;
  assign s_64  = s_63;
  assign s_65  = s_64;
  assign s_66  = s_55;
  assign s_67  = s_53;
  assign s_68  = s_67;
  wire tmp_69 = s_68;
  wire qual_69 = (ir[11:9]==5);
  assign s_69 = tmp_69&(~qual_69);
  wire  sT_69 = tmp_69&qual_69;
  assign s_70  = sT_69;
  wire tmp_71 = s_70;
  reg ff_71;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_71 <= 0;
    else
      ff_71 <= tmp_71;
  assign s_71 = ff_71;
  assign s_72  = s_71;
  assign s_73  = s_72;
  assign s_74  = s_69;
  assign s_75  = s_74;
  wire tmp_76 = s_75;
  wire qual_76 = (ir[11:9]==7);
  assign s_76 = tmp_76&(~qual_76);
  wire  sT_76 = tmp_76&qual_76;
  assign s_77  = sT_76;
  wire tmp_78 = s_77;
  wire qual_78 = (ir[8]);
  assign s_78 = tmp_78&(~qual_78);
  wire  sT_78 = tmp_78&qual_78;
  assign s_79  = sT_78;
  wire tmp_80 = s_79;
  wire qual_80 = (ir[1]);
  assign s_80 = tmp_80&(~qual_80);
  wire  sT_80 = tmp_80&qual_80;
  assign s_81  = sT_80;
  wire tmp_82 = s_81;
  reg ff_82;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_82 <= 0;
    else
      ff_82 <= tmp_82;
  assign s_82 = ff_82;
  assign s_83  = s_82;
  assign s_84  = s_83|s_80;
  wire tmp_85 = s_84;
  wire qual_85 = (ir[3]^(ir[6]&lac[11]|ir[5]&(lac[11:0]==0)|ir[4]&lac[12]));
  assign s_85 = tmp_85&(~qual_85);
  wire  sT_85 = tmp_85&qual_85;
  assign s_86  = sT_85;
  wire tmp_87 = s_86|s_93;
  wire qual_87 = (ba!=11);
  assign s_87 = tmp_87&(~qual_87);
  wire  sT_87 = tmp_87&qual_87;
  assign s_88  = sT_87;
  wire tmp_89 = s_88;
  reg ff_89;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_89 <= 0;
    else
      ff_89 <= tmp_89;
  assign s_89 = ff_89;
  assign s_90  = s_89;
  assign s_91  = s_90;
  assign s_92  = s_91;
  assign s_93  = s_92;
  assign s_94  = s_87|s_85;
  assign s_95  = s_94;
  assign s_96  = s_78;
  assign s_97  = s_96;
  wire tmp_98 = s_97;
  wire qual_98 = (ir[7]);
  assign s_98 = tmp_98&(~qual_98);
  wire  sT_98 = tmp_98&qual_98;
  assign s_99  = sT_98;
  wire tmp_100 = s_99;
  reg ff_100;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_100 <= 0;
    else
      ff_100 <= tmp_100;
  assign s_100 = ff_100;
  assign s_101  = s_100;
  assign s_102  = s_101|s_98;
  wire tmp_103 = s_102;
  wire qual_103 = (ir[6]);
  assign s_103 = tmp_103&(~qual_103);
  wire  sT_103 = tmp_103&qual_103;
  assign s_104  = sT_103;
  wire tmp_105 = s_104;
  reg ff_105;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_105 <= 0;
    else
      ff_105 <= tmp_105;
  assign s_105 = ff_105;
  assign s_106  = s_105;
  assign s_107  = s_106|s_103;
  wire tmp_108 = s_107;
  wire qual_108 = (ir[5]);
  assign s_108 = tmp_108&(~qual_108);
  wire  sT_108 = tmp_108&qual_108;
  assign s_109  = sT_108;
  wire tmp_110 = s_109;
  reg ff_110;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_110 <= 0;
    else
      ff_110 <= tmp_110;
  assign s_110 = ff_110;
  assign s_111  = s_110;
  assign s_112  = s_111|s_108;
  wire tmp_113 = s_112;
  wire qual_113 = (ir[4]);
  assign s_113 = tmp_113&(~qual_113);
  wire  sT_113 = tmp_113&qual_113;
  assign s_114  = sT_113;
  wire tmp_115 = s_114;
  reg ff_115;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_115 <= 0;
    else
      ff_115 <= tmp_115;
  assign s_115 = ff_115;
  assign s_116  = s_115;
  assign s_117  = s_116|s_113;
  wire tmp_118 = s_117;
  wire qual_118 = (ir[0]);
  assign s_118 = tmp_118&(~qual_118);
  wire  sT_118 = tmp_118&qual_118;
  assign s_119  = sT_118;
  wire tmp_120 = s_119|s_126;
  wire qual_120 = (ba!=11);
  assign s_120 = tmp_120&(~qual_120);
  wire  sT_120 = tmp_120&qual_120;
  assign s_121  = sT_120;
  wire tmp_122 = s_121;
  reg ff_122;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_122 <= 0;
    else
      ff_122 <= tmp_122;
  assign s_122 = ff_122;
  assign s_123  = s_122;
  assign s_124  = s_123;
  assign s_125  = s_124;
  assign s_126  = s_125;
  wire tmp_127 = s_120;
  reg ff_127;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_127 <= 0;
    else
      ff_127 <= tmp_127;
  assign s_127 = ff_127;
  assign s_128  = s_127;
  assign s_129  = s_128|s_118;
  wire tmp_130 = s_129;
  reg ff_130;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_130 <= 0;
    else
      ff_130 <= tmp_130;
  assign s_130 = ff_130;
  wire tmp_131 = s_130;
  wire qual_131 = (ir[2]);
  assign s_131 = tmp_131&(~qual_131);
  wire  sT_131 = tmp_131&qual_131;
  assign s_132  = sT_131;
  assign s_133  = s_132;
  assign s_134  = s_133|s_131;
  wire tmp_135 = s_134;
  wire qual_135 = (ir[3]);
  assign s_135 = tmp_135&(~qual_135);
  wire  sT_135 = tmp_135&qual_135;
  assign s_136  = sT_135;
  assign s_137  = s_136;
  assign s_138  = s_137|s_135;
  assign s_139  = s_138|s_95;
  assign s_140  = s_139|s_76;
  assign s_141  = s_140|s_73;
  assign s_142  = s_141|s_66;
  assign s_143  = s_142|s_50;
  assign s_144  = s_143|s_22;
  assign s_145  = s_144;
  assign s_146  = 1'b0;

  always @(posedge sysclk)
   begin
     if(s_11|s_32|s_36|s_46|s_63|s_92|s_125)
        ba <= 
             s_11 ?  0  :
             s_32 ?  ba+1  :
             s_36 ?  0  :
             s_46 ?  ba+1  :
             s_63 ?  ba+1  :
             s_92 ?  ba+1  :
             ba+1 ;
     if(s_12|s_31|s_91|s_38|s_124|s_45)
        c <= 
             s_12 ?  1  :
             s_31 ?  car(pc[0],0,c)  :
             s_91 ?  car(pc[0],0,c)  :
             s_38 ?  ir[10]  :
             s_124 ?  car(lac[0],0,c)  :
             car(lac[0],membus,c) ;
     if(s_4|s_83|s_18)
        halt <= 
             s_4 ?  1  :
             s_83 ?  1  :
             0 ;
     if(s_29)
        ir <= 
             {membus,ir[11:1]} ;
     if(s_44|s_101|s_106|s_111|s_116|s_123|s_49|s_58|s_128|s_133|s_137)
        lac <= 
             s_44 ?  {sum(lac[0],membus,c),lac[12:1]}  :
             s_101 ?  {lac[12],12'b0}  :
             s_106 ?  {1'b0,lac[11:0]}  :
             s_111 ?  {lac[12],~lac[11:0]}  :
             s_116 ?  {~lac[12],lac[11:0]}  :
             s_123 ?  {sum(lac[0],0,c),lac[12:1]}  :
             s_49 ?  {sum(lac[0],0,c),lac[12:1]}  :
             s_58 ?  {lac[12],1'b0,lac[11:1]}  :
             s_128 ?  {sum(lac[0],0,c),lac[12:1]}  :
             s_133 ?  {lac[11:0],lac[12]}  :
             {lac[0],lac[12:1]} ;
     if(s_19|s_10|s_35)
        ma <= 
             s_19 ?  pc  :
             s_10 ?  pc  :
             ea(ir) ;
     if(s_20|s_64|s_37)
        mb <= 
             s_20 ?  0  :
             s_64 ?  lac[0]  :
             lac[0] ;
     if(s_6|s_72|s_30|s_90)
        pc <= 
             s_6 ?  12'o0100  :
             s_72 ?  ma  :
             s_30 ?  {sum(pc[0],0,c),pc[11:1]}  :
             {sum(pc[0],0,c),pc[11:1]} ;
     if(s_61|s_5|s_59)
        write <= 
             s_61 ?  1  :
             s_5 ?  1  :
             0 ;
   end

endmodule
//
//  Comefrom Table for module number 1:
//
//   1: 999 146 always
//   2:   1   0 begin
//   3:   2   0 @(posedge sysclk) #1 ;
//   4:   3   0 halt<=@(posedge sysclk) 1;
//   5:   4   0 write<=@(posedge sysclk) 1;
//   6:   5   0 pc<=@(posedge sysclk) 12'o0100;
//   7:   6 145 forever
//   8:   7   0 begin
//   9:   8   0 @(posedge sysclk) #1 ;
//  10:   9   0 ma<=@(posedge sysclk) pc;
//  11:  10   0 ba<=@(posedge sysclk) 0;
//  12:  11   0 c<=@(posedge sysclk) 1;
//  13:  12   0 if(halt)
//  14: -13   0 begin
//  15:  14  21 while(~cont)
//  16: -15   0 begin
//  17:  16   0 @(posedge sysclk) #1 ;
//  18:  17   0 halt<=@(posedge sysclk) 0;
//  19:  18   0 ma<=@(posedge sysclk) pc;
//  20:  19   0 mb<=@(posedge sysclk) 0;
//  21:  20   0 end
//  22:  15   0 end
//  23:  13   0 else
//  24:  23   0 begin
//  25:  24   0 @(posedge sysclk) #1 ;
//  26:  25  33 while(ba!=11)
//  27: -26   0 begin
//  28:  27   0 @(posedge sysclk) #1 ;
//  29:  28   0 ir<=@(posedge sysclk) {membus,ir[11:1]};
//  30:  29   0 pc<=@(posedge sysclk) {sum(pc[0],0,c),pc[11:1]};
//  31:  30   0 c<=@(posedge sysclk) car(pc[0],0,c);
//  32:  31   0 ba<=@(posedge sysclk) ba+1;
//  33:  32   0 end
//  34:  26   0 @(posedge sysclk) #1 ;
//  35:  34   0 ma<=@(posedge sysclk) ea(ir);
//  36:  35   0 ba<=@(posedge sysclk) 0;
//  37:  36   0 mb<=@(posedge sysclk) lac[0];
//  38:  37   0 c<=@(posedge sysclk) ir[10];
//  39:  38   0 if(ir[11:9]==1)
//  40: -39   0 begin
//  41:  40  47 while(ba!=11)
//  42: -41   0 begin
//  43:  42   0 @(posedge sysclk) #1 ;
//  44:  43   0 lac<=@(posedge sysclk) {sum(lac[0],membus,c),lac[12:1]};
//  45:  44   0 c<=@(posedge sysclk) car(lac[0],membus,c);
//  46:  45   0 ba<=@(posedge sysclk) ba+1;
//  47:  46   0 end
//  48:  41   0 @(posedge sysclk) #1 ;
//  49:  48   0 lac<=@(posedge sysclk) {sum(lac[0],0,c),lac[12:1]};
//  50:  49   0 end
//  51:  39   0 else
//  52:  51   0 begin
//  53:  52   0 if(ir[11:9]==3)
//  54: -53   0 begin
//  55:  54  65 while(ba!=11)
//  56: -55   0 begin
//  57:  56   0 @(posedge sysclk) #1 ;
//  58:  57   0 lac<=@(posedge sysclk) {lac[12],1'b0,lac[11:1]};
//  59:  58   0 write<=@(posedge sysclk) 0;
//  60:  59   0 @(posedge sysclk) #1 ;
//  61:  60   0 write<=@(posedge sysclk) 1;
//  62:  61   0 @(posedge sysclk) #1 ;
//  63:  62   0 ba<=@(posedge sysclk) ba+1;
//  64:  63   0 mb<=@(posedge sysclk) lac[0];
//  65:  64   0 end
//  66:  55   0 end
//  67:  53   0 else
//  68:  67   0 begin
//  69:  68   0 if(ir[11:9]==5)
//  70: -69   0 begin
//  71:  70   0 @(posedge sysclk) #1 ;
//  72:  71   0 pc<=@(posedge sysclk) ma;
//  73:  72   0 end
//  74:  69   0 else
//  75:  74   0 begin
//  76:  75   0 if(ir[11:9]==7)
//  77: -76   0 begin
//  78:  77   0 if(ir[8])
//  79: -78   0 begin
//  80:  79   0 if(ir[1])
//  81: -80   0 begin
//  82:  81   0 @(posedge sysclk) #1 ;
//  83:  82   0 halt<=@(posedge sysclk) 1;
//  84:  83  80 end
//  85:  84   0 if(ir[3]^(ir[6]&lac[11]|ir[5]&(lac[11:0]==0)|ir[4]&lac[12]))
//  86: -85   0 begin
//  87:  86  93 while(ba!=11)
//  88: -87   0 begin
//  89:  88   0 @(posedge sysclk) #1 ;
//  90:  89   0 pc<=@(posedge sysclk) {sum(pc[0],0,c),pc[11:1]};
//  91:  90   0 c<=@(posedge sysclk) car(pc[0],0,c);
//  92:  91   0 ba<=@(posedge sysclk) ba+1;
//  93:  92   0 end
//  94:  87  85 end
//  95:  94   0 end
//  96:  78   0 else
//  97:  96   0 begin
//  98:  97   0 if(ir[7])
//  99: -98   0 begin
// 100:  99   0 @(posedge sysclk) #1 ;
// 101: 100   0 lac<=@(posedge sysclk) {lac[12],12'b0};
// 102: 101  98 end
// 103: 102   0 if(ir[6])
// 104: -103   0 begin
// 105: 104   0 @(posedge sysclk) #1 ;
// 106: 105   0 lac<=@(posedge sysclk) {1'b0,lac[11:0]};
// 107: 106 103 end
// 108: 107   0 if(ir[5])
// 109: -108   0 begin
// 110: 109   0 @(posedge sysclk) #1 ;
// 111: 110   0 lac<=@(posedge sysclk) {lac[12],~lac[11:0]};
// 112: 111 108 end
// 113: 112   0 if(ir[4])
// 114: -113   0 begin
// 115: 114   0 @(posedge sysclk) #1 ;
// 116: 115   0 lac<=@(posedge sysclk) {~lac[12],lac[11:0]};
// 117: 116 113 end
// 118: 117   0 if(ir[0])
// 119: -118   0 begin
// 120: 119 126 while(ba!=11)
// 121: -120   0 begin
// 122: 121   0 @(posedge sysclk) #1 ;
// 123: 122   0 lac<=@(posedge sysclk) {sum(lac[0],0,c),lac[12:1]};
// 124: 123   0 c<=@(posedge sysclk) car(lac[0],0,c);
// 125: 124   0 ba<=@(posedge sysclk) ba+1;
// 126: 125   0 end
// 127: 120   0 @(posedge sysclk) #1 ;
// 128: 127   0 lac<=@(posedge sysclk) {sum(lac[0],0,c),lac[12:1]};
// 129: 128 118 end
// 130: 129   0 @(posedge sysclk) #1 ;
// 131: 130   0 if(ir[2])
// 132: -131   0 begin
// 133: 132   0 lac<=@(posedge sysclk) {lac[11:0],lac[12]};
// 134: 133 131 end
// 135: 134   0 if(ir[3])
// 136: -135   0 begin
// 137: 136   0 lac<=@(posedge sysclk) {lac[0],lac[12:1]};
// 138: 137 135 end
// 139: 138  95 end
// 140: 139  76 end
// 141: 140  73 end
// 142: 141  66 end
// 143: 142  50 end
// 144: 143  22 end
// 145: 144   0 end
// 146:   0   0 end
