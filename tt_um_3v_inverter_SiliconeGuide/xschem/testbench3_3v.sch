v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1320 -840 2120 -440 {flags=graph
y1=-7.0898975
y2=10.921201
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-3e-08
x2=1.7e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="pin_out
out
in
pin_out_parax"
color="4 5 9 6"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 1320 -440 2120 -40 {flags=graph
y1=-4.5e-06
y2=0.002
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-3e-08
x2=1.7e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="i(vmeas)
i(vmeas1)"
color="9 6"
dataset=-1
unitx=1
logx=0
logy=0
}
N 680 -20 870 -20 {
lab=out}
N 930 -20 970 -20 {
lab=pin_out}
N 970 -20 1070 -20 {
lab=pin_out}
N 680 -170 680 -110 {
lab=VDD}
N 680 -230 680 -170 {lab=VDD}
N 680 -40 740 -40 {lab=VSS}
N 970 -20 970 30 {lab=pin_out}
N 290 -60 380 -60 {
lab=in}
N 670 550 860 550 {
lab=out}
N 920 550 960 550 {
lab=pin_out_parax}
N 960 550 1060 550 {
lab=pin_out_parax}
N 670 400 670 460 {
lab=VDD}
N 670 340 670 400 {lab=VDD}
N 670 530 730 530 {lab=VSS}
N 960 550 960 600 {lab=pin_out_parax}
N 280 510 370 510 {
lab=in}
C {devices/simulator_commands_shown.sym} 890 -740 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.options savecurrents
vin in 0 pulse 0 3.3 10n 1n 1n 50n 100n

.control
save all
tran 100p 200n

write testbench3_3v.raw

.endc

 
"
"}
C {devices/vsource.sym} 10 -560 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/vsource.sym} 80 -560 0 0 {name=V2 value=0 savecurrent=false}
C {devices/lab_wire.sym} 10 -590 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 80 -590 0 0 {name=p2 sig_type=std_logic lab=vss
}
C {devices/gnd.sym} 10 -530 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 80 -530 0 0 {name=l2 lab=GND}
C {devices/code.sym} -300 -390 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/launcher.sym} 710 -680 0 0 {name=h17 
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw tran

"
}
C {devices/launcher.sym} 710 -590 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/testbench.raw tran"
}
C {devices/lab_wire.sym} 680 -230 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 740 -40 2 0 {name=p4 sig_type=std_logic lab=VSS
}
C {devices/gnd.sym} 970 90 0 0 {name=l3 lab=GND}
C {devices/res.sym} 900 -20 1 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 970 60 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_wire.sym} 780 -20 2 0 {name=p6 sig_type=std_logic lab=out
}
C {devices/ammeter.sym} 680 -90 0 0 {name=Vmeas savecurrent=true}
C {devices/opin.sym} 1070 -20 0 0 {name=p13 lab=pin_out
}
C {devices/ipin.sym} 290 -60 0 0 {name=p8 lab=in}
C {devices/lab_wire.sym} 670 340 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 730 530 2 0 {name=p7 sig_type=std_logic lab=VSS
}
C {devices/gnd.sym} 960 660 0 0 {name=l4 lab=GND}
C {devices/res.sym} 890 550 1 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 960 630 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_wire.sym} 770 550 2 0 {name=p9 sig_type=std_logic lab=out
}
C {devices/ammeter.sym} 670 480 0 0 {name=Vmeas1 savecurrent=true}
C {devices/opin.sym} 1060 550 0 0 {name=p10 lab=pin_out_parax

}
C {devices/ipin.sym} 280 510 0 0 {name=p11 lab=in}
