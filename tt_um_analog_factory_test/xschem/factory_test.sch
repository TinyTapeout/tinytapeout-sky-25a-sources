v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 520 140 600 140 {
lab=VGND}
N 600 140 750 140 {
lab=VGND}
N 400 -100 400 -70 {
lab=bias}
N 400 -200 400 -160 {
lab=ibias}
N 380 -200 400 -200 {
lab=ibias}
N 380 140 520 140 {
lab=VGND}
N 420 -130 440 -130 {
lab=VGND}
N 400 120 400 140 {
lab=VGND}
N 400 -50 400 60 {
lab=bias}
N 540 90 730 90 {
lab=bias}
N 440 90 540 90 {
lab=bias}
N 400 40 460 40 {
lab=bias}
N 460 40 460 90 {
lab=bias}
N 580 120 580 140 {
lab=VGND}
N 770 120 770 140 {
lab=VGND}
N 580 -240 580 -40 {
lab=VDPWR}
N 770 -280 770 -40 {
lab=VAPWR}
N 770 20 770 60 {
lab=mid_3v3}
N 520 -10 540 -10 {
lab=ena_1v8_n}
N 710 -10 730 -10 {
lab=H_ena_3v3_n}
N -310 -280 340 -280 {
lab=VAPWR}
N -310 -240 340 -240 {
lab=VDPWR}
N -230 -210 -210 -210 {
lab=VAPWR}
N -230 -280 -230 -210 {
lab=VAPWR}
N -250 -190 -210 -190 {
lab=VDPWR}
N -250 -240 -250 -190 {
lab=VDPWR}
N -270 -130 -210 -130 {
lab=VGND}
N -300 140 380 140 {
lab=VGND}
N 340 -280 380 -280 {
lab=VAPWR}
N 340 -240 380 -240 {
lab=VDPWR}
N -310 -170 -210 -170 {
lab=ena_3v3_n}
N 120 -10 520 -10 {
lab=ena_1v8_n}
N 400 -70 400 -50 {
lab=bias}
N 710 -60 710 -10 {
lab=H_ena_3v3_n}
N 150 -60 710 -60 {
lab=H_ena_3v3_n}
N 580 20 580 60 {
lab=mid_1v8}
N 380 -280 770 -280 {
lab=VAPWR}
N 380 -240 580 -240 {
lab=VDPWR}
N 750 140 770 140 {
lab=VGND}
N 150 -150 150 -60 {
lab=H_ena_3v3_n}
N 90 -170 150 -170 {
lab=H_ena_3v3_n}
N 150 -170 150 -150 {
lab=H_ena_3v3_n}
N -310 -10 120 -10 {
lab=ena_1v8_n}
N -270 -130 -270 140 {
lab=VGND}
C {devices/ipin.sym} -310 -170 0 0 {name=p2 lab=ena_3v3_n sim_pinnumber=4}
C {devices/iopin.sym} -310 -240 2 0 {name=p3 lab=VDPWR sim_pinnumber=1
}
C {devices/iopin.sym} -300 140 2 0 {name=p4 lab=VGND sim_pinnumber=0

}
C {devices/ipin.sym} 380 -200 0 0 {name=p5 lab=ibias sim_pinnumber=5}
C {sky130_fd_pr/res_high_po_5p73.sym} 400 -130 0 1 {name=R1
L=20
model=res_high_po_5p73
spiceprefix=X
mult=1}
C {devices/iopin.sym} -310 -280 2 0 {name=p8 lab=VAPWR sim_pinnumber=2
}
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} 420 90 0 1 {name=M1
W=16
L=0.5
body=VGND
nf=4
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
C {devices/lab_wire.sym} 440 -130 0 1 {name=p12 sig_type=std_logic lab=VGND
}
C {devices/ipin.sym} -310 -10 0 0 {name=p13 lab=ena_1v8_n sim_pinnumber=3}
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} 560 90 0 0 {name=M2
W=320
L=0.5
body=VGND
nf=80
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
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} 750 90 0 0 {name=M3
W=320
L=0.5
body=VGND
nf=80
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
C {devices/lab_wire.sym} 260 -60 0 0 {name=p16 sig_type=std_logic lab=H_ena_3v3_n
}
C {devices/title.sym} -200 290 0 0 {name=l1 author="Sylvain Munaut"}
C {lv2hv.sym} -60 -170 0 0 {name=x1}
C {sky130_fd_pr/pfet3_g5v0d10v5.sym} 750 -10 0 0 {name=M5
W=240
L=0.5
body=VAPWR
nf=80
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
C {sky130_fd_pr/pfet3_01v8.sym} 560 -10 0 0 {name=M4
W=360
L=0.15
body=VDPWR
nf=120
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_wire.sym} 460 50 0 1 {name=p1 sig_type=std_logic lab=bias

}
C {devices/lab_wire.sym} 580 50 0 1 {name=p6 sig_type=std_logic lab=mid_1v8

}
C {devices/lab_wire.sym} 770 50 0 1 {name=p7 sig_type=std_logic lab=mid_3v3

}
