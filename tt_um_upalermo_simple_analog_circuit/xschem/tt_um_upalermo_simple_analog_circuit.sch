v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1700 -1250 1720 -1250 {
lab=ui_in[0]}
N 1700 -1530 1720 -1530 {
lab=ui_in[2]}
N 1700 -1390 1720 -1390 {
lab=ui_in[1]}
N 1700 -1670 1720 -1670 {
lab=ui_in[3]}
N 1700 -1810 1720 -1810 {
lab=ui_in[4]}
N 1700 -1950 1720 -1950 {
lab=ui_in[5]}
N 1700 -2090 1720 -2090 {
lab=ui_in[6]}
N 1700 -2230 1720 -2230 {
lab=ui_in[7]}
N 2300 -1250 2320 -1250 {
lab=uio_in[0]}
N 2300 -1390 2320 -1390 {
lab=uio_in[1]}
N 2300 -1530 2320 -1530 {
lab=uio_in[2]}
N 2300 -1670 2320 -1670 {
lab=uio_in[3]}
N 2300 -1810 2320 -1810 {
lab=uio_in[4]}
N 2300 -1950 2320 -1950 {
lab=uio_in[5]}
N 2300 -2090 2320 -2090 {
lab=uio_in[6]}
N 2300 -2230 2320 -2230 {
lab=uio_in[7]}
N 1070 -1960 1100 -1960 {
lab=VDPWR}
N 1070 -1900 1110 -1900 {
lab=VGND}
N 1350 -1780 1380 -1780 {
lab=ua[0]}
N 930 -1780 1000 -1780 {lab=VDPWR}
N 930 -1760 1000 -1760 {lab=VGND}
N 1300 -1780 1350 -1780 {lab=ua[0]}
C {devices/ipin.sym} 1720 -1250 0 1 {name=p1 lab=ui_in[0]}
C {devices/ipin.sym} 1720 -1530 0 1 {name=p2 lab=ui_in[2]}
C {devices/ipin.sym} 1720 -1390 0 1 {name=p3 lab=ui_in[1]}
C {devices/ipin.sym} 1720 -1670 0 1 {name=p4 lab=ui_in[3]}
C {devices/ipin.sym} 1720 -1810 0 1 {name=p5 lab=ui_in[4]}
C {devices/ipin.sym} 1720 -1950 0 1 {name=p6 lab=ui_in[5]}
C {devices/ipin.sym} 1720 -2090 0 1 {name=p7 lab=ui_in[6]}
C {devices/ipin.sym} 1720 -2230 0 1 {name=p8 lab=ui_in[7]}
C {devices/ipin.sym} 2320 -1250 0 1 {name=p9 lab=uio_in[0]}
C {devices/ipin.sym} 2320 -1390 0 1 {name=p10 lab=uio_in[1]}
C {devices/ipin.sym} 2320 -1530 0 1 {name=p11 lab=uio_in[2]}
C {devices/ipin.sym} 2320 -1670 0 1 {name=p12 lab=uio_in[3]}
C {devices/ipin.sym} 2320 -1810 0 1 {name=p13 lab=uio_in[4]}
C {devices/ipin.sym} 2320 -1950 0 1 {name=p14 lab=uio_in[5]}
C {devices/ipin.sym} 2320 -2090 0 1 {name=p15 lab=uio_in[6]}
C {devices/ipin.sym} 2320 -2230 0 1 {name=p16 lab=uio_in[7]}
C {devices/ipin.sym} 1070 -1960 0 0 {name=p17 lab=VDPWR}
C {devices/ipin.sym} 1070 -1900 0 0 {name=p18 lab=VGND}
C {devices/opin.sym} 1380 -1780 0 0 {name=p19 lab=ua[0]}
C {Guido/TTSKY25A-UP-analog-circuit/xschem/currentmirror.sym} 1150 -1770 0 0 {name=x1}
C {lab_wire.sym} 970 -1780 0 0 {name=p20 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 970 -1760 0 0 {name=p21 sig_type=std_logic lab=VGND}
C {title.sym} 1030 -1150 0 0 {name=l1 author="Guido Baitelman"}
