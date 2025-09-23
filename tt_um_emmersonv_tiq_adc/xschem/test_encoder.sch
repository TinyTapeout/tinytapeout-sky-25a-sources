v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -280 -60 -280 70 {lab=#net1}
N -280 -60 -140 -60 {lab=#net1}
N -280 -40 -140 -40 {lab=#net1}
N -280 130 -280 160 {lab=GND}
N -280 140 -200 140 {lab=GND}
N -200 -20 -140 -20 {lab=#net1}
N -200 -0 -140 -0 {lab=#net1}
N -200 20 -140 20 {lab=#net1}
N -200 40 -140 40 {lab=#net1}
N 60 -60 60 -10 {lab=o2}
N 60 30 60 100 {lab=o0}
N 160 100 180 100 {lab=o0}
N 160 10 180 10 {lab=o1}
N 160 -60 180 -60 {lab=o2}
N 60 -60 70 -60 {lab=o2}
N 130 -60 160 -60 {lab=o2}
N 60 10 70 10 {lab=o1}
N 130 10 160 10 {lab=o1}
N 60 100 70 100 {lab=o0}
N 130 100 160 100 {lab=o0}
N 70 -60 130 -60 {lab=o2}
N 70 10 130 10 {lab=o1}
N 70 100 140 100 {lab=o0}
N 240 10 310 10 {lab=GND}
N 240 -60 310 -60 {lab=GND}
N 310 -60 310 10 {lab=GND}
N 240 100 290 100 {lab=GND}
N 290 10 290 100 {lab=GND}
N -280 -20 -200 -20 {lab=#net1}
N -280 0 -200 0 {lab=#net1}
N -280 20 -200 20 {lab=#net1}
N -280 40 -200 40 {lab=#net1}
N -200 140 -140 140 {lab=GND}
N -200 80 -140 80 {lab=GND}
N -200 80 -200 140 {lab=GND}
N -200 60 -140 60 {lab=GND}
N -200 60 -200 80 {lab=GND}
C {vsource.sym} -280 100 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -280 160 0 0 {name=l1 lab=GND}
C {code_shown.sym} 210 240 0 0 {name=s1 only_toplevel=false value=
"
.control
	save all
	tran 1ns 100ns
	write test_encoder.raw
.endc
"}
C {lab_wire.sym} 160 -60 0 0 {name=p1 sig_type=std_logic lab=o2}
C {lab_wire.sym} 160 10 0 0 {name=p2 sig_type=std_logic lab=o1}
C {lab_wire.sym} 160 100 0 0 {name=p3 sig_type=std_logic lab=o0}
C {capa.sym} 210 10 3 1 {name=C1
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 210 100 3 1 {name=C2
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 210 -60 3 1 {name=C3
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 310 10 0 0 {name=l2 lab=GND}
C {encoder.sym} 10 60 0 0 {name=x1
schematic=encoderr
spice_sym_def=
"
* NGSPICE file created from encoder.ext - technology: sky130A

* Black-box entry subcircuit for sky130_fd_sc_hd__fill_1 abstract view
.subckt sky130_fd_sc_hd__fill_1 VGND VNB VPB VPWR
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__decap_6 abstract view
.subckt sky130_fd_sc_hd__decap_6 VGND VNB VPB VPWR
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__tapvpwrvgnd_1 abstract view
.subckt sky130_fd_sc_hd__tapvpwrvgnd_1 VGND VPWR
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__decap_3 abstract view
.subckt sky130_fd_sc_hd__decap_3 VGND VNB VPB VPWR
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__decap_8 abstract view
.subckt sky130_fd_sc_hd__decap_8 VGND VNB VPB VPWR
.ends

* Black-box entry subcircuit for sky130_ef_sc_hd__decap_12 abstract view
.subckt sky130_ef_sc_hd__decap_12 VPWR VGND VPB VNB
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__clkbuf_1 abstract view
.subckt sky130_fd_sc_hd__clkbuf_1 A VGND VNB VPB VPWR X
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__decap_4 abstract view
.subckt sky130_fd_sc_hd__decap_4 VGND VNB VPB VPWR
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__and3_1 abstract view
.subckt sky130_fd_sc_hd__and3_1 A B C VGND VNB VPB VPWR X
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__buf_1 abstract view
.subckt sky130_fd_sc_hd__buf_1 A VGND VNB VPB VPWR X
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__a32o_4 abstract view
.subckt sky130_fd_sc_hd__a32o_4 A1 A2 A3 B1 B2 VGND VNB VPB VPWR X
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__fill_2 abstract view
.subckt sky130_fd_sc_hd__fill_2 VGND VNB VPB VPWR
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__a21o_1 abstract view
.subckt sky130_fd_sc_hd__a21o_1 A1 A2 B1 VGND VNB VPB VPWR X
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__nor2_1 abstract view
.subckt sky130_fd_sc_hd__nor2_1 A B VGND VNB VPB VPWR Y
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__or2_1 abstract view
.subckt sky130_fd_sc_hd__or2_1 A B VGND VNB VPB VPWR X
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__and2_1 abstract view
.subckt sky130_fd_sc_hd__and2_1 A B VGND VNB VPB VPWR X
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__a21o_2 abstract view
.subckt sky130_fd_sc_hd__a21o_2 A1 A2 B1 VGND VNB VPB VPWR X
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__a31o_4 abstract view
.subckt sky130_fd_sc_hd__a31o_4 A1 A2 A3 B1 VGND VNB VPB VPWR X
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__nor4_1 abstract view
.subckt sky130_fd_sc_hd__nor4_1 A B C D VGND VNB VPB VPWR Y
.ends

* Black-box entry subcircuit for sky130_fd_sc_hd__and4_1 abstract view
.subckt sky130_fd_sc_hd__and4_1 A B C D VGND VNB VPB VPWR X
.ends

.subckt encoderr VGND VPWR clk o0 o1 o2 t0 t1 t2 t3 t4 t5 t6
XFILLER_9_55 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XFILLER_0_57 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_6
XFILLER_3_57 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XTAP_TAPCELL_ROW_2_25 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XPHY_EDGE_ROW_6_Right_6 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_9_57 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_8
XFILLER_0_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_3_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XPHY_EDGE_ROW_4_Left_15 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_6_47 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XFILLER_3_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_0_27 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
Xmax_cap8 _13_/Y VGND VGND VPWR VPWR _14_/A3 sky130_fd_sc_hd__clkbuf_1
XFILLER_6_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_3_27 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_9_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_6_27 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XFILLER_3_39 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_9_27 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_1_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_0_29 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XTAP_TAPCELL_ROW_5_28 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XPHY_EDGE_ROW_8_Left_19 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_9_39 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_1_51 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_4
XPHY_EDGE_ROW_1_Right_1 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_6_29 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
X_09_ _10_/A _18_/A _18_/B VGND VGND VPWR VPWR _09_/X sky130_fd_sc_hd__and3_1
XFILLER_4_41 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_4
XFILLER_10_41 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_1_65 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XPHY_EDGE_ROW_5_Right_5 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XTAP_TAPCELL_ROW_0_22 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XFILLER_1_55 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XPHY_EDGE_ROW_3_Left_14 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_10_53 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XTAP_TAPCELL_ROW_9_32 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XTAP_TAPCELL_ROW_0_23 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XFILLER_4_45 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XFILLER_8_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
Xinput1 t0 VGND VGND VPWR VPWR _10_/A sky130_fd_sc_hd__buf_1
XTAP_TAPCELL_ROW_10_33 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XFILLER_1_57 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_8
X_20_ _13_/C _11_/C _17_/X _19_/X _13_/Y VGND VGND VPWR VPWR o0 sky130_fd_sc_hd__a32o_4
XPHY_EDGE_ROW_9_Right_9 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
Xinput2 t1 VGND VGND VPWR VPWR _18_/A sky130_fd_sc_hd__buf_1
XTAP_TAPCELL_ROW_10_34 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XPHY_EDGE_ROW_7_Left_18 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_10_57 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
Xinput3 t2 VGND VGND VPWR VPWR _18_/B sky130_fd_sc_hd__clkbuf_1
XFILLER_1_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XPHY_EDGE_ROW_10_Left_21 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XPHY_EDGE_ROW_0_Right_0 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XTAP_TAPCELL_ROW_3_26 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XFILLER_4_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_1_27 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_6_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
Xinput4 t3 VGND VGND VPWR VPWR _13_/B sky130_fd_sc_hd__clkbuf_1
XFILLER_7_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_4_27 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XFILLER_10_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_1_39 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
Xinput5 t4 VGND VGND VPWR VPWR _13_/C sky130_fd_sc_hd__buf_1
XFILLER_7_27 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_10_27 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
Xinput6 t5 VGND VGND VPWR VPWR _16_/B sky130_fd_sc_hd__buf_1
XPHY_EDGE_ROW_4_Right_4 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_7_39 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_4_29 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
Xinput7 t6 VGND VGND VPWR VPWR _16_/A sky130_fd_sc_hd__buf_1
XPHY_EDGE_ROW_2_Left_13 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_4_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XTAP_TAPCELL_ROW_6_29 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XFILLER_2_62 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XFILLER_8_61 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_2
XFILLER_10_29 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_2_41 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_8
XPHY_EDGE_ROW_10_Right_10 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XTAP_TAPCELL_ROW_7_30 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XFILLER_8_41 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XPHY_EDGE_ROW_8_Right_8 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_5_53 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_2_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XPHY_EDGE_ROW_6_Left_17 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XPHY_EDGE_ROW_9_Left_20 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_8_53 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_8
XFILLER_5_65 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
X_19_ _10_/A _18_/Y _09_/X VGND VGND VPWR VPWR _19_/X sky130_fd_sc_hd__a21o_1
XFILLER_10_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
X_18_ _18_/A _18_/B VGND VGND VPWR VPWR _18_/Y sky130_fd_sc_hd__nor2_1
XTAP_TAPCELL_ROW_1_24 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XFILLER_5_45 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XFILLER_0_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
X_17_ _17_/A _17_/B VGND VGND VPWR VPWR _17_/X sky130_fd_sc_hd__or2_1
XFILLER_5_57 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
X_16_ _16_/A _16_/B VGND VGND VPWR VPWR _17_/B sky130_fd_sc_hd__and2_1
XPHY_EDGE_ROW_3_Right_3 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_2_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XPHY_EDGE_ROW_1_Left_12 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
X_15_ _11_/C _17_/A _11_/X VGND VGND VPWR VPWR o2 sky130_fd_sc_hd__a21o_2
XFILLER_5_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_2_27 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
XTAP_TAPCELL_ROW_4_27 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
X_14_ _10_/A _18_/A _14_/A3 _11_/X VGND VGND VPWR VPWR o1 sky130_fd_sc_hd__a31o_4
XFILLER_8_15 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_5_27 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_9_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_8_27 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
X_13_ _16_/A _13_/B _13_/C _16_/B VGND VGND VPWR VPWR _13_/Y sky130_fd_sc_hd__nor4_1
XFILLER_5_39 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_6
XPHY_EDGE_ROW_7_Right_7 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_2_29 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
X_12_ _16_/A _16_/B VGND VGND VPWR VPWR _17_/A sky130_fd_sc_hd__nor2_1
XPHY_EDGE_ROW_5_Left_16 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_8_29 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_0_41 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
X_11_ _13_/C _16_/B _11_/C VGND VGND VPWR VPWR _11_/X sky130_fd_sc_hd__and3_1
XFILLER_7_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_6_62 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
X_10_ _10_/A _18_/A _18_/B _13_/B VGND VGND VPWR VPWR _11_/C sky130_fd_sc_hd__and4_1
XFILLER_9_51 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_4
XFILLER_0_53 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_6_41 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_6
XTAP_TAPCELL_ROW_8_31 VGND VPWR sky130_fd_sc_hd__tapvpwrvgnd_1
XPHY_EDGE_ROW_2_Right_2 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XPHY_EDGE_ROW_0_Left_11 VGND VGND VPWR VPWR sky130_fd_sc_hd__decap_3
XFILLER_5_3 VPWR VGND VPWR VGND sky130_ef_sc_hd__decap_12
XFILLER_9_65 VGND VGND VPWR VPWR sky130_fd_sc_hd__fill_1
.ends

"}
