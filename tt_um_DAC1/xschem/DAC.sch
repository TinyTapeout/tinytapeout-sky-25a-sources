v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -320 230 -320 290 {
lab=VSS}
N -140 230 -140 290 {
lab=VSS}
N 150 230 150 290 {
lab=VSS}
N -530 200 -360 200 {
lab=G}
N -570 230 -570 290 {
lab=VSS}
N -570 -240 -570 -190 {
lab=Vref}
N 330 -100 330 -60 {
lab=OUT}
N -140 -100 -140 -60 {
lab=OUT}
N 150 -100 150 -60 {
lab=OUT}
N 110 200 110 260 {
lab=G}
N -180 200 -180 260 {
lab=G}
N -320 -100 330 -100 {
lab=OUT}
N 290 200 290 260 {
lab=G}
N -570 290 330 290 {
lab=VSS}
N 330 230 330 290 {
lab=VSS}
N -200 -30 -180 -30 {
lab=D1}
N -200 -130 -200 -30 {
lab=D1}
N 90 -30 110 -30 {
lab=D2}
N 90 -130 90 -30 {
lab=D2}
N 270 -30 290 -30 {
lab=D3}
N 270 -130 270 -30 {
lab=D3}
N -30 -160 -30 -100 {
lab=OUT}
N -30 -160 480 -160 {
lab=OUT}
N 480 -160 490 -160 {
lab=OUT}
N 490 -160 490 -0 {
lab=OUT}
N -410 -260 -410 -130 {
lab=D0}
N -200 -260 -200 -130 {
lab=D1}
N 90 -260 90 -130 {
lab=D2}
N 270 -260 270 -130 {
lab=D3}
N 550 0 640 -0 {
lab=VDD}
N -570 30 -570 170 {
lab=G}
N -570 100 -430 100 {
lab=G}
N -430 100 -430 200 {
lab=G}
N -430 200 -430 260 {
lab=G}
N -140 0 -140 170 {
lab=#net1}
N 150 0 150 170 {
lab=#net2}
N 330 -0 330 170 {
lab=#net3}
N -430 260 -180 260 {
lab=G}
N -180 260 110 260 {
lab=G}
N 110 260 290 260 {
lab=G}
N -410 -130 -410 -30 {
lab=D0}
N -410 -30 -360 -30 {
lab=D0}
N -320 -0 -320 170 {
lab=#net4}
N -320 -100 -320 -60 {
lab=OUT}
N -570 -130 -570 -90 {
lab=#net5}
N -570 -30 -570 30 {
lab=G}
N -680 -160 -590 -160 {
lab=VSS}
N -680 -160 -680 320 {
lab=VSS}
N -680 320 520 320 {
lab=VSS}
N 520 20 520 320 {
lab=VSS}
N -680 -60 -590 -60 {
lab=VSS}
N 0 320 0 340 {
lab=VSS}
N 0 290 0 320 {
lab=VSS}
N -320 -30 -240 -30 {
lab=VSS}
N -240 -30 -240 320 {
lab=VSS}
N -140 -30 -50 -30 {
lab=VSS}
N -50 -30 -50 320 {
lab=VSS}
N 150 -30 230 -30 {
lab=VSS}
N 230 -30 230 320 {
lab=VSS}
N 330 -30 410 -30 {
lab=VSS}
N 410 -30 410 320 {
lab=VSS}
N -620 200 -570 200 {
lab=VSS}
N -620 200 -620 320 {
lab=VSS}
N -320 200 -270 200 {
lab=VSS}
N -270 200 -270 320 {
lab=VSS}
N -140 200 -90 200 {
lab=VSS}
N -90 200 -90 320 {
lab=VSS}
N 150 200 190 200 {
lab=VSS}
N 190 200 190 320 {
lab=VSS}
N 330 200 380 200 {
lab=VSS}
N 380 200 380 320 {
lab=VSS}
C {devices/ipin.sym} -410 -260 0 0 {name=p5 lab=D0}
C {devices/ipin.sym} -200 -260 0 0 {name=p3 lab=D1}
C {devices/ipin.sym} 90 -260 0 0 {name=p4 lab=D2}
C {devices/ipin.sym} 270 -260 0 0 {name=p7 lab=D3}
C {devices/iopin.sym} -570 -240 0 0 {name=p2 lab=Vref}
C {devices/opin.sym} 490 -100 0 0 {name=p6 lab=OUT}
C {devices/iopin.sym} 640 0 0 0 {name=p1 lab=VDD}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} -570 -160 0 0 {name=R3
L=16
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} -570 -60 0 0 {name=R4
L=16
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 520 0 3 0 {name=R5
L=1.75
model=res_xhigh_po_0p69
spiceprefix=X
mult=1}
C {devices/lab_wire.sym} -430 100 0 0 {name=p9 sig_type=std_logic lab=G}
C {devices/iopin.sym} 0 340 0 0 {name=p8 lab=VSS}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -340 -30 0 0 {name=M6
L=0.18
W=6
nf=3 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -160 -30 0 0 {name=M1
L=0.18
W=6
nf=3 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 130 -30 0 0 {name=M2
L=0.18
W=6
nf=3 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 310 -30 0 0 {name=M3
L=0.18
W=6
nf=3 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -550 200 0 1 {name=M4
L=0.18
W=8
nf=3 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -340 200 0 0 {name=M5
L=0.18
W=8
nf=3 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -160 200 0 0 {name=M7
L=0.18
W=16
nf=6 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 130 200 0 0 {name=M8
L=0.18
W=33
nf=12 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 310 200 0 0 {name=M9
L=0.18
W=69
nf=24 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
