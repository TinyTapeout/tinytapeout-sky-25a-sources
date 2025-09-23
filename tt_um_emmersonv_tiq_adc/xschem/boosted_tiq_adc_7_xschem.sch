v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -20 -70 50 -70 {lab=#net1}
N -20 -50 50 -50 {lab=#net2}
N -20 -30 50 -30 {lab=#net3}
N -20 -10 50 -10 {lab=#net4}
N -20 10 50 10 {lab=#net5}
N -20 30 50 30 {lab=#net6}
N -20 50 50 50 {lab=#net7}
N -220 -10 -180 -10 {lab=Vin}
N 20 -190 20 -160 {lab=VDPWR}
N -100 -160 20 -160 {lab=VDPWR}
N -100 -160 -100 -120 {lab=VDPWR}
N 20 -160 200 -160 {lab=VDPWR}
N 200 -160 200 -110 {lab=VDPWR}
N 20 150 20 180 {lab=VGND}
N -100 150 20 150 {lab=VGND}
N -100 100 -100 150 {lab=VGND}
N 20 150 200 150 {lab=VGND}
N 200 110 200 150 {lab=VGND}
N 350 -70 380 -70 {lab=t0}
N 350 -50 380 -50 {lab=t1}
N 350 -30 380 -30 {lab=t2}
N 350 -10 380 -10 {lab=t3}
N 350 10 380 10 {lab=t4}
N 350 30 380 30 {lab=t5}
N 350 50 380 50 {lab=t6}
C {tiq_adc_7.sym} 10 -10 0 0 {name=x1}
C {iopin.sym} 20 -190 0 0 {name=p1 lab=VDPWR}
C {iopin.sym} 20 180 0 0 {name=p2 lab=VGND}
C {ipin.sym} -220 -10 0 0 {name=p3 lab=Vin}
C {opin.sym} 380 -70 0 0 {name=p4 lab=t0}
C {opin.sym} 380 -50 0 0 {name=p5 lab=t1}
C {opin.sym} 380 -30 0 0 {name=p6 lab=t2}
C {opin.sym} 380 -10 0 0 {name=p7 lab=t3}
C {opin.sym} 380 10 0 0 {name=p8 lab=t4}
C {opin.sym} 380 30 0 0 {name=p9 lab=t5}
C {opin.sym} 380 50 0 0 {name=p10 lab=t6}
C {gain_stage_7.sym} 200 0 0 0 {name=x2}
