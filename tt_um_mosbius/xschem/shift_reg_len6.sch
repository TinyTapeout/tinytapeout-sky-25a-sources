v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1320 130 1370 130 {
lab=data[5:0]}
N 550 -280 580 -280 {
lab=clk}
N 550 -260 580 -260 {
lab=dat}
N 550 -240 580 -240 {
lab=rstb}
N 870 -280 900 -280 {
lab=clk}
N 870 -260 900 -260 {
lab=reg[0]}
N 870 -240 900 -240 {
lab=rstb}
N 760 -280 800 -280 {
lab=reg[0]}
N 800 -280 800 -260 {
lab=reg[0]}
N 800 -260 870 -260 {
lab=reg[0]}
N 1190 -280 1220 -280 {
lab=clk}
N 1190 -260 1220 -260 {
lab=reg[1]}
N 1190 -240 1220 -240 {
lab=rstb}
N 1080 -280 1120 -280 {
lab=reg[1]}
N 1120 -280 1120 -260 {
lab=reg[1]}
N 1120 -260 1190 -260 {
lab=reg[1]}
N 1510 -280 1540 -280 {
lab=clk}
N 1510 -260 1540 -260 {
lab=reg[2]}
N 1510 -240 1540 -240 {
lab=rstb}
N 1400 -280 1440 -280 {
lab=reg[2]}
N 1440 -280 1440 -260 {
lab=reg[2]}
N 1440 -260 1510 -260 {
lab=reg[2]}
N 1830 -280 1860 -280 {
lab=clk}
N 1830 -260 1860 -260 {
lab=reg[3]}
N 1830 -240 1860 -240 {
lab=rstb}
N 1720 -280 1760 -280 {
lab=reg[3]}
N 1760 -280 1760 -260 {
lab=reg[3]}
N 1760 -260 1830 -260 {
lab=reg[3]}
N 2150 -280 2180 -280 {
lab=clk}
N 2150 -260 2180 -260 {
lab=reg[4]}
N 2150 -240 2180 -240 {
lab=rstb}
N 2040 -280 2080 -280 {
lab=reg[4]}
N 2080 -280 2080 -260 {
lab=reg[4]}
N 2080 -260 2150 -260 {
lab=reg[4]}
N 1160 110 1200 110 {
lab=out,reg[4:0]}
N 1160 150 1200 150 {
lab=ena}
N 2360 -280 2380 -280 {
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
C {devices/opin.sym} 1370 130 0 0 {name=p4 lab=data[5:0]}
C {devices/ipin.sym} 240 -160 0 0 {name=p5 lab=ena}
C {devices/lab_pin.sym} 550 -240 0 0 {name=p7 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 550 -280 0 0 {name=p8 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 550 -260 0 0 {name=p9 sig_type=std_logic lab=dat}
C {devices/lab_pin.sym} 870 -240 0 0 {name=p14 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 870 -280 0 0 {name=p15 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1190 -240 0 0 {name=p16 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1190 -280 0 0 {name=p19 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1510 -240 0 0 {name=p22 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1510 -280 0 0 {name=p23 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1830 -240 0 0 {name=p26 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1830 -280 0 0 {name=p27 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2150 -240 0 0 {name=p30 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 2150 -280 0 0 {name=p31 sig_type=std_logic lab=clk}
C {devices/lab_wire.sym} 800 -280 0 0 {name=p42 sig_type=std_logic lab=reg[0]}
C {devices/lab_wire.sym} 1120 -280 0 0 {name=p43 sig_type=std_logic lab=reg[1]}
C {devices/lab_wire.sym} 1440 -280 0 0 {name=p44 sig_type=std_logic lab=reg[2]}
C {devices/lab_wire.sym} 1760 -280 0 0 {name=p45 sig_type=std_logic lab=reg[3]}
C {devices/lab_wire.sym} 2080 -280 0 0 {name=p46 sig_type=std_logic lab=reg[4]}
C {devices/lab_pin.sym} 1160 110 0 0 {name=p52 sig_type=std_logic lab=out,reg[4:0]}
C {devices/lab_pin.sym} 1160 150 0 0 {name=p53 sig_type=std_logic lab=ena}
C {devices/opin.sym} 2380 -280 0 0 {name=p6 lab=out}
C {devices/lab_pin.sym} 580 130 0 0 {name=p55 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} 730 130 2 0 {name=p56 sig_type=std_logic lab=clk}
C {sky130_stdcells/clkinv_1.sym} 650 130 0 0 {name=x7 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/and2_1.sym} 1260 130 0 0 {name=x8[5:0] VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 670 -260 0 0 {name=x8 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 990 -260 0 0 {name=x1 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 1310 -260 0 0 {name=x2 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 1630 -260 0 0 {name=x3 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 1950 -260 0 0 {name=x4 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 2270 -260 0 0 {name=x5 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/iopin.sym} 240 -280 0 1 {name=p12 lab=VPB}
C {devices/iopin.sym} 240 -100 0 1 {name=p13 lab=VNB}
