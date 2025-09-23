v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1320 130 1370 130 {
lab=data[6:0]}
N 580 -280 610 -280 {
lab=clk}
N 580 -260 610 -260 {
lab=dat}
N 580 -240 610 -240 {
lab=rstb}
N 900 -280 930 -280 {
lab=clk}
N 900 -260 930 -260 {
lab=reg[0]}
N 900 -240 930 -240 {
lab=rstb}
N 790 -280 830 -280 {
lab=reg[0]}
N 830 -280 830 -260 {
lab=reg[0]}
N 830 -260 900 -260 {
lab=reg[0]}
N 1220 -280 1250 -280 {
lab=clk}
N 1220 -260 1250 -260 {
lab=reg[1]}
N 1220 -240 1250 -240 {
lab=rstb}
N 1110 -280 1150 -280 {
lab=reg[1]}
N 1150 -280 1150 -260 {
lab=reg[1]}
N 1150 -260 1220 -260 {
lab=reg[1]}
N 1540 -280 1570 -280 {
lab=clk}
N 1540 -260 1570 -260 {
lab=reg[2]}
N 1540 -240 1570 -240 {
lab=rstb}
N 1430 -280 1470 -280 {
lab=reg[2]}
N 1470 -280 1470 -260 {
lab=reg[2]}
N 1470 -260 1540 -260 {
lab=reg[2]}
N 1860 -280 1890 -280 {
lab=clk}
N 1860 -260 1890 -260 {
lab=reg[3]}
N 1860 -240 1890 -240 {
lab=rstb}
N 1750 -280 1790 -280 {
lab=reg[3]}
N 1790 -280 1790 -260 {
lab=reg[3]}
N 1790 -260 1860 -260 {
lab=reg[3]}
N 2180 -280 2210 -280 {
lab=clk}
N 2180 -260 2210 -260 {
lab=reg[4]}
N 2180 -240 2210 -240 {
lab=rstb}
N 2070 -280 2110 -280 {
lab=reg[4]}
N 2110 -280 2110 -260 {
lab=reg[4]}
N 2110 -260 2180 -260 {
lab=reg[4]}
N 2500 -280 2530 -280 {
lab=clk}
N 2500 -260 2530 -260 {
lab=reg[5]}
N 2500 -240 2530 -240 {
lab=rstb}
N 2390 -280 2430 -280 {
lab=reg[5]}
N 2430 -280 2430 -260 {
lab=reg[5]}
N 2430 -260 2500 -260 {
lab=reg[5]}
N 2710 -280 2760 -280 {
lab=out}
N 1160 110 1200 110 {
lab=out,reg[5:0]}
N 1160 150 1200 150 {
lab=ena}
N 2760 -280 2780 -280 {
lab=out}
N 580 130 610 130 {
lab=clkb}
N 690 130 730 130 {
lab=clk}
C {devices/ipin.sym} 240 -220 0 0 {name=p1 lab=clkb}
C {devices/ipin.sym} 240 -200 0 0 {name=p2 lab=dat}
C {devices/ipin.sym} 240 -180 0 0 {name=p3 lab=rstb}
C {devices/iopin.sym} 240 -300 0 1 {name=p10 lab=VPWR}
C {devices/iopin.sym} 240 -80 0 1 {name=p11 lab=VGND}
C {devices/opin.sym} 1370 130 0 0 {name=p4 lab=data[6:0]}
C {devices/ipin.sym} 240 -160 0 0 {name=p5 lab=ena}
C {devices/lab_pin.sym} 580 -240 0 0 {name=p7 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 580 -280 0 0 {name=p8 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 580 -260 0 0 {name=p9 sig_type=std_logic lab=dat}
C {devices/lab_pin.sym} 900 -240 0 0 {name=p14 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 900 -280 0 0 {name=p15 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1220 -240 0 0 {name=p16 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1220 -280 0 0 {name=p19 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1540 -240 0 0 {name=p22 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1540 -280 0 0 {name=p23 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1860 -240 0 0 {name=p26 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1860 -280 0 0 {name=p27 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2180 -240 0 0 {name=p30 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 2180 -280 0 0 {name=p31 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2500 -240 0 0 {name=p34 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 2500 -280 0 0 {name=p35 sig_type=std_logic lab=clk}
C {devices/lab_wire.sym} 830 -280 0 0 {name=p42 sig_type=std_logic lab=reg[0]}
C {devices/lab_wire.sym} 1150 -280 0 0 {name=p43 sig_type=std_logic lab=reg[1]}
C {devices/lab_wire.sym} 1470 -280 0 0 {name=p44 sig_type=std_logic lab=reg[2]}
C {devices/lab_wire.sym} 1790 -280 0 0 {name=p45 sig_type=std_logic lab=reg[3]}
C {devices/lab_wire.sym} 2110 -280 0 0 {name=p46 sig_type=std_logic lab=reg[4]}
C {devices/lab_wire.sym} 2430 -280 0 0 {name=p47 sig_type=std_logic lab=reg[5]}
C {devices/lab_pin.sym} 1160 110 0 0 {name=p52 sig_type=std_logic lab=out,reg[5:0]}
C {devices/lab_pin.sym} 1160 150 0 0 {name=p53 sig_type=std_logic lab=ena}
C {devices/opin.sym} 2780 -280 0 0 {name=p6 lab=out}
C {devices/lab_pin.sym} 580 130 0 0 {name=p40 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} 730 130 2 0 {name=p41 sig_type=std_logic lab=clk}
C {sky130_stdcells/clkinv_1.sym} 650 130 0 0 {name=x8 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/and2_1.sym} 1260 130 0 0 {name=x9[6:0] VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 700 -260 0 0 {name=x1 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 1020 -260 0 0 {name=x2 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 1340 -260 0 0 {name=x3 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 1660 -260 0 0 {name=x4 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 1980 -260 0 0 {name=x5 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 2300 -260 0 0 {name=x6 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 2620 -260 0 0 {name=x7 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/iopin.sym} 240 -280 0 1 {name=p12 lab=VPB}
C {devices/iopin.sym} 240 -100 0 1 {name=p13 lab=VNB}
