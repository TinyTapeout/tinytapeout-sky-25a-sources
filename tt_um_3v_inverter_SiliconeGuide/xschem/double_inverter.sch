v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N -0 -70 70 -70 {lab=VDD}
N 70 -120 70 -70 {lab=VDD}
N 0 -120 70 -120 {lab=VDD}
N -0 -120 0 -100 {lab=VDD}
N -0 70 70 70 {lab=VSS}
N 70 70 70 120 {lab=VSS}
N 0 120 70 120 {lab=VSS}
N 0 100 0 120 {lab=VSS}
N 0 -40 0 40 {lab=#net1}
N -90 0 -40 0 {lab=input}
N -40 -70 -40 -0 {lab=input}
N -40 -0 -40 70 {lab=input}
N 0 0 220 0 {lab=#net1}
N 220 -70 220 0 {lab=#net1}
N 220 0 220 70 {lab=#net1}
N 260 -70 300 -70 {lab=VDD}
N 300 -120 300 -70 {lab=VDD}
N 260 -120 300 -120 {lab=VDD}
N 260 -120 260 -100 {lab=VDD}
N 260 70 300 70 {lab=VSS}
N 300 70 300 120 {lab=VSS}
N 260 120 300 120 {lab=VSS}
N 260 100 260 120 {lab=VSS}
N 260 -40 260 40 {lab=output}
N 260 -0 390 -0 {lab=output}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -20 -70 0 0 {name=M1
W=1
L=0.5
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 240 -70 0 0 {name=M3
W=20
L=0.5
nf=20
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
C {devices/ipin.sym} -90 0 0 0 {name=p6 lab=input}
C {devices/opin.sym} 390 0 0 0 {name=p10 lab=output
}
C {devices/lab_wire.sym} 0 120 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 0 -120 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 260 120 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 260 -120 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -20 70 0 0 {name=M5
W=1
L=0.5
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 240 70 0 0 {name=M2
W=20
L=0.5
nf=20
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
C {devices/iopin.sym} -250 -110 2 1 {name=p3 lab=VDD}
C {devices/iopin.sym} -250 -80 2 1 {name=p4 lab=VSS}
