v {xschem version=3.4.7 file_version=1.2}
G {}
K {type=subcircuit
format="@name @pinlist @symname"
template="name=x1"
}
V {}
S {}
E {}
N -0 -90 0 -10 {lab=Vout}
N -0 50 0 90 {lab=GND}
N -0 20 -0 50 {lab=GND}
N 0 -190 -0 -150 {lab=VDD}
N -0 -150 0 -120 {lab=VDD}
N 0 -50 100 -50 {lab=Vout}
N -80 -120 -40 -120 {lab=Vin}
N -80 -120 -80 20 {lab=Vin}
N -80 20 -40 20 {lab=Vin}
N -120 -50 -80 -50 {lab=Vin}
C {sky130_fd_pr/nfet_01v8.sym} -20 20 0 0 {name=M1
W='w_n'
L=0.15
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
C {sky130_fd_pr/pfet_01v8.sym} -20 -120 0 0 {name=M2
W='w_p'
L=0.15
nf=1
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
C {opin.sym} 100 -50 0 0 {name=p1 lab=Vout}
C {ipin.sym} -120 -50 0 0 {name=p2 lab=Vin}
C {iopin.sym} 0 -190 0 0 {name=p3 lab=VDD}
C {iopin.sym} 0 90 0 0 {name=p4 lab=GND}
