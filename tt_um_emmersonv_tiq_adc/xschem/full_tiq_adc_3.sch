v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 -60 150 -60 {lab=#net1}
N 100 -40 150 -40 {lab=#net2}
N 100 -20 150 -20 {lab=#net3}
N 100 0 150 -0 {lab=#net4}
N 100 20 150 20 {lab=#net5}
N 100 40 150 40 {lab=#net6}
N 100 60 150 60 {lab=#net7}
N 130 150 130 190 {lab=VGND}
N -50 110 -50 150 {lab=VGND}
N -50 150 130 150 {lab=VGND}
N 300 90 300 150 {lab=VGND}
N 130 150 300 150 {lab=VGND}
N 120 -180 120 -140 {lab=VDPWR}
N -50 -140 120 -140 {lab=VDPWR}
N -50 -140 -50 -110 {lab=VDPWR}
N 300 -140 300 -110 {lab=VDPWR}
N 120 -140 300 -140 {lab=VDPWR}
N -220 -0 -200 0 {lab=Vin}
N 150 -140 150 -80 {lab=VDPWR}
N 450 -30 480 -30 {lab=o0}
N 450 -10 480 -10 {lab=o1}
N 450 10 480 10 {lab=o2}
C {boosted_tiq_adc_7_xschem.sym} -50 0 0 0 {name=x1}
C {iopin.sym} 130 190 0 0 {name=p1 lab=VGND}
C {iopin.sym} 120 -180 0 0 {name=p2 lab=VDPWR}
C {ipin.sym} -220 0 0 0 {name=p3 lab=Vin}
C {opin.sym} 480 -30 0 0 {name=p4 lab=o0}
C {opin.sym} 480 -10 0 0 {name=p5 lab=o1}
C {opin.sym} 480 10 0 0 {name=p6 lab=o2}
C {encoderr.sym} 300 -10 0 0 {name=x2}
