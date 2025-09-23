v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -1570 -1210 -770 -810 {flags=graph
y1=0
y2=2
ypos1=0.06218975
ypos2=2.0621903
divy=5
subdivy=1
unity=1
x1=0
x2=0.00016
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="d0
d1
d2
d3"
color="6 6 6 6"
dataset=-1
unitx=1
logx=0
logy=0
digital=1}
B 2 -2440 -1220 -1640 -820 {flags=graph
y1=0.6
y2=1.9
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.00016
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color=6
node=out}
B 2 -750 -1240 50 -840 {flags=graph

y2=0.00015
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0

divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0

color=4
node=i(vmeas)
y1=-3.6e-08
x2=0.00016
digital=0}
N -1160 -410 -1130 -410 {
lab=#net1}
N -1790 -450 -1460 -450 {
lab=D0}
N -1620 -390 -1460 -390 {
lab=D1}
N -1620 -390 -1620 -280 {
lab=D1}
N -1680 -410 -1460 -410 {
lab=D3}
N -1680 -410 -1680 -340 {
lab=D3}
N -1730 -430 -1460 -430 {
lab=D2}
N -1730 -430 -1730 -390 {
lab=D2}
N -1130 -400 -1130 -340 {
lab=#net1}
N -1130 -280 -1130 -250 {
lab=#net2}
N -1130 -410 -1130 -400 {
lab=#net1}
N -1090 -390 -1090 -360 {
lab=#net3}
N -1160 -390 -1090 -390 {
lab=#net3}
N -1160 -450 -1040 -450 {
lab=#net4}
N -1160 -430 -960 -430 {
lab=#net5}
N -1040 -450 -1040 -250 {
lab=#net4}
N -960 -430 -930 -430 {
lab=#net5}
N -870 -430 -840 -430 {
lab=OUT}
N -950 -430 -950 -400 {
lab=#net5}
C {devices/vsource.sym} -1040 -220 0 0 {name=Vref value=1.8 savecurrent=false}
C {devices/vsource.sym} -1790 -420 0 0 {name=V0 value="PULSE(1.8 0 1n 100p 100p 10u 20u)" savecurrent=false}
C {devices/vsource.sym} -1730 -360 0 0 {name=V1 value="PULSE(1.8 0 1n 100p 100p 40u 80u)" savecurrent=false}
C {devices/vsource.sym} -1680 -310 0 0 {name=V3 value="PULSE(1.8 0 1n 100p 100p 80u 160u)" savecurrent=false}
C {devices/vsource.sym} -1620 -250 0 0 {name=V4 value="PULSE(1.8 0 1n 100p 100p 20u 40u)" savecurrent=false}
C {devices/gnd.sym} -1790 -390 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -1730 -330 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -1620 -220 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} -1040 -190 0 0 {name=l5 lab=GND}
C {devices/opin.sym} -840 -430 0 0 {name=p6 lab=OUT}
C {devices/lab_wire.sym} -1570 -450 0 0 {name=p5 sig_type=std_logic lab=D0}
C {devices/lab_wire.sym} -1540 -430 0 0 {name=p1 sig_type=std_logic lab=D2}
C {devices/lab_wire.sym} -1510 -410 0 0 {name=p2 sig_type=std_logic lab=D3}
C {devices/lab_wire.sym} -1480 -390 0 0 {name=p3 sig_type=std_logic lab=D1}
C {devices/vsource.sym} -1130 -220 0 0 {name=Vref1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -1130 -190 0 0 {name=l6 lab=GND}
C {DAC.sym} -1310 -420 0 0 {name=x1}
C {devices/gnd.sym} -1680 -280 0 0 {name=l3 lab=GND}
C {devices/launcher.sym} -1020 -750 0 0 {name=h1
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/untitled-3.raw tran"
}
C {devices/launcher.sym} -1020 -710 0 0 {name=h3
descr="Netlist & sim" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/simulator_commands_shown.sym} -1990 -750 0 0 {name=COMMANDS1
simulator=ngspice
only_toplevel=false 
value="
.option savecurrents
.control
save all
  op
  remzerovec 
  write untitled-3.raw
  set appendwrite
  tran 2n 160u
  remzerovec 
  write untitled-3.raw
  set appendwrite

.endc
"}
C {devices/launcher.sym} -1020 -670 0 0 {name=h2
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code.sym} -1720 -730 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/ammeter.sym} -1130 -310 2 0 {name=Vmeas savecurrent=true}
C {devices/vsource.sym} -1090 -330 0 0 {name=Vref2 value=0 savecurrent=false}
C {devices/gnd.sym} -1090 -300 0 0 {name=l7 lab=GND}
C {devices/res.sym} -900 -430 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} -950 -370 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -950 -340 0 0 {name=l8 lab=GND}
