v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {
}
E {}
T {standard cell: sky130_fd_sc_hd__and2_1} 160 50 0 0 0.4 0.4 {}
C {devices/code_shown.sym} 40 140 0 0 {name=s1 only_toplevel=false value=
"
X0 a_40_47# B VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X1 a_123_47# B VGND VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X2 a_40_47# A a_123_47# VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X3 VGND a_40_47# X VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X4 VPWR A a_40_47# VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X5 VPWR a_40_47# X VPB sky130_fd_pr__pfet_01v8_hvt w=640000u l=150000u
"}
C {devices/ipin.sym} -240 80 0 0 {name=p1 lab=A}
C {devices/ipin.sym} -240 120 0 0 {name=p2 lab=B}
C {devices/iopin.sym} -240 240 0 1 {name=p5 lab=VGND}
C {devices/iopin.sym} -240 280 0 1 {name=p6 lab=VNB}
C {devices/iopin.sym} -240 320 0 1 {name=p7 lab=VPB}
C {devices/iopin.sym} -240 360 0 1 {name=p8 lab=VPWR}
C {devices/opin.sym} -240 400 0 0 {name=p9 lab=X}
