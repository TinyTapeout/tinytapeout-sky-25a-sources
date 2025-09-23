v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 -80 20 -80 {lab=#net1}
N 0 -80 0 -30 {lab=#net1}
N 100 -80 100 -50 {lab=GND}
N 80 -80 100 -80 {lab=GND}
N -0 30 0 60 {lab=GND}
N 50 0 110 0 {lab=Vout}
N -90 0 -90 10 {lab=#net2}
N -90 -0 -40 -0 {lab=#net2}
N -90 70 -90 90 {lab=GND}
C {/foss/designs/analog-circuit-design/sky25a-TIQ_ADC/xschem/INVERTER_SIZES/inverter_p0o5_n44.sym} 0 0 0 0 {name=x1}
C {vsource.sym} 50 -80 3 1 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} 100 -50 0 0 {name=l1 lab=GND}
C {gnd.sym} 0 60 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 110 0 0 0 {name=p1 sig_type=std_logic lab=Vout}
C {vsource.sym} -90 40 0 0 {name=Vin value=3 savecurrent=false}
C {gnd.sym} -90 90 0 0 {name=l3 lab=GND}
C {code_shown.sym} 190 -90 0 0 {name=s1 only_toplevel=false value=
"
.lib /foss/pdks/sky130A/libs.tech/combined/sky130.lib.spice tt

.control
	dc Vin 0 1.8 0.01
	plot v(Vout)
.endc

"}
