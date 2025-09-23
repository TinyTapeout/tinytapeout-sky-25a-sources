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
        s_141,s_142,s_143,s_144,s_145,s_146,s_147,s_148;
  reg ff_999;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_999 <= 0;
    else
      ff_999 <= 1;
  wire s_999 = ~ff_999;
  assign s_1  = s_999|s_148;
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
  assign s_7  = s_6|s_147;
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
  wire tmp_40 = s_39;
  wire qual_40 = (ir[11:9]==1);
  assign s_40 = tmp_40&(~qual_40);
  wire  sT_40 = tmp_40&qual_40;
  assign s_41  = sT_40;
  wire tmp_42 = s_41|s_49;
  wire qual_42 = (ba!=11);
  assign s_42 = tmp_42&(~qual_42);
  wire  sT_42 = tmp_42&qual_42;
  assign s_43  = sT_42;
  wire tmp_44 = s_43;
  reg ff_44;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_44 <= 0;
    else
      ff_44 <= tmp_44;
  assign s_44 = ff_44;
  wire tmp_45 = s_44;
  reg ff_45;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_45 <= 0;
    else
      ff_45 <= tmp_45;
  assign s_45 = ff_45;
  assign s_46  = s_45;
  assign s_47  = s_46;
  assign s_48  = s_47;
  assign s_49  = s_48;
  wire tmp_50 = s_42;
  reg ff_50;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_50 <= 0;
    else
      ff_50 <= tmp_50;
  assign s_50 = ff_50;
  assign s_51  = s_50;
  assign s_52  = s_51;
  assign s_53  = s_40;
  assign s_54  = s_53;
  wire tmp_55 = s_54;
  wire qual_55 = (ir[11:9]==3);
  assign s_55 = tmp_55&(~qual_55);
  wire  sT_55 = tmp_55&qual_55;
  assign s_56  = sT_55;
  wire tmp_57 = s_56|s_67;
  wire qual_57 = (ba!=11);
  assign s_57 = tmp_57&(~qual_57);
  wire  sT_57 = tmp_57&qual_57;
  assign s_58  = sT_57;
  wire tmp_59 = s_58;
  reg ff_59;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_59 <= 0;
    else
      ff_59 <= tmp_59;
  assign s_59 = ff_59;
  assign s_60  = s_59;
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
  wire tmp_64 = s_63;
  reg ff_64;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_64 <= 0;
    else
      ff_64 <= tmp_64;
  assign s_64 = ff_64;
  assign s_65  = s_64;
  assign s_66  = s_65;
  assign s_67  = s_66;
  assign s_68  = s_57;
  assign s_69  = s_55;
  assign s_70  = s_69;
  wire tmp_71 = s_70;
  wire qual_71 = (ir[11:9]==5);
  assign s_71 = tmp_71&(~qual_71);
  wire  sT_71 = tmp_71&qual_71;
  assign s_72  = sT_71;
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
  assign s_76  = s_71;
  assign s_77  = s_76;
  wire tmp_78 = s_77;
  wire qual_78 = (ir[11:9]==7);
  assign s_78 = tmp_78&(~qual_78);
  wire  sT_78 = tmp_78&qual_78;
  assign s_79  = sT_78;
  wire tmp_80 = s_79;
  wire qual_80 = (ir[8]);
  assign s_80 = tmp_80&(~qual_80);
  wire  sT_80 = tmp_80&qual_80;
  assign s_81  = sT_80;
  wire tmp_82 = s_81;
  wire qual_82 = (ir[1]);
  assign s_82 = tmp_82&(~qual_82);
  wire  sT_82 = tmp_82&qual_82;
  assign s_83  = sT_82;
  wire tmp_84 = s_83;
  reg ff_84;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_84 <= 0;
    else
      ff_84 <= tmp_84;
  assign s_84 = ff_84;
  assign s_85  = s_84;
  assign s_86  = s_85|s_82;
  wire tmp_87 = s_86;
  wire qual_87 = (ir[3]^(ir[6]&lac[11]|ir[5]&(lac[11:0]==0)|ir[4]&lac[12]));
  assign s_87 = tmp_87&(~qual_87);
  wire  sT_87 = tmp_87&qual_87;
  assign s_88  = sT_87;
  wire tmp_89 = s_88|s_95;
  wire qual_89 = (ba!=11);
  assign s_89 = tmp_89&(~qual_89);
  wire  sT_89 = tmp_89&qual_89;
  assign s_90  = sT_89;
  wire tmp_91 = s_90;
  reg ff_91;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_91 <= 0;
    else
      ff_91 <= tmp_91;
  assign s_91 = ff_91;
  assign s_92  = s_91;
  assign s_93  = s_92;
  assign s_94  = s_93;
  assign s_95  = s_94;
  assign s_96  = s_89|s_87;
  assign s_97  = s_96;
  assign s_98  = s_80;
  assign s_99  = s_98;
  wire tmp_100 = s_99;
  wire qual_100 = (ir[7]);
  assign s_100 = tmp_100&(~qual_100);
  wire  sT_100 = tmp_100&qual_100;
  assign s_101  = sT_100;
  wire tmp_102 = s_101;
  reg ff_102;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_102 <= 0;
    else
      ff_102 <= tmp_102;
  assign s_102 = ff_102;
  assign s_103  = s_102;
  assign s_104  = s_103|s_100;
  wire tmp_105 = s_104;
  wire qual_105 = (ir[6]);
  assign s_105 = tmp_105&(~qual_105);
  wire  sT_105 = tmp_105&qual_105;
  assign s_106  = sT_105;
  wire tmp_107 = s_106;
  reg ff_107;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_107 <= 0;
    else
      ff_107 <= tmp_107;
  assign s_107 = ff_107;
  assign s_108  = s_107;
  assign s_109  = s_108|s_105;
  wire tmp_110 = s_109;
  wire qual_110 = (ir[5]);
  assign s_110 = tmp_110&(~qual_110);
  wire  sT_110 = tmp_110&qual_110;
  assign s_111  = sT_110;
  wire tmp_112 = s_111;
  reg ff_112;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_112 <= 0;
    else
      ff_112 <= tmp_112;
  assign s_112 = ff_112;
  assign s_113  = s_112;
  assign s_114  = s_113|s_110;
  wire tmp_115 = s_114;
  wire qual_115 = (ir[4]);
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
  assign s_119  = s_118|s_115;
  wire tmp_120 = s_119;
  wire qual_120 = (ir[0]);
  assign s_120 = tmp_120&(~qual_120);
  wire  sT_120 = tmp_120&qual_120;
  assign s_121  = sT_120;
  wire tmp_122 = s_121|s_128;
  wire qual_122 = (ba!=11);
  assign s_122 = tmp_122&(~qual_122);
  wire  sT_122 = tmp_122&qual_122;
  assign s_123  = sT_122;
  wire tmp_124 = s_123;
  reg ff_124;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_124 <= 0;
    else
      ff_124 <= tmp_124;
  assign s_124 = ff_124;
  assign s_125  = s_124;
  assign s_126  = s_125;
  assign s_127  = s_126;
  assign s_128  = s_127;
  wire tmp_129 = s_122;
  reg ff_129;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_129 <= 0;
    else
      ff_129 <= tmp_129;
  assign s_129 = ff_129;
  assign s_130  = s_129;
  assign s_131  = s_130|s_120;
  wire tmp_132 = s_131;
  reg ff_132;
  always @(posedge sysclk or posedge reset)
    if (reset)
      ff_132 <= 0;
    else
      ff_132 <= tmp_132;
  assign s_132 = ff_132;
  wire tmp_133 = s_132;
  wire qual_133 = (ir[2]);
  assign s_133 = tmp_133&(~qual_133);
  wire  sT_133 = tmp_133&qual_133;
  assign s_134  = sT_133;
  assign s_135  = s_134;
  assign s_136  = s_135|s_133;
  wire tmp_137 = s_136;
  wire qual_137 = (ir[3]);
  assign s_137 = tmp_137&(~qual_137);
  wire  sT_137 = tmp_137&qual_137;
  assign s_138  = sT_137;
  assign s_139  = s_138;
  assign s_140  = s_139|s_137;
  assign s_141  = s_140|s_97;
  assign s_142  = s_141|s_78;
  assign s_143  = s_142|s_75;
  assign s_144  = s_143|s_68;
  assign s_145  = s_144|s_52;
  assign s_146  = s_145|s_22;
  assign s_147  = s_146;
  assign s_148  = 1'b0;

  always @(posedge sysclk)
   begin
     if(s_11|s_33|s_37|s_48|s_65|s_94|s_127)
        ba <= 
             s_11 ?  0  :
             s_33 ?  ba+1  :
             s_37 ?  0  :
             s_48 ?  ba+1  :
             s_65 ?  ba+1  :
             s_94 ?  ba+1  :
             ba+1 ;
     if(s_12|s_32|s_93|s_39|s_126|s_47)
        c <= 
             s_12 ?  1  :
             s_32 ?  car(pc[0],0,c)  :
             s_93 ?  car(pc[0],0,c)  :
             s_39 ?  ir[10]  :
             s_126 ?  car(lac[0],0,c)  :
             car(lac[0],membus,c) ;
     if(s_4|s_85|s_18)
        halt <= 
             s_4 ?  1  :
             s_85 ?  1  :
             0 ;
     if(s_30)
        ir <= 
             {membus,ir[11:1]} ;
     if(s_46|s_103|s_108|s_113|s_118|s_125|s_51|s_60|s_130|s_135|s_139)
        lac <= 
             s_46 ?  {sum(lac[0],membus,c),lac[12:1]}  :
             s_103 ?  {lac[12],12'b0}  :
             s_108 ?  {1'b0,lac[11:0]}  :
             s_113 ?  {lac[12],~lac[11:0]}  :
             s_118 ?  {~lac[12],lac[11:0]}  :
             s_125 ?  {sum(lac[0],0,c),lac[12:1]}  :
             s_51 ?  {sum(lac[0],0,c),lac[12:1]}  :
             s_60 ?  {lac[12],1'b0,lac[11:1]}  :
             s_130 ?  {sum(lac[0],0,c),lac[12:1]}  :
             s_135 ?  {lac[11:0],lac[12]}  :
             {lac[0],lac[12:1]} ;
     if(s_19|s_10|s_36)
        ma <= 
             s_19 ?  pc  :
             s_10 ?  pc  :
             ea(ir) ;
     if(s_20|s_66|s_38)
        mb <= 
             s_20 ?  0  :
             s_66 ?  lac[0]  :
             lac[0] ;
     if(s_6|s_74|s_31|s_92)
        pc <= 
             s_6 ?  12'o0100  :
             s_74 ?  ma  :
             s_31 ?  {sum(pc[0],0,c),pc[11:1]}  :
             {sum(pc[0],0,c),pc[11:1]} ;
     if(s_63|s_5|s_61)
        write <= 
             s_63 ?  1  :
             s_5 ?  1  :
             0 ;
   end

endmodule
//
//  Comefrom Table for module number 1:
//
//   1: 999 148 always
//   2:   1   0 begin
//   3:   2   0 @(posedge sysclk) #1 ;
//   4:   3   0 halt<=@(posedge sysclk) 1;
//   5:   4   0 write<=@(posedge sysclk) 1;
//   6:   5   0 pc<=@(posedge sysclk) 12'o0100;
//   7:   6 147 forever
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
//  40:  39   0 if(ir[11:9]==1)
//  41: -40   0 begin
//  42:  41  49 while(ba!=11)
//  43: -42   0 begin
//  44:  43   0 @(posedge sysclk) #1 ;
//  45:  44   0 @(posedge sysclk) #1 ;
//  46:  45   0 lac<=@(posedge sysclk) {sum(lac[0],membus,c),lac[12:1]};
//  47:  46   0 c<=@(posedge sysclk) car(lac[0],membus,c);
//  48:  47   0 ba<=@(posedge sysclk) ba+1;
//  49:  48   0 end
//  50:  42   0 @(posedge sysclk) #1 ;
//  51:  50   0 lac<=@(posedge sysclk) {sum(lac[0],0,c),lac[12:1]};
//  52:  51   0 end
//  53:  40   0 else
//  54:  53   0 begin
//  55:  54   0 if(ir[11:9]==3)
//  56: -55   0 begin
//  57:  56  67 while(ba!=11)
//  58: -57   0 begin
//  59:  58   0 @(posedge sysclk) #1 ;
//  60:  59   0 lac<=@(posedge sysclk) {lac[12],1'b0,lac[11:1]};
//  61:  60   0 write<=@(posedge sysclk) 0;
//  62:  61   0 @(posedge sysclk) #1 ;
//  63:  62   0 write<=@(posedge sysclk) 1;
//  64:  63   0 @(posedge sysclk) #1 ;
//  65:  64   0 ba<=@(posedge sysclk) ba+1;
//  66:  65   0 mb<=@(posedge sysclk) lac[0];
//  67:  66   0 end
//  68:  57   0 end
//  69:  55   0 else
//  70:  69   0 begin
//  71:  70   0 if(ir[11:9]==5)
//  72: -71   0 begin
//  73:  72   0 @(posedge sysclk) #1 ;
//  74:  73   0 pc<=@(posedge sysclk) ma;
//  75:  74   0 end
//  76:  71   0 else
//  77:  76   0 begin
//  78:  77   0 if(ir[11:9]==7)
//  79: -78   0 begin
//  80:  79   0 if(ir[8])
//  81: -80   0 begin
//  82:  81   0 if(ir[1])
//  83: -82   0 begin
//  84:  83   0 @(posedge sysclk) #1 ;
//  85:  84   0 halt<=@(posedge sysclk) 1;
//  86:  85  82 end
//  87:  86   0 if(ir[3]^(ir[6]&lac[11]|ir[5]&(lac[11:0]==0)|ir[4]&lac[12]))
//  88: -87   0 begin
//  89:  88  95 while(ba!=11)
//  90: -89   0 begin
//  91:  90   0 @(posedge sysclk) #1 ;
//  92:  91   0 pc<=@(posedge sysclk) {sum(pc[0],0,c),pc[11:1]};
//  93:  92   0 c<=@(posedge sysclk) car(pc[0],0,c);
//  94:  93   0 ba<=@(posedge sysclk) ba+1;
//  95:  94   0 end
//  96:  89  87 end
//  97:  96   0 end
//  98:  80   0 else
//  99:  98   0 begin
// 100:  99   0 if(ir[7])
// 101: -100   0 begin
// 102: 101   0 @(posedge sysclk) #1 ;
// 103: 102   0 lac<=@(posedge sysclk) {lac[12],12'b0};
// 104: 103 100 end
// 105: 104   0 if(ir[6])
// 106: -105   0 begin
// 107: 106   0 @(posedge sysclk) #1 ;
// 108: 107   0 lac<=@(posedge sysclk) {1'b0,lac[11:0]};
// 109: 108 105 end
// 110: 109   0 if(ir[5])
// 111: -110   0 begin
// 112: 111   0 @(posedge sysclk) #1 ;
// 113: 112   0 lac<=@(posedge sysclk) {lac[12],~lac[11:0]};
// 114: 113 110 end
// 115: 114   0 if(ir[4])
// 116: -115   0 begin
// 117: 116   0 @(posedge sysclk) #1 ;
// 118: 117   0 lac<=@(posedge sysclk) {~lac[12],lac[11:0]};
// 119: 118 115 end
// 120: 119   0 if(ir[0])
// 121: -120   0 begin
// 122: 121 128 while(ba!=11)
// 123: -122   0 begin
// 124: 123   0 @(posedge sysclk) #1 ;
// 125: 124   0 lac<=@(posedge sysclk) {sum(lac[0],0,c),lac[12:1]};
// 126: 125   0 c<=@(posedge sysclk) car(lac[0],0,c);
// 127: 126   0 ba<=@(posedge sysclk) ba+1;
// 128: 127   0 end
// 129: 122   0 @(posedge sysclk) #1 ;
// 130: 129   0 lac<=@(posedge sysclk) {sum(lac[0],0,c),lac[12:1]};
// 131: 130 120 end
// 132: 131   0 @(posedge sysclk) #1 ;
// 133: 132   0 if(ir[2])
// 134: -133   0 begin
// 135: 134   0 lac<=@(posedge sysclk) {lac[11:0],lac[12]};
// 136: 135 133 end
// 137: 136   0 if(ir[3])
// 138: -137   0 begin
// 139: 138   0 lac<=@(posedge sysclk) {lac[0],lac[12:1]};
// 140: 139 137 end
// 141: 140  97 end
// 142: 141  78 end
// 143: 142  75 end
// 144: 143  68 end
// 145: 144  52 end
// 146: 145  22 end
// 147: 146   0 end
// 148:   0   0 end
