v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -200 -510 -200 -480 {lab=VDPWR}
N -200 -420 -200 -400 {lab=VGND}
N 10 -510 10 -480 {lab=VDPWR}
N 10 -420 10 -400 {lab=VGND}
N 230 -510 230 -480 {lab=VDPWR}
N 230 -420 230 -400 {lab=VGND}
N -150 -450 -30 -450 {lab=#net1}
N 60 -450 190 -450 {lab=#net2}
N 280 -450 470 -450 {lab=out}
N -350 -450 -240 -450 {lab=in}
N -300 -760 -300 -730 {lab=VDPWR}
N -520 -730 -520 -690 {lab=VGND}
N -520 -690 -520 -670 {lab=VGND}
N -300 -730 -300 -670 {lab=VDPWR}
C {lab_wire.sym} -200 -510 0 0 {name=p28 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} -200 -400 0 0 {name=p41 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 10 -510 0 0 {name=p48 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 10 -400 0 0 {name=p55 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 230 -510 0 0 {name=p62 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 230 -400 0 0 {name=p69 sig_type=std_logic lab=VGND}
C {/foss/designs/analog-circuit-design/sky25a-TIQ_ADC/xschem/INVERTER_SIZES/inverter_p1_n0o42.sym} -200 -450 0 0 {name=x8}
C {/foss/designs/analog-circuit-design/sky25a-TIQ_ADC/xschem/INVERTER_SIZES/inverter_p1_n0o42.sym} 10 -450 0 0 {name=x9}
C {/foss/designs/analog-circuit-design/sky25a-TIQ_ADC/xschem/INVERTER_SIZES/inverter_p1_n0o42.sym} 230 -450 0 0 {name=x10}
C {ipin.sym} -350 -450 0 0 {name=p1 lab=in}
C {opin.sym} 470 -450 0 0 {name=p8 lab=out}
C {lab_wire.sym} -520 -730 0 0 {name=p15 sig_type=std_logic lab=VGND}
C {lab_wire.sym} -300 -760 0 0 {name=p17 sig_type=std_logic lab=VDPWR}
C {iopin.sym} -520 -670 0 0 {name=p27 lab=VGND}
C {iopin.sym} -300 -670 0 0 {name=p18 lab=VDPWR}
