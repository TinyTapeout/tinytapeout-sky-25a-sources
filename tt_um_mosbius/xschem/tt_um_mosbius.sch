v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 180 480 320 480 {
lab=VGND}
N 180 -510 320 -510 {
lab=VAPWR}
N 180 -490 320 -490 {
lab=VDPWR}
N 180 -410 320 -410 {
lab=bus5,bus4,bus3,bus2,bus1
bus=true}
N 180 -370 320 -370 {
lab=ibias}
N -480 -400 -410 -400 {
lab=VDPWR}
N -480 -260 -410 -260 {
lab=VGND}
N -250 -360 -160 -360 {bus=true
lab=reg[195:0]}
N -480 -360 -410 -360 {
lab=clk}
N -480 -340 -410 -340 {
lab=dat_in}
N -480 -320 -410 -320 {
lab=rst_n}
N -250 -320 -130 -320 {
lab=dat_out}
N -480 -300 -410 -300 {
lab=ena}
N 250 -70 320 -70 {
lab=reg[5:0]}
N 250 -90 320 -90 {
lab=reg[135:130]}
N 250 -110 320 -110 {
lab=reg[138:136]}
N 250 -130 320 -130 {
lab=reg[83:78]}
N 250 -50 320 -50 {
lab=reg[13:8]}
N 250 -30 320 -30 {
lab=reg[21:16]}
N 250 -10 320 -10 {
lab=reg[154:149]}
N 250 10 320 10 {
lab=reg[162:157]}
N 250 30 320 30 {
lab=reg[170:165]}
N 250 290 320 290 {
lab=reg[35:30]}
N 250 310 320 310 {
lab=reg[28:23]}
N 250 330 320 330 {
lab=reg[193:188]}
N 250 350 320 350 {
lab=reg[185:180]}
N 250 370 320 370 {
lab=reg[177:172]}
N 250 270 320 270 {
lab=reg[141:139]}
N 250 -270 320 -270 {
lab=reg[59:54]}
N 250 -250 320 -250 {
lab=reg[51:46]}
N 250 -230 320 -230 {
lab=reg[101:99]}
N 250 -210 320 -210 {
lab=reg[111:106]}
N 250 -190 320 -190 {
lab=reg[67:62]}
N 250 -170 320 -170 {
lab=reg[119:114]}
N 250 -150 320 -150 {
lab=reg[87:85]}
N 250 150 320 150 {
lab=reg[75:70]}
N 250 130 320 130 {
lab=reg[104:102]}
N 250 170 320 170 {
lab=reg[127:122]}
N 250 190 320 190 {
lab=reg[90:88]}
N 250 210 320 210 {
lab=reg[97:92]}
N 250 230 320 230 {
lab=reg[147:142]}
N 250 250 320 250 {
lab=reg[43:38]}
N 250 440 320 440 {
lab=reg[195],reg[187],reg[179],reg[61],reg[60],reg[52]}
N 680 440 750 440 {
lab=reg[7],reg[15],reg[37],reg[45],reg[53]}
N 680 -270 750 -270 {
lab=reg[113],reg[112]}
N 680 -250 750 -250 {
lab=reg[105]}
N 680 -230 750 -230 {
lab=reg[120],reg[121]}
N 680 -210 750 -210 {
lab=reg[68],reg[69]}
N 680 -190 750 -190 {
lab=reg[128],reg[129]}
N 680 -170 750 -170 {
lab=reg[76],reg[77]}
N 680 -150 750 -150 {
lab=reg[156],reg[148]}
N 680 -130 750 -130 {
lab=reg[91],reg[84]}
N 680 -110 750 -110 {
lab=reg[164]}
N 680 -90 750 -90 {
lab=reg[98]}
N 680 -70 750 -70 {
lab=reg[171]}
N 680 -50 750 -50 {
lab=reg[22]}
N 680 -30 750 -30 {
lab=reg[163],reg[155]}
N 680 -10 750 -10 {
lab=reg[14],reg[6]}
N 680 10 750 10 {
lab=reg[178]}
N 680 30 750 30 {
lab=reg[29]}
N 680 50 750 50 {
lab=reg[186],reg[194]}
N 680 70 750 70 {
lab=reg[36],reg[44]}
N -480 -420 -410 -420 {
lab=VDPWR}
N -480 -240 -410 -240 {
lab=VGND}
C {mosbius.sym} 320 500 0 0 {name=x2}
C {devices/iopin.sym} 180 -410 2 0 {name=p4 lab=bus5,bus4,bus3,bus2,bus1}
C {devices/iopin.sym} 180 -370 2 0 {name=p5 lab=ibias}
C {devices/lab_pin.sym} -480 -400 0 0 {name=p6 sig_type=std_logic lab=VDPWR}
C {devices/lab_pin.sym} -480 -260 0 0 {name=p7 sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} -160 -360 0 1 {name=p8 sig_type=std_logic lab=reg[195:0]}
C {devices/ipin.sym} 180 -510 0 0 {name=p17 lab=VAPWR}
C {devices/ipin.sym} 180 -490 0 0 {name=p2 lab=VDPWR}
C {devices/ipin.sym} 180 480 0 0 {name=p3 lab=VGND}
C {devices/ipin.sym} -480 -360 0 0 {name=p18 lab=clk}
C {devices/ipin.sym} -480 -340 0 0 {name=p19 lab=dat_in}
C {devices/ipin.sym} -480 -320 0 0 {name=p20 lab=rst_n}
C {devices/opin.sym} -130 -320 0 0 {name=p21 lab=dat_out}
C {shift_reg.sym} -330 -330 0 0 {name=x1}
C {devices/ipin.sym} -480 -300 0 0 {name=p1 lab=enable}
C {devices/lab_pin.sym} 250 -70 0 0 {name=p9 sig_type=std_logic lab=reg[5:0]}
C {devices/lab_pin.sym} 250 -50 0 0 {name=p10 sig_type=std_logic lab=reg[13:8]}
C {devices/lab_pin.sym} 250 -30 0 0 {name=p11 sig_type=std_logic lab=reg[21:16]}
C {devices/lab_pin.sym} 250 310 0 0 {name=p12 sig_type=std_logic lab=reg[28:23]}
C {devices/lab_pin.sym} 250 290 0 0 {name=p13 sig_type=std_logic lab=reg[35:30]}
C {devices/lab_pin.sym} 250 -250 0 0 {name=p15 sig_type=std_logic lab=reg[51:46]}
C {devices/lab_pin.sym} 250 -270 0 0 {name=p16 sig_type=std_logic lab=reg[59:54]}
C {devices/lab_pin.sym} 250 -190 0 0 {name=p22 sig_type=std_logic lab=reg[67:62]}
C {devices/lab_pin.sym} 250 150 0 0 {name=p23 sig_type=std_logic lab=reg[75:70]}
C {devices/lab_pin.sym} 250 -130 0 0 {name=p24 sig_type=std_logic lab=reg[83:78]}
C {devices/lab_pin.sym} 250 210 0 0 {name=p25 sig_type=std_logic lab=reg[97:92]}
C {devices/lab_pin.sym} 250 -150 0 0 {name=p26 sig_type=std_logic lab=reg[87:85]}
C {devices/lab_pin.sym} 250 190 0 0 {name=p27 sig_type=std_logic lab=reg[90:88]}
C {devices/lab_pin.sym} 250 -230 0 0 {name=p28 sig_type=std_logic lab=reg[101:99]}
C {devices/lab_pin.sym} 250 130 0 0 {name=p29 sig_type=std_logic lab=reg[104:102]}
C {devices/lab_pin.sym} 250 -210 0 0 {name=p30 sig_type=std_logic lab=reg[111:106]}
C {devices/lab_pin.sym} 250 -170 0 0 {name=p31 sig_type=std_logic lab=reg[119:114]}
C {devices/lab_pin.sym} 250 170 0 0 {name=p32 sig_type=std_logic lab=reg[127:122]}
C {devices/lab_pin.sym} 250 -90 0 0 {name=p33 sig_type=std_logic lab=reg[135:130]}
C {devices/lab_pin.sym} 250 -110 0 0 {name=p34 sig_type=std_logic lab=reg[138:136]}
C {devices/lab_pin.sym} 250 250 0 0 {name=p14 sig_type=std_logic lab=reg[43:38]}
C {devices/lab_pin.sym} 250 270 0 0 {name=p36 sig_type=std_logic lab=reg[141:139]}
C {devices/lab_pin.sym} 250 230 0 0 {name=p35 sig_type=std_logic lab=reg[147:142]}
C {devices/lab_pin.sym} 250 -10 0 0 {name=p37 sig_type=std_logic lab=reg[154:149]}
C {devices/lab_pin.sym} 250 10 0 0 {name=p38 sig_type=std_logic lab=reg[162:157]}
C {devices/lab_pin.sym} 250 30 0 0 {name=p39 sig_type=std_logic lab=reg[170:165]}
C {devices/lab_pin.sym} 250 370 0 0 {name=p40 sig_type=std_logic lab=reg[177:172]}
C {devices/lab_pin.sym} 250 350 0 0 {name=p41 sig_type=std_logic lab=reg[185:180]}
C {devices/lab_pin.sym} 250 330 0 0 {name=p42 sig_type=std_logic lab=reg[193:188]}
C {devices/lab_pin.sym} 250 440 0 0 {name=p43 sig_type=std_logic lab=reg[195],reg[187],reg[179],reg[61],reg[60],reg[52]}
C {devices/lab_pin.sym} 750 440 0 1 {name=p44 sig_type=std_logic lab=reg[7],reg[15],reg[37],reg[45],reg[53]}
C {devices/lab_pin.sym} 750 -250 0 1 {name=p45 sig_type=std_logic lab=reg[105]}
C {devices/lab_pin.sym} 750 -270 0 1 {name=p47 sig_type=std_logic lab=reg[113],reg[112]}
C {devices/lab_pin.sym} 750 -210 0 1 {name=p48 sig_type=std_logic lab=reg[68],reg[69]}
C {devices/lab_pin.sym} 750 -170 0 1 {name=p49 sig_type=std_logic lab=reg[76],reg[77]}
C {devices/lab_pin.sym} 750 -230 0 1 {name=p50 sig_type=std_logic lab=reg[120],reg[121]}
C {devices/lab_pin.sym} 750 -190 0 1 {name=p51 sig_type=std_logic lab=reg[128],reg[129]}
C {devices/lab_pin.sym} 750 -150 0 1 {name=p52 sig_type=std_logic lab=reg[156],reg[148]}
C {devices/lab_pin.sym} 750 -110 0 1 {name=p53 sig_type=std_logic lab=reg[164]}
C {devices/lab_pin.sym} 750 -130 0 1 {name=p54 sig_type=std_logic lab=reg[91],reg[84]}
C {devices/lab_pin.sym} 750 -90 0 1 {name=p55 sig_type=std_logic lab=reg[98]}
C {devices/lab_pin.sym} 750 -70 0 1 {name=p56 sig_type=std_logic lab=reg[171]}
C {devices/lab_pin.sym} 750 -30 0 1 {name=p57 sig_type=std_logic lab=reg[163],reg[155]}
C {devices/lab_pin.sym} 750 50 0 1 {name=p58 sig_type=std_logic lab=reg[186],reg[194]}
C {devices/lab_pin.sym} 750 10 0 1 {name=p59 sig_type=std_logic lab=reg[178]}
C {devices/lab_pin.sym} 750 -50 0 1 {name=p60 sig_type=std_logic lab=reg[22]}
C {devices/lab_pin.sym} 750 -10 0 1 {name=p61 sig_type=std_logic lab=reg[14],reg[6]}
C {devices/lab_pin.sym} 750 30 0 1 {name=p62 sig_type=std_logic lab=reg[29]}
C {devices/lab_pin.sym} 750 70 0 1 {name=p63 sig_type=std_logic lab=reg[36],reg[44]}
C {devices/lab_pin.sym} -480 -420 0 0 {name=p46 sig_type=std_logic lab=VDPWR}
C {devices/lab_pin.sym} -480 -240 0 0 {name=p64 sig_type=std_logic lab=VGND}
C {devices/code_shown.sym} -20 -800 0 0 {name=s1 only_toplevel=false value="
*used to pass LVS
.include /foss/pdks/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
