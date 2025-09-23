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
  reg z;

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
        s_141,s_142,s_143,s_144,s_145,s_146,s_147,s_148,s_149,s_150,
        s_151,s_152,s_153,s_154,s_155,s_156,s_157,s_158,s_159,s_160,
        s_161,s_162,s_163,s_164,s_165,s_166,s_167,s_168,s_169,s_170,
        s_171,s_172,s_173,s_174,s_175,s_176,s_177,s_178,s_179,s_180,
        s_181,s_182,s_183,s_184,s_185,s_186,s_187,s_188,s_189,s_190,
        s_191,s_192,s_193,s_194;
  reg ff_999;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_999 <= 0;
    else
      ff_999 <= 1;
  wire s_999 = ~ff_999;
  assign s_1  = s_999|s_194;
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
  assign s_7  = s_6|s_193;
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
  wire tmp_26 = s_25|s_34;
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
  wire tmp_29 = s_28;
  reg ff_29;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_29 <= 0;
    else
      ff_29 <= tmp_29;
  assign s_29 = ff_29;
  assign s_30  = s_29;
  assign s_31  = s_30;
  assign s_32  = s_31;
  assign s_33  = s_32;
  assign s_34  = s_33;
  wire tmp_35 = s_26;
  reg ff_35;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_35 <= 0;
    else
      ff_35 <= tmp_35;
  assign s_35 = ff_35;
  assign s_36  = s_35;
  assign s_37  = s_36;
  assign s_38  = s_37;
  assign s_39  = s_38;
  assign s_40  = s_39;
  wire tmp_41 = s_40;
  wire qual_41 = (ir[11:9]==1);
  assign s_41 = tmp_41&(~qual_41);
  wire  sT_41 = tmp_41&qual_41;
  assign s_42  = sT_41;
  wire tmp_43 = s_42|s_50;
  wire qual_43 = (ba!=11);
  assign s_43 = tmp_43&(~qual_43);
  wire  sT_43 = tmp_43&qual_43;
  assign s_44  = sT_43;
  wire tmp_45 = s_44;
  reg ff_45;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_45 <= 0;
    else
      ff_45 <= tmp_45;
  assign s_45 = ff_45;
  wire tmp_46 = s_45;
  reg ff_46;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_46 <= 0;
    else
      ff_46 <= tmp_46;
  assign s_46 = ff_46;
  assign s_47  = s_46;
  assign s_48  = s_47;
  assign s_49  = s_48;
  assign s_50  = s_49;
  wire tmp_51 = s_43;
  reg ff_51;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_51 <= 0;
    else
      ff_51 <= tmp_51;
  assign s_51 = ff_51;
  assign s_52  = s_51;
  assign s_53  = s_52;
  assign s_54  = s_41;
  assign s_55  = s_54;
  wire tmp_56 = s_55;
  wire qual_56 = (ir[11:9]==0);
  assign s_56 = tmp_56&(~qual_56);
  wire  sT_56 = tmp_56&qual_56;
  assign s_57  = sT_56;
  wire tmp_58 = s_57|s_64;
  wire qual_58 = (ba!=11);
  assign s_58 = tmp_58&(~qual_58);
  wire  sT_58 = tmp_58&qual_58;
  assign s_59  = sT_58;
  wire tmp_60 = s_59;
  reg ff_60;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_60 <= 0;
    else
      ff_60 <= tmp_60;
  assign s_60 = ff_60;
  wire tmp_61 = s_60;
  reg ff_61;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_61 <= 0;
    else
      ff_61 <= tmp_61;
  assign s_61 = ff_61;
  assign s_62  = s_61;
  assign s_63  = s_62;
  assign s_64  = s_63;
  assign s_65  = s_58;
  assign s_66  = s_56;
  assign s_67  = s_66;
  wire tmp_68 = s_67;
  wire qual_68 = (ir[11:9]==2);
  assign s_68 = tmp_68&(~qual_68);
  wire  sT_68 = tmp_68&qual_68;
  assign s_69  = sT_68;
  wire tmp_70 = s_69|s_83;
  wire qual_70 = (ba!=11);
  assign s_70 = tmp_70&(~qual_70);
  wire  sT_70 = tmp_70&qual_70;
  assign s_71  = sT_70;
  wire tmp_72 = s_71;
  reg ff_72;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_72 <= 0;
    else
      ff_72 <= tmp_72;
  assign s_72 = ff_72;
  wire tmp_73 = s_72;
  reg ff_73;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_73 <= 0;
    else
      ff_73 <= tmp_73;
  assign s_73 = ff_73;
  assign s_74  = s_73;
  assign s_75  = s_74;
  wire tmp_76 = s_75;
  reg ff_76;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_76 <= 0;
    else
      ff_76 <= tmp_76;
  assign s_76 = ff_76;
  assign s_77  = s_76;
  assign s_78  = s_77;
  wire tmp_79 = s_78;
  reg ff_79;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_79 <= 0;
    else
      ff_79 <= tmp_79;
  assign s_79 = ff_79;
  assign s_80  = s_79;
  wire tmp_81 = s_80;
  reg ff_81;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_81 <= 0;
    else
      ff_81 <= tmp_81;
  assign s_81 = ff_81;
  assign s_82  = s_81;
  assign s_83  = s_82;
  wire tmp_84 = s_70;
  reg ff_84;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_84 <= 0;
    else
      ff_84 <= tmp_84;
  assign s_84 = ff_84;
  assign s_85  = s_84;
  wire tmp_86 = s_85;
  wire qual_86 = (z);
  assign s_86 = tmp_86&(~qual_86);
  wire  sT_86 = tmp_86&qual_86;
  assign s_87  = sT_86;
  wire tmp_88 = s_87|s_94;
  wire qual_88 = (ba!=11);
  assign s_88 = tmp_88&(~qual_88);
  wire  sT_88 = tmp_88&qual_88;
  assign s_89  = sT_88;
  wire tmp_90 = s_89;
  reg ff_90;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_90 <= 0;
    else
      ff_90 <= tmp_90;
  assign s_90 = ff_90;
  assign s_91  = s_90;
  assign s_92  = s_91;
  assign s_93  = s_92;
  assign s_94  = s_93;
  assign s_95  = s_88|s_86;
  assign s_96  = s_95;
  assign s_97  = s_68;
  assign s_98  = s_97;
  wire tmp_99 = s_98;
  wire qual_99 = (ir[11:9]==3);
  assign s_99 = tmp_99&(~qual_99);
  wire  sT_99 = tmp_99&qual_99;
  assign s_100  = sT_99;
  wire tmp_101 = s_100|s_111;
  wire qual_101 = (ba!=11);
  assign s_101 = tmp_101&(~qual_101);
  wire  sT_101 = tmp_101&qual_101;
  assign s_102  = sT_101;
  wire tmp_103 = s_102;
  reg ff_103;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_103 <= 0;
    else
      ff_103 <= tmp_103;
  assign s_103 = ff_103;
  assign s_104  = s_103;
  assign s_105  = s_104;
  wire tmp_106 = s_105;
  reg ff_106;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_106 <= 0;
    else
      ff_106 <= tmp_106;
  assign s_106 = ff_106;
  assign s_107  = s_106;
  wire tmp_108 = s_107;
  reg ff_108;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_108 <= 0;
    else
      ff_108 <= tmp_108;
  assign s_108 = ff_108;
  assign s_109  = s_108;
  assign s_110  = s_109;
  assign s_111  = s_110;
  assign s_112  = s_101;
  assign s_113  = s_99;
  assign s_114  = s_113;
  wire tmp_115 = s_114;
  wire qual_115 = (ir[11:9]==5);
  assign s_115 = tmp_115&(~qual_115);
  wire  sT_115 = tmp_115&qual_115;
  assign s_116  = sT_115;
  wire tmp_117 = s_116;
  reg ff_117;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_117 <= 0;
    else
      ff_117 <= tmp_117;
  assign s_117 = ff_117;
  assign s_118  = s_117;
  assign s_119  = s_118;
  assign s_120  = s_115;
  assign s_121  = s_120;
  wire tmp_122 = s_121;
  wire qual_122 = (ir[11:9]==7);
  assign s_122 = tmp_122&(~qual_122);
  wire  sT_122 = tmp_122&qual_122;
  assign s_123  = sT_122;
  wire tmp_124 = s_123;
  wire qual_124 = (ir[8]);
  assign s_124 = tmp_124&(~qual_124);
  wire  sT_124 = tmp_124&qual_124;
  assign s_125  = sT_124;
  wire tmp_126 = s_125;
  wire qual_126 = (ir[1]);
  assign s_126 = tmp_126&(~qual_126);
  wire  sT_126 = tmp_126&qual_126;
  assign s_127  = sT_126;
  wire tmp_128 = s_127;
  reg ff_128;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_128 <= 0;
    else
      ff_128 <= tmp_128;
  assign s_128 = ff_128;
  assign s_129  = s_128;
  assign s_130  = s_129|s_126;
  wire tmp_131 = s_130;
  wire qual_131 = (ir[3]^(ir[6]&lac[11]|ir[5]&(lac[11:0]==0)|ir[4]&lac[12]));
  assign s_131 = tmp_131&(~qual_131);
  wire  sT_131 = tmp_131&qual_131;
  assign s_132  = sT_131;
  wire tmp_133 = s_132|s_139;
  wire qual_133 = (ba!=11);
  assign s_133 = tmp_133&(~qual_133);
  wire  sT_133 = tmp_133&qual_133;
  assign s_134  = sT_133;
  wire tmp_135 = s_134;
  reg ff_135;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_135 <= 0;
    else
      ff_135 <= tmp_135;
  assign s_135 = ff_135;
  assign s_136  = s_135;
  assign s_137  = s_136;
  assign s_138  = s_137;
  assign s_139  = s_138;
  assign s_140  = s_133|s_131;
  assign s_141  = s_140;
  assign s_142  = s_124;
  assign s_143  = s_142;
  wire tmp_144 = s_143;
  wire qual_144 = (ir[7]);
  assign s_144 = tmp_144&(~qual_144);
  wire  sT_144 = tmp_144&qual_144;
  assign s_145  = sT_144;
  wire tmp_146 = s_145;
  reg ff_146;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_146 <= 0;
    else
      ff_146 <= tmp_146;
  assign s_146 = ff_146;
  assign s_147  = s_146;
  assign s_148  = s_147|s_144;
  wire tmp_149 = s_148;
  wire qual_149 = (ir[6]);
  assign s_149 = tmp_149&(~qual_149);
  wire  sT_149 = tmp_149&qual_149;
  assign s_150  = sT_149;
  wire tmp_151 = s_150;
  reg ff_151;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_151 <= 0;
    else
      ff_151 <= tmp_151;
  assign s_151 = ff_151;
  assign s_152  = s_151;
  assign s_153  = s_152|s_149;
  wire tmp_154 = s_153;
  wire qual_154 = (ir[5]);
  assign s_154 = tmp_154&(~qual_154);
  wire  sT_154 = tmp_154&qual_154;
  assign s_155  = sT_154;
  wire tmp_156 = s_155;
  reg ff_156;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_156 <= 0;
    else
      ff_156 <= tmp_156;
  assign s_156 = ff_156;
  assign s_157  = s_156;
  assign s_158  = s_157|s_154;
  wire tmp_159 = s_158;
  wire qual_159 = (ir[4]);
  assign s_159 = tmp_159&(~qual_159);
  wire  sT_159 = tmp_159&qual_159;
  assign s_160  = sT_159;
  wire tmp_161 = s_160;
  reg ff_161;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_161 <= 0;
    else
      ff_161 <= tmp_161;
  assign s_161 = ff_161;
  assign s_162  = s_161;
  assign s_163  = s_162|s_159;
  wire tmp_164 = s_163;
  wire qual_164 = (ir[0]);
  assign s_164 = tmp_164&(~qual_164);
  wire  sT_164 = tmp_164&qual_164;
  assign s_165  = sT_164;
  wire tmp_166 = s_165|s_172;
  wire qual_166 = (ba!=11);
  assign s_166 = tmp_166&(~qual_166);
  wire  sT_166 = tmp_166&qual_166;
  assign s_167  = sT_166;
  wire tmp_168 = s_167;
  reg ff_168;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_168 <= 0;
    else
      ff_168 <= tmp_168;
  assign s_168 = ff_168;
  assign s_169  = s_168;
  assign s_170  = s_169;
  assign s_171  = s_170;
  assign s_172  = s_171;
  wire tmp_173 = s_166;
  reg ff_173;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_173 <= 0;
    else
      ff_173 <= tmp_173;
  assign s_173 = ff_173;
  assign s_174  = s_173;
  assign s_175  = s_174|s_164;
  wire tmp_176 = s_175;
  reg ff_176;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_176 <= 0;
    else
      ff_176 <= tmp_176;
  assign s_176 = ff_176;
  wire tmp_177 = s_176;
  wire qual_177 = (ir[2]);
  assign s_177 = tmp_177&(~qual_177);
  wire  sT_177 = tmp_177&qual_177;
  assign s_178  = sT_177;
  assign s_179  = s_178;
  assign s_180  = s_179|s_177;
  wire tmp_181 = s_180;
  wire qual_181 = (ir[3]);
  assign s_181 = tmp_181&(~qual_181);
  wire  sT_181 = tmp_181&qual_181;
  assign s_182  = sT_181;
  assign s_183  = s_182;
  assign s_184  = s_183|s_181;
  assign s_185  = s_184|s_141;
  assign s_186  = s_185|s_122;
  assign s_187  = s_186|s_119;
  assign s_188  = s_187|s_112;
  assign s_189  = s_188|s_96;
  assign s_190  = s_189|s_65;
  assign s_191  = s_190|s_53;
  assign s_192  = s_191|s_22;
  assign s_193  = s_192;
  assign s_194  = 1'b0;

  always @(posedge sysclk)
   begin
     if(s_11|s_33|s_37|s_49|s_63|s_82|s_85|s_93|s_109|s_138|s_171)
        ba <= 
             s_11 ?  0  :
             s_33 ?  ba+1  :
             s_37 ?  0  :
             s_49 ?  ba+1  :
             s_63 ?  ba+1  :
             s_82 ?  ba+1  :
             s_85 ?  0  :
             s_93 ?  ba+1  :
             s_109 ?  ba+1  :
             s_138 ?  ba+1  :
             ba+1 ;
     if(s_48|s_92|s_12|s_32|s_137|s_75|s_170|s_39)
        c <= 
             s_48 ?  car(lac[0],membus,c)  :
             s_92 ?  car(pc[0],0,c)  :
             s_12 ?  1  :
             s_32 ?  car(pc[0],0,c)  :
             s_137 ?  car(pc[0],0,c)  :
             s_75 ?  car(membus,0,c)  :
             s_170 ?  car(lac[0],0,c)  :
             ir[10] ;
     if(s_4|s_129|s_18)
        halt <= 
             s_4 ?  1  :
             s_129 ?  1  :
             0 ;
     if(s_30)
        ir <= 
             {membus,ir[11:1]} ;
     if(s_62|s_104|s_147|s_152|s_157|s_162|s_169|s_47|s_52|s_174|s_179|s_183)
        lac <= 
             s_62 ?  {lac[12],lac[0]&membus,lac[11:1]}  :
             s_104 ?  {lac[12],1'b0,lac[11:1]}  :
             s_147 ?  {lac[12],12'b0}  :
             s_152 ?  {1'b0,lac[11:0]}  :
             s_157 ?  {lac[12],~lac[11:0]}  :
             s_162 ?  {~lac[12],lac[11:0]}  :
             s_169 ?  {sum(lac[0],0,c),lac[12:1]}  :
             s_47 ?  {sum(lac[0],membus,c),lac[12:1]}  :
             s_52 ?  {sum(lac[0],0,c),lac[12:1]}  :
             s_174 ?  {sum(lac[0],0,c),lac[12:1]}  :
             s_179 ?  {lac[11:0],lac[12]}  :
             {lac[0],lac[12:1]} ;
     if(s_10|s_36|s_19)
        ma <= 
             s_10 ?  pc  :
             s_36 ?  ea(ir)  :
             pc ;
     if(s_74|s_38|s_110|s_20)
        mb <= 
             s_74 ?  sum(membus,0,c)  :
             s_38 ?  lac[0]  :
             s_110 ?  lac[0]  :
             0 ;
     if(s_118|s_91|s_136|s_6|s_31)
        pc <= 
             s_118 ?  ma  :
             s_91 ?  {sum(pc[0],0,c),pc[11:1]}  :
             s_136 ?  {sum(pc[0],0,c),pc[11:1]}  :
             s_6 ?  12'o0100  :
             {sum(pc[0],0,c),pc[11:1]} ;
     if(s_80|s_105|s_107|s_5|s_78)
        write <= 
             s_80 ?  1  :
             s_105 ?  0  :
             s_107 ?  1  :
             s_5 ?  1  :
             0 ;
     if(s_77|s_40)
        z <= 
             s_77 ?  z&(mb==0)  :
             1 ;
   end

endmodule
//
//  Comefrom Table for module number 1:
//
//   1: 999 194 always
//   2:   1   0 begin
//   3:   2   0 @(posedge sysclk) #1 ;
//   4:   3   0 halt<=@(posedge sysclk) 1;
//   5:   4   0 write<=@(posedge sysclk) 1;
//   6:   5   0 pc<=@(posedge sysclk) 12'o0100;
//   7:   6 193 forever
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
//  26:  25  34 while(ba!=11)
//  27: -26   0 begin
//  28:  27   0 @(posedge sysclk) #1 ;
//  29:  28   0 @(posedge sysclk) #1 ;
//  30:  29   0 ir<=@(posedge sysclk) {membus,ir[11:1]};
//  31:  30   0 pc<=@(posedge sysclk) {sum(pc[0],0,c),pc[11:1]};
//  32:  31   0 c<=@(posedge sysclk) car(pc[0],0,c);
//  33:  32   0 ba<=@(posedge sysclk) ba+1;
//  34:  33   0 end
//  35:  26   0 @(posedge sysclk) #1 ;
//  36:  35   0 ma<=@(posedge sysclk) ea(ir);
//  37:  36   0 ba<=@(posedge sysclk) 0;
//  38:  37   0 mb<=@(posedge sysclk) lac[0];
//  39:  38   0 c<=@(posedge sysclk) ir[10];
//  40:  39   0 z<=@(posedge sysclk) 1;
//  41:  40   0 if(ir[11:9]==1)
//  42: -41   0 begin
//  43:  42  50 while(ba!=11)
//  44: -43   0 begin
//  45:  44   0 @(posedge sysclk) #1 ;
//  46:  45   0 @(posedge sysclk) #1 ;
//  47:  46   0 lac<=@(posedge sysclk) {sum(lac[0],membus,c),lac[12:1]};
//  48:  47   0 c<=@(posedge sysclk) car(lac[0],membus,c);
//  49:  48   0 ba<=@(posedge sysclk) ba+1;
//  50:  49   0 end
//  51:  43   0 @(posedge sysclk) #1 ;
//  52:  51   0 lac<=@(posedge sysclk) {sum(lac[0],0,c),lac[12:1]};
//  53:  52   0 end
//  54:  41   0 else
//  55:  54   0 begin
//  56:  55   0 if(ir[11:9]==0)
//  57: -56   0 begin
//  58:  57  64 while(ba!=11)
//  59: -58   0 begin
//  60:  59   0 @(posedge sysclk) #1 ;
//  61:  60   0 @(posedge sysclk) #1 ;
//  62:  61   0 lac<=@(posedge sysclk) {lac[12],lac[0]&membus,lac[11:1]};
//  63:  62   0 ba<=@(posedge sysclk) ba+1;
//  64:  63   0 end
//  65:  58   0 end
//  66:  56   0 else
//  67:  66   0 begin
//  68:  67   0 if(ir[11:9]==2)
//  69: -68   0 begin
//  70:  69  83 while(ba!=11)
//  71: -70   0 begin
//  72:  71   0 @(posedge sysclk) #1 ;
//  73:  72   0 @(posedge sysclk) #1 ;
//  74:  73   0 mb<=@(posedge sysclk) sum(membus,0,c);
//  75:  74   0 c<=@(posedge sysclk) car(membus,0,c);
//  76:  75   0 @(posedge sysclk) #1 ;
//  77:  76   0 z<=@(posedge sysclk) z&(mb==0);
//  78:  77   0 write<=@(posedge sysclk) 0;
//  79:  78   0 @(posedge sysclk) #1 ;
//  80:  79   0 write<=@(posedge sysclk) 1;
//  81:  80   0 @(posedge sysclk) #1 ;
//  82:  81   0 ba<=@(posedge sysclk) ba+1;
//  83:  82   0 end
//  84:  70   0 @(posedge sysclk) #1 ;
//  85:  84   0 ba<=@(posedge sysclk) 0;
//  86:  85   0 if(z)
//  87: -86   0 begin
//  88:  87  94 while(ba!=11)
//  89: -88   0 begin
//  90:  89   0 @(posedge sysclk) #1 ;
//  91:  90   0 pc<=@(posedge sysclk) {sum(pc[0],0,c),pc[11:1]};
//  92:  91   0 c<=@(posedge sysclk) car(pc[0],0,c);
//  93:  92   0 ba<=@(posedge sysclk) ba+1;
//  94:  93   0 end
//  95:  88  86 end
//  96:  95   0 end
//  97:  68   0 else
//  98:  97   0 begin
//  99:  98   0 if(ir[11:9]==3)
// 100: -99   0 begin
// 101: 100 111 while(ba!=11)
// 102: -101   0 begin
// 103: 102   0 @(posedge sysclk) #1 ;
// 104: 103   0 lac<=@(posedge sysclk) {lac[12],1'b0,lac[11:1]};
// 105: 104   0 write<=@(posedge sysclk) 0;
// 106: 105   0 @(posedge sysclk) #1 ;
// 107: 106   0 write<=@(posedge sysclk) 1;
// 108: 107   0 @(posedge sysclk) #1 ;
// 109: 108   0 ba<=@(posedge sysclk) ba+1;
// 110: 109   0 mb<=@(posedge sysclk) lac[0];
// 111: 110   0 end
// 112: 101   0 end
// 113:  99   0 else
// 114: 113   0 begin
// 115: 114   0 if(ir[11:9]==5)
// 116: -115   0 begin
// 117: 116   0 @(posedge sysclk) #1 ;
// 118: 117   0 pc<=@(posedge sysclk) ma;
// 119: 118   0 end
// 120: 115   0 else
// 121: 120   0 begin
// 122: 121   0 if(ir[11:9]==7)
// 123: -122   0 begin
// 124: 123   0 if(ir[8])
// 125: -124   0 begin
// 126: 125   0 if(ir[1])
// 127: -126   0 begin
// 128: 127   0 @(posedge sysclk) #1 ;
// 129: 128   0 halt<=@(posedge sysclk) 1;
// 130: 129 126 end
// 131: 130   0 if(ir[3]^(ir[6]&lac[11]|ir[5]&(lac[11:0]==0)|ir[4]&lac[12]))
// 132: -131   0 begin
// 133: 132 139 while(ba!=11)
// 134: -133   0 begin
// 135: 134   0 @(posedge sysclk) #1 ;
// 136: 135   0 pc<=@(posedge sysclk) {sum(pc[0],0,c),pc[11:1]};
// 137: 136   0 c<=@(posedge sysclk) car(pc[0],0,c);
// 138: 137   0 ba<=@(posedge sysclk) ba+1;
// 139: 138   0 end
// 140: 133 131 end
// 141: 140   0 end
// 142: 124   0 else
// 143: 142   0 begin
// 144: 143   0 if(ir[7])
// 145: -144   0 begin
// 146: 145   0 @(posedge sysclk) #1 ;
// 147: 146   0 lac<=@(posedge sysclk) {lac[12],12'b0};
// 148: 147 144 end
// 149: 148   0 if(ir[6])
// 150: -149   0 begin
// 151: 150   0 @(posedge sysclk) #1 ;
// 152: 151   0 lac<=@(posedge sysclk) {1'b0,lac[11:0]};
// 153: 152 149 end
// 154: 153   0 if(ir[5])
// 155: -154   0 begin
// 156: 155   0 @(posedge sysclk) #1 ;
// 157: 156   0 lac<=@(posedge sysclk) {lac[12],~lac[11:0]};
// 158: 157 154 end
// 159: 158   0 if(ir[4])
// 160: -159   0 begin
// 161: 160   0 @(posedge sysclk) #1 ;
// 162: 161   0 lac<=@(posedge sysclk) {~lac[12],lac[11:0]};
// 163: 162 159 end
// 164: 163   0 if(ir[0])
// 165: -164   0 begin
// 166: 165 172 while(ba!=11)
// 167: -166   0 begin
// 168: 167   0 @(posedge sysclk) #1 ;
// 169: 168   0 lac<=@(posedge sysclk) {sum(lac[0],0,c),lac[12:1]};
// 170: 169   0 c<=@(posedge sysclk) car(lac[0],0,c);
// 171: 170   0 ba<=@(posedge sysclk) ba+1;
// 172: 171   0 end
// 173: 166   0 @(posedge sysclk) #1 ;
// 174: 173   0 lac<=@(posedge sysclk) {sum(lac[0],0,c),lac[12:1]};
// 175: 174 164 end
// 176: 175   0 @(posedge sysclk) #1 ;
// 177: 176   0 if(ir[2])
// 178: -177   0 begin
// 179: 178   0 lac<=@(posedge sysclk) {lac[11:0],lac[12]};
// 180: 179 177 end
// 181: 180   0 if(ir[3])
// 182: -181   0 begin
// 183: 182   0 lac<=@(posedge sysclk) {lac[0],lac[12:1]};
// 184: 183 181 end
// 185: 184 141 end
// 186: 185 122 end
// 187: 186 119 end
// 188: 187 112 end
// 189: 188  96 end
// 190: 189  65 end
// 191: 190  53 end
// 192: 191  22 end
// 193: 192   0 end
// 194:   0   0 end
