v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 620 240 620 260 {
lab=GND}
N 620 160 620 180 {
lab=VDD}
N 500 60 560 60 {
lab=GND}
N 540 -100 540 -80 {
lab=#net1}
N 540 -80 560 -80 {
lab=#net1}
N 500 60 500 80 {
lab=GND}
N 550 -60 560 -60 {
lab=#net2}
N 500 -60 550 -60 {
lab=#net2}
N 700 240 700 260 {
lab=GND}
N 700 160 700 180 {
lab=VAA}
N 460 -20 560 -20 {
lab=#net3}
N 460 -100 460 -20 {
lab=#net3}
N 500 20 560 20 {
lab=GND}
N 500 0 500 20 {
lab=GND}
N 540 -160 540 -100 {
lab=#net1}
N 500 -160 500 -60 {
lab=#net2}
N 500 -0 560 -0 {
lab=GND}
N 500 20 500 60 {
lab=GND}
C {factory_test.sym} 710 -10 0 0 {name=x1}
C {devices/gnd.sym} 620 260 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 620 210 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/vdd.sym} 620 160 0 0 {name=l4 lab=VDD}
C {devices/gnd.sym} 500 80 0 0 {name=l5 lab=GND}
C {devices/res.sym} 460 -130 0 1 {name=R3
value=1k
footprint=1206
device=resistor
m=1}
C {devices/vdd.sym} 500 -220 0 0 {name=l6 lab=VDD}
C {devices/code.sym} 440 150 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/simulator_commands_shown.sym} 450 370 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.control
save all
op
.endc
"}
C {devices/ammeter.sym} 460 -190 0 1 {name=Vmeas_bias savecurrent=false}
C {devices/vdd.sym} 540 -220 0 0 {name=l7 lab=VAA}
C {devices/gnd.sym} 700 260 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 700 210 0 0 {name=V2 value=3.3 savecurrent=false}
C {devices/vdd.sym} 700 160 0 0 {name=l9 lab=VAA}
C {devices/vdd.sym} 460 -220 0 0 {name=l10 lab=VAA}
C {devices/ammeter.sym} 500 -190 0 1 {name=Vmeas_vdd savecurrent=false}
C {devices/ammeter.sym} 540 -190 0 1 {name=Vmeas_vaa savecurrent=false}
