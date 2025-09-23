v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 450 -350 450 -260 {lab=VDPWR}
N 230 -320 230 -260 {lab=VGND}
N 0 -50 0 -30 {lab=VGND}
N -0 -170 0 -150 {lab=VDPWR}
N 0 120 0 140 {lab=VGND}
N 0 0 0 20 {lab=VDPWR}
N 0 280 0 300 {lab=VGND}
N 0 160 0 180 {lab=VDPWR}
N 0 450 0 470 {lab=VGND}
N 0 330 0 350 {lab=VDPWR}
N 0 610 0 630 {lab=VGND}
N 0 490 0 510 {lab=VDPWR}
N 0 780 0 800 {lab=VGND}
N 0 660 0 680 {lab=VDPWR}
N 0 950 0 970 {lab=VGND}
N 0 830 0 850 {lab=VDPWR}
N -90 -100 -80 -100 {lab=in0}
N -90 70 -80 70 {lab=in1}
N -90 230 -80 230 {lab=in2}
N -90 400 -80 400 {lab=in3}
N -90 560 -80 560 {lab=in4}
N -90 730 -80 730 {lab=in5}
N -90 900 -80 900 {lab=in6}
N 80 900 90 900 {lab=proxyt6}
N 80 730 90 730 {lab=t5}
N 80 560 90 560 {lab=t4}
N 80 400 90 400 {lab=t3}
N 80 230 90 230 {lab=t2}
N 80 70 90 70 {lab=t1}
N 80 -100 90 -100 {lab=t0}
C {gain_stage.sym} 0 -100 0 0 {name=x1}
C {gain_stage.sym} 0 70 0 0 {name=x2}
C {gain_stage.sym} 0 230 0 0 {name=x3}
C {gain_stage.sym} 0 400 0 0 {name=x4}
C {gain_stage.sym} 0 560 0 0 {name=x5}
C {gain_stage.sym} 0 730 0 0 {name=x6}
C {gain_stage.sym} 0 900 0 0 {name=x7}
C {lab_wire.sym} 230 -320 0 0 {name=p1 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 450 -350 0 0 {name=p5 sig_type=std_logic lab=VDPWR}
C {iopin.sym} 230 -260 0 0 {name=p27 lab=VGND}
C {iopin.sym} 450 -260 0 0 {name=p28 lab=VDPWR}
C {lab_wire.sym} 0 -30 0 0 {name=p2 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 0 -170 0 0 {name=p3 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 0 140 0 0 {name=p4 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 0 0 0 0 {name=p6 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 0 300 0 0 {name=p7 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 0 160 0 0 {name=p8 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 0 470 0 0 {name=p9 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 0 330 0 0 {name=p10 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 0 630 0 0 {name=p11 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 0 490 0 0 {name=p12 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 0 800 0 0 {name=p13 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 0 660 0 0 {name=p14 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 0 970 0 0 {name=p15 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 0 830 0 0 {name=p16 sig_type=std_logic lab=VDPWR}
C {ipin.sym} -90 -100 0 0 {name=p17 lab=in0}
C {ipin.sym} -90 70 0 0 {name=p18 lab=in1}
C {ipin.sym} -90 230 0 0 {name=p19 lab=in2}
C {ipin.sym} -90 400 0 0 {name=p20 lab=in3}
C {ipin.sym} -90 560 0 0 {name=p21 lab=in4}
C {ipin.sym} -90 730 0 0 {name=p22 lab=in5}
C {ipin.sym} -90 900 0 0 {name=p23 lab=in6}
C {opin.sym} 90 -100 0 0 {name=p24 lab=t0}
C {opin.sym} 90 70 0 0 {name=p25 lab=t1}
C {opin.sym} 90 230 0 0 {name=p26 lab=t2}
C {opin.sym} 90 400 0 0 {name=p29 lab=t3}
C {opin.sym} 90 560 0 0 {name=p30 lab=t4}
C {opin.sym} 90 730 0 0 {name=p31 lab=t5}
C {opin.sym} 90 900 0 0 {name=p32 lab=t6}
