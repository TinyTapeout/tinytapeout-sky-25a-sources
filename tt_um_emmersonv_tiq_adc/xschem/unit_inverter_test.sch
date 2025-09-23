v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 40 -0 140 0 {lab=Vout}
N -0 -80 0 -30 {lab=#net1}
N -140 0 -140 10 {lab=#net2}
N -140 0 -40 -0 {lab=#net2}
N 0 30 -0 60 {lab=GND}
N 70 -80 70 -60 {lab=GND}
N 60 -80 70 -80 {lab=GND}
N -140 70 -140 90 {lab=GND}
C {vsource.sym} -140 40 0 0 {name=Vin value=3 savecurrent=false}
C {vsource.sym} 30 -80 3 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -140 90 0 0 {name=l1 lab=GND}
C {gnd.sym} 0 60 0 0 {name=l2 lab=GND}
C {gnd.sym} 70 -60 0 0 {name=l3 lab=GND}
C {lab_wire.sym} 130 0 0 0 {name=p1 sig_type=std_logic lab=Vout}
C {code_shown.sym} 210 -40 0 0 {name=s1 only_toplevel=false value=
"
.lib /foss/pdks/sky130A/libs.tech/combined/sky130.lib.spice tt

.control
	dc Vin 0 1.8 0.01
	plot v(Vout)
.endc
"
}
C {/foss/designs/analog-circuit-design/sky25a-TIQ_ADC/xschem/INVERTER_SIZES/inverter_p0o5_n44.sym} 0 0 0 0 {name=x1}
