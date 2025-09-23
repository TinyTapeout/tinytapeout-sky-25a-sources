v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {LV to HV level translator} -290 70 0 0 0.4 0.4 {}
N -800 -220 -780 -220 {
lab=in_p}
N -800 -220 -800 -120 {
lab=in_p}
N -800 -120 -780 -120 {
lab=in_p}
N -740 -90 -740 -70 {
lab=VGND}
N -740 -270 -740 -250 {
lab=LVPWR}
N -740 -190 -740 -150 {
lab=in_n}
N -110 -140 -110 -100 {
lab=#net1}
N 110 -140 110 -100 {
lab=#net2}
N -110 -120 -50 -120 {
lab=#net1}
N -50 -120 30 -170 {
lab=#net1}
N 30 -170 70 -170 {
lab=#net1}
N -70 -170 -30 -170 {
lab=#net2}
N -30 -170 50 -120 {
lab=#net2}
N 50 -120 110 -120 {
lab=#net2}
N -170 0 110 0 {
lab=VGND}
N 110 -40 110 0 {
lab=VGND}
N -110 -40 -110 0 {
lab=VGND}
N -190 -70 -150 -70 {
lab=in_n}
N 150 -70 190 -70 {
lab=in_p}
N -110 -240 -110 -200 {
lab=#net3}
N 110 -240 110 -200 {
lab=#net4}
N 110 -120 150 -120 {
lab=#net2}
N 150 -120 170 -120 {
lab=#net2}
N 170 -270 170 -120 {
lab=#net2}
N 150 -270 170 -270 {
lab=#net2}
N -170 -120 -110 -120 {
lab=#net1}
N -170 -270 -170 -120 {
lab=#net1}
N -170 -270 -150 -270 {
lab=#net1}
N -110 -340 -110 -300 {
lab=HVPWR}
N -110 -340 110 -340 {
lab=HVPWR}
N 110 -340 110 -300 {
lab=HVPWR}
N -170 -340 -110 -340 {
lab=HVPWR}
N 270 -270 290 -270 {
lab=#net2}
N 270 -270 270 -70 {
lab=#net2}
N 270 -70 290 -70 {
lab=#net2}
N 170 -170 270 -170 {
lab=#net2}
N 110 -340 330 -340 {
lab=HVPWR}
N 330 -340 330 -300 {
lab=HVPWR}
N 110 0 330 0 {
lab=VGND}
N 330 -40 330 0 {
lab=VGND}
N 330 -240 330 -100 {
lab=H_out_p}
N 330 -170 370 -170 {
lab=H_out_p}
N -270 -170 -170 -170 {
lab=#net1}
N -290 -270 -270 -270 {
lab=#net1}
N -290 -70 -270 -70 {
lab=#net1}
N -270 -270 -270 -70 {
lab=#net1}
N -330 -240 -330 -100 {
lab=H_out_n}
N -450 0 -170 0 {
lab=VGND}
N -330 -40 -330 0 {
lab=VGND}
N -450 -340 -170 -340 {
lab=HVPWR}
N -330 -340 -330 -300 {
lab=HVPWR}
N -370 -170 -330 -170 {
lab=H_out_n}
N -740 -70 -740 0 {
lab=VGND}
N -740 -340 -740 -270 {
lab=LVPWR}
N -490 -340 -450 -340 {
lab=HVPWR}
N -820 -170 -800 -170 {
lab=in_p}
N -740 -170 -700 -170 {
lab=in_n}
N -700 -170 -680 -170 {
lab=in_n}
N -820 0 -740 0 {
lab=VGND}
N -820 -340 -740 -340 {
lab=LVPWR}
N -530 -340 -490 -340 {
lab=HVPWR}
N -740 0 -450 0 {
lab=VGND}
C {devices/ipin.sym} -820 -170 2 1 {name=p5 lab=in_p sim_pinnumber=4}
C {sky130_fd_pr/pfet3_g5v0d10v5.sym} 310 -270 0 0 {name=M12
W=0.84
L=0.5
body=HVPWR
nf=2
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
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} 310 -70 0 0 {name=M10
W=0.42
L=0.5
body=VGND
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
C {sky130_fd_pr/pfet3_g5v0d10v5.sym} -310 -270 0 1 {name=M11
W=0.84
L=0.5
body=HVPWR
nf=2
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
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} -310 -70 0 1 {name=M9
W=0.42
L=0.5
body=VGND
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
C {devices/iopin.sym} -820 0 2 0 {name=p8 lab=VGND sim_pinnumber=1}
C {devices/iopin.sym} -820 -340 2 0 {name=p9 lab=LVPWR sim_pinnumber=2}
C {sky130_fd_pr/nfet3_01v8.sym} -760 -120 0 0 {name=M1
W=0.42
L=0.15
body=VGND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8_hvt.sym} -760 -220 0 0 {name=M2
W=1
L=0.15
body=LVPWR
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_hvt
spiceprefix=X
}
C {devices/lab_wire.sym} -680 -170 0 1 {name=p10 sig_type=std_logic lab=in_n}
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} -130 -70 0 0 {name=M3
W=0.42
L=0.5
body=VGND
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
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} 130 -70 0 1 {name=M4
W=0.42
L=0.5
body=VGND
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
C {sky130_fd_pr/pfet3_g5v0d10v5.sym} -90 -170 0 1 {name=M5
W=0.42
L=0.5
body=HVPWR
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
C {sky130_fd_pr/pfet3_g5v0d10v5.sym} 90 -170 0 0 {name=M6
W=0.42
L=0.5
body=HVPWR
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
C {sky130_fd_pr/pfet3_g5v0d10v5.sym} -130 -270 0 0 {name=M7
W=0.42
L=0.5
body=HVPWR
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
C {sky130_fd_pr/pfet3_g5v0d10v5.sym} 130 -270 0 1 {name=M8
W=0.42
L=0.5
body=HVPWR
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
C {devices/lab_wire.sym} 190 -70 0 1 {name=p12 sig_type=std_logic lab=in_p}
C {devices/lab_wire.sym} -190 -70 0 0 {name=p13 sig_type=std_logic lab=in_n}
C {devices/iopin.sym} -530 -340 2 0 {name=p14 lab=HVPWR sim_pinnumber=3}
C {devices/title.sym} -730 150 0 0 {name=l1 author="Sylvain Munaut"}
C {devices/opin.sym} 370 -170 0 0 {name=p3 lab=H_out_p sim_pinnumber=5
}
C {devices/opin.sym} -370 -170 0 1 {name=p1 lab=H_out_n sim_pinnumber=6
}
