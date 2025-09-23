v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -90 -70 -90 10 {lab=Vout}
N -90 70 -90 110 {lab=VGND}
N -90 40 -90 70 {lab=VGND}
N -90 -170 -90 -130 {lab=VDPWR}
N -90 -130 -90 -100 {lab=VDPWR}
N -90 -30 10 -30 {lab=Vout}
N -170 -100 -130 -100 {lab=Vin}
N -170 -100 -170 40 {lab=Vin}
N -170 40 -130 40 {lab=Vin}
N -210 -30 -170 -30 {lab=Vin}
N -280 -30 -210 -30 {lab=Vin}
N -90 110 -90 140 {lab=VGND}
N -90 -210 -90 -170 {lab=VDPWR}
N 10 -30 490 -30 {lab=Vout}
N -90 -230 -90 -210 {lab=VDPWR}
N 70 210 100 210 {lab=VGND}
N -90 140 -90 170 {lab=VGND}
C {sky130_fd_pr/nfet_01v8.sym} -110 40 0 0 {name=M1
W=5
L=0.15
nf=2
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
C {sky130_fd_pr/pfet_01v8.sym} -110 -100 0 0 {name=M2
W=15
L=0.15
nf=2
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
C {lab_wire.sym} -10 -30 0 0 {name=p1 sig_type=std_logic lab=Vout}
C {lab_wire.sym} -170 10 0 0 {name=p2 sig_type=std_logic lab=Vin}
C {opin.sym} 490 -30 0 0 {name=p5 lab=Vout}
C {ipin.sym} -280 -30 0 0 {name=p6 lab=Vin}
C {iopin.sym} -90 -230 0 0 {name=p7 lab=VDPWR}
C {iopin.sym} 100 210 0 0 {name=p8 lab=VGND}
C {lab_wire.sym} 70 210 0 0 {name=p9 sig_type=std_logic lab=VGND}
C {lab_wire.sym} -90 170 0 0 {name=p12 sig_type=std_logic lab=VGND}
