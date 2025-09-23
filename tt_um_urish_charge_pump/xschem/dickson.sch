v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {ua[0] = vout / 3} 1040 180 0 0 0.4 0.4 {}
T {since TT09 can only output 3v3} 1040 220 0 0 0.25 0.25 {}
N -320 100 -300 100 {
lab=clk}
N -300 100 -300 150 {
lab=clk}
N -260 180 -260 200 {
lab=VGND}
N -260 100 -160 100 {
lab=clka}
N -90 180 -90 200 {
lab=VGND}
N -260 80 -260 120 {
lab=clka}
N -300 50 -300 100 {
lab=clk}
N -90 80 -90 120 {
lab=clkb}
N -90 100 -60 100 {
lab=clkb}
N -60 100 -40 100 {
lab=clkb}
N -260 0 -260 20 {
lab=VAPWR}
N -90 -0 -90 20 {
lab=VAPWR}
N -130 50 -130 100 {
lab=clka}
N -160 100 -130 100 {
lab=clka}
N -130 100 -130 150 {
lab=clka}
N 40 0 40 50 {
lab=VAPWR}
N 140 50 180 50 {
lab=stage1}
N 180 50 180 140 {
lab=stage1}
N 180 200 180 220 {
lab=clka}
N 320 50 320 140 {
lab=stage2}
N 280 50 320 50 {
lab=stage2}
N 320 200 320 220 {
lab=clkb}
N 460 50 460 140 {
lab=stage3}
N 460 200 460 220 {
lab=clka}
N 420 50 460 50 {
lab=stage3}
N 320 50 360 50 {
lab=stage2}
N 460 50 500 50 {
lab=stage3}
N 560 50 600 50 {
lab=vout}
N 600 50 610 50 {
lab=vout}
N 610 50 610 140 {
lab=vout}
N 610 200 610 230 {
lab=VGND}
N 610 50 690 50 {
lab=vout}
N 840 50 870 50 {
lab=vout}
N 870 190 950 190 {
lab=ua[0]}
N 870 180 870 200 {
lab=ua[0]}
N 870 260 870 280 {
lab=VGND}
N 870 100 870 120 {
lab=#net1}
N -310 -0 -260 0 {
lab=VAPWR}
N -260 0 -90 -0 {
lab=VAPWR}
N -90 -0 40 0 {
lab=VAPWR}
N 870 150 890 150 {
lab=#net1}
N 870 110 890 110 {
lab=#net1}
N 890 110 890 150 {
lab=#net1}
N 870 230 890 230 {
lab=ua[0]}
N 890 190 890 230 {
lab=ua[0]}
N 830 150 830 190 {
lab=ua[0]}
N 830 190 870 190 {
lab=ua[0]}
N 830 230 830 270 {
lab=VGND}
N 830 270 870 270 {
lab=VGND}
N 40 50 80 50 {
lab=VAPWR}
N 180 50 230 50 {
lab=stage1}
N -260 20 -260 50 {
lab=VAPWR}
N -90 20 -90 50 {
lab=VAPWR}
N 870 50 870 80 {
lab=vout}
N 830 110 870 110 {
lab=#net1}
N 830 80 830 110 {
lab=#net1}
C {devices/ipin.sym} -320 100 0 0 {name=p2 lab=clk}
C {devices/lab_wire.sym} -160 100 0 0 {name=p4 sig_type=std_logic lab=clka}
C {devices/lab_wire.sym} -40 100 0 0 {name=p5 sig_type=std_logic lab=clkb}
C {sky130_fd_pr/cap_mim_m3_1.sym} 460 170 2 0 {name=C3 model=cap_mim_m3_1 W=25 L=25 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 180 170 2 0 {name=C1 model=cap_mim_m3_1 W=25 L=25 MF=1 spiceprefix=X}
C {devices/lab_pin.sym} 180 220 3 0 {name=p3 sig_type=std_logic lab=clka}
C {sky130_fd_pr/cap_mim_m3_1.sym} 320 170 2 0 {name=C2 model=cap_mim_m3_1 W=25 L=25 MF=1 spiceprefix=X}
C {devices/lab_pin.sym} 320 220 3 0 {name=p6 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} 460 220 3 0 {name=p7 sig_type=std_logic lab=clka}
C {sky130_fd_pr/cap_mim_m3_1.sym} 610 170 2 0 {name=C4 model=cap_mim_m3_1 W=30 L=25 MF=1 spiceprefix=X}
C {devices/title.sym} -220 370 0 0 {name=l2 author="Uri Shaked"}
C {devices/lab_wire.sym} 210 50 0 0 {name=p8 sig_type=std_logic lab=stage1}
C {devices/lab_wire.sym} 350 50 0 0 {name=p9 sig_type=std_logic lab=stage2}
C {devices/lab_wire.sym} 490 50 0 0 {name=p10 sig_type=std_logic lab=stage3}
C {devices/lab_pin.sym} 840 50 0 0 {name=p12 sig_type=std_logic lab=vout}
C {devices/opin.sym} 950 190 0 0 {name=p11 lab=ua[0]}
C {devices/ipin.sym} -310 0 0 0 {name=p13 lab=VAPWR}
C {devices/ipin.sym} -300 290 0 0 {name=p15 lab=VGND}
C {vgnd.sym} -260 200 0 0 {name=l1 lab=VGND}
C {vgnd.sym} -90 200 0 0 {name=l3 lab=VGND}
C {vgnd.sym} 610 230 0 0 {name=l4 lab=VGND}
C {vgnd.sym} 870 280 0 0 {name=l6 lab=VGND}
C {devices/lab_pin.sym} 690 50 0 1 {name=p1 sig_type=std_logic lab=vout}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 850 150 0 0 {name=M9
L=40
W=0.42
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 850 230 0 0 {name=M10
L=40
W=0.42
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/diode.sym} 110 50 1 0 {name=D1
model=diode_pd2nw_11v0
area=1e12
pj=4e6
}
C {sky130_fd_pr/diode.sym} 260 50 1 0 {name=D2
model=diode_pd2nw_11v0
area=1e12
pj=4e6
}
C {sky130_fd_pr/diode.sym} 390 50 1 0 {name=D3
model=diode_pd2nw_11v0
area=1e12
pj=4e6
}
C {sky130_fd_pr/diode.sym} 530 50 1 0 {name=D4
model=diode_pd2nw_11v0
area=1e12
pj=4e6
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -280 50 0 0 {name=M1
L=0.5
W=1.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} -280 150 0 0 {name=M3
L=0.5
W=1
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -110 50 0 0 {name=M2
L=0.5
W=1.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} -110 150 0 0 {name=M4
L=0.5
W=1
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/ipin.sym} -310 -50 0 0 {name=p14 lab=VDPWR}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 850 80 0 0 {name=M8
L=40
W=0.42
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
