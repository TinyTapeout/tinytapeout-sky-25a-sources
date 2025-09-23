v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1420 -1760 1420 -1720 {lab=VSS}
N 1420 -1720 1600 -1720 {lab=VSS}
N 1600 -1760 1600 -1720 {lab=VSS}
N 1460 -1790 1560 -1790 {lab=#net1}
N 1420 -1860 1420 -1820 {lab=#net1}
N 1420 -1860 1500 -1860 {lab=#net1}
N 1500 -1860 1500 -1790 {lab=#net1}
N 1380 -1790 1420 -1790 {lab=VSS}
N 1380 -1790 1380 -1720 {lab=VSS}
N 1380 -1720 1420 -1720 {lab=VSS}
N 1600 -1790 1640 -1790 {lab=VSS}
N 1640 -1790 1640 -1720 {lab=VSS}
N 1600 -1720 1640 -1720 {lab=VSS}
N 1420 -1920 1420 -1860 {lab=#net1}
N 1420 -2050 1420 -2000 {lab=#net2}
N 1420 -2000 1420 -1980 {lab=#net2}
N 1600 -1840 1600 -1820 {lab=IOUT}
N 1320 -1950 1320 -1910 {lab=VSS}
N 1350 -1950 1400 -1950 {lab=VSS}
N 1320 -1910 1320 -1720 {lab=VSS}
N 1350 -1720 1380 -1720 {lab=VSS}
N 1600 -1910 1600 -1840 {lab=IOUT}
N 1600 -1910 1640 -1910 {lab=IOUT}
N 1290 -1720 1320 -1720 {lab=VSS}
N 1280 -2340 1360 -2340 {lab=VDD}
N 1320 -1950 1350 -1950 {lab=VSS}
N 1320 -1720 1350 -1720 {lab=VSS}
N 1320 -2080 1320 -1950 {lab=VSS}
N 1320 -2080 1400 -2080 {lab=VSS}
N 1320 -2190 1320 -2080 {lab=VSS}
N 1320 -2190 1400 -2190 {lab=VSS}
N 1320 -2290 1320 -2190 {lab=VSS}
N 1320 -2290 1400 -2290 {lab=VSS}
N 1420 -2340 1420 -2320 {lab=VDD}
N 1360 -2340 1420 -2340 {lab=VDD}
N 1420 -2260 1420 -2220 {lab=#net3}
N 1420 -2160 1420 -2110 {lab=#net4}
C {sky130_fd_pr/nfet_01v8.sym} 1440 -1790 0 1 {name=M1
W=10
L=5
nf=4 
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
C {sky130_fd_pr/nfet_01v8.sym} 1580 -1790 0 0 {name=M2
W=10
L=5
nf=4 
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
C {sky130_fd_pr/res_high_po_0p35.sym} 1420 -1950 0 0 {name=R1
L=15
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {opin.sym} 1640 -1910 0 0 {name=p1 lab=IOUT}
C {ipin.sym} 1290 -1720 0 0 {name=p3 lab=VSS}
C {ipin.sym} 1280 -2340 0 0 {name=p4 lab=VDD}
C {sky130_fd_pr/res_high_po_0p35.sym} 1420 -2080 0 0 {name=R2
L=15
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_0p35.sym} 1420 -2190 0 0 {name=R3
L=15
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_0p35.sym} 1420 -2290 0 0 {name=R4
L=15
model=res_high_po_0p35
spiceprefix=X
mult=1}
