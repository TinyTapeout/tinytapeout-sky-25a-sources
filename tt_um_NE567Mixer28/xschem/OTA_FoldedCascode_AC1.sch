v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 280 -250 830 0 {flags=graph,unlocked


ypos1=0
ypos2=2

subdivy=1
unity=1



subdivx=8
node="\\"out db20()\\"
\\"out_parax db20()\\""
color="4 5"
dataset=0
unitx=1
logx=1
logy=0

sweep=""
rawfile=$netlist_dir/OTA_FoldedCascode_AC1.raw
sim_type=ac


y2=90




divx=8

y1=-20

divy=10
x2=8
x1=0}
B 2 830 -840 1380 -520 {flags=graph,unlocked


ypos1=0
ypos2=2

subdivy=1
unity=1
x1=0





dataset=0
unitx=1
logx=0
logy=0
divx=5
hilight_wave=-1
rawfile=$netlist_dir/OTA_FoldedCascode_AC1.raw
sim_type=tran
subdivx=3

color="4 5"
node="OUT
OUT_parax"

y1=0.87
x2=0.02


divy=10
y2=0.93}
B 2 280 -500 830 -250 {flags=graph,unlocked
rawfile=$netlist_dir/OTA_FoldedCascode_AC1.raw
sim_type=ac
y1=-176.66665
y2=223.33335
ypos1=0
ypos2=2

subdivy=1
unity=1



subdivx=8
node="ph(out) 180-
ph(out_parax) 180-"
color="4 4 5 5"
dataset=0
unitx=1
logx=1
logy=0
divx=8
sweep=""

x1=0

x2=8
divy=20}
B 2 280 -840 830 -520 {flags=graph,unlocked


ypos1=0
ypos2=2
divy=10
subdivy=1
unity=1
x1=0





dataset=0
unitx=1
logx=0
logy=0
divx=5
hilight_wave=-1
rawfile=$netlist_dir/OTA_FoldedCascode_AC1.raw
sim_type=tran
subdivx=3





x2=0.02




color=6
node=in+

y1=0.8998
y2=0.9002}
N -1110 -250 -1110 -230 {
lab=IN+}
N -1110 -170 -1110 -150 {
lab=#net1}
N -1110 -90 -1110 -70 {
lab=GND}
N -30 -280 -30 -260 {
lab=out}
N -30 -200 -30 -160 {
lab=GND}
N -820 -190 -820 -130 {
lab=#net2}
N -820 -70 -820 -40 {
lab=GND}
N -370 -230 -170 -230 {
lab=out}
N -440 -230 -370 -230 {
lab=out}
N -820 -230 -500 -230 {
lab=#net2}
N -820 -230 -820 -190 {
lab=#net2}
N -170 -230 -110 -230 {
lab=out}
N -1350 -100 -1350 -70 {
lab=GND}
N -1350 -190 -1350 -160 {
lab=VDD}
N -1220 -100 -1220 -70 {
lab=GND}
N -1220 -190 -1220 -160 {
lab=VSS}
N -210 -710 -180 -710 {
lab=VDD}
N -180 -770 -180 -710 {
lab=VDD}
N -210 -690 -160 -690 {
lab=VSS}
N -160 -690 -130 -690 {
lab=VSS}
N -130 -770 -130 -690 {
lab=VSS}
N -560 -710 -510 -710 {
lab=#net3}
N -600 -690 -510 -690 {
lab=IN+}
N -560 -340 -510 -340 {
lab=#net2}
N -600 -320 -510 -320 {
lab=IN+}
N -210 -340 -180 -340 {
lab=VDD}
N -180 -390 -180 -340 {
lab=VDD}
N -210 -320 -130 -320 {
lab=VSS}
N -130 -390 -130 -320 {
lab=VSS}
N -210 -300 -70 -300 {
lab=out}
N -210 -670 -80 -670 {
lab=out_parax}
N -70 -300 80 -300 {
lab=out}
N -30 -300 -30 -280 {
lab=out}
N -110 -300 -110 -230 {
lab=out}
N -30 -610 -30 -590 {
lab=out_parax}
N -30 -530 -30 -490 {
lab=GND}
N -820 -460 -820 -430 {
lab=GND}
N -370 -560 -170 -560 {
lab=out_parax}
N -440 -560 -370 -560 {
lab=out_parax}
N -820 -560 -500 -560 {
lab=#net3}
N -820 -560 -820 -520 {
lab=#net3}
N -170 -560 -110 -560 {
lab=out_parax}
N -30 -630 -30 -610 {
lab=out_parax}
N -80 -670 90 -670 {
lab=out_parax}
N -30 -670 -30 -630 {
lab=out_parax}
N -110 -670 -110 -620 {
lab=out_parax}
N -110 -620 -110 -570 {
lab=out_parax}
N -110 -570 -110 -560 {
lab=out_parax}
N -820 -710 -820 -560 {
lab=#net3}
N -820 -710 -560 -710 {
lab=#net3}
N -820 -340 -560 -340 {
lab=#net2}
N -820 -340 -820 -230 {
lab=#net2}
C {devices/launcher.sym} 1000 -320 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/simulator_commands_shown.sym} -1400 -720 0 0 {name=COMMANDS1
simulator=ngspice
only_toplevel=false 
value="
.option reltol=1e-5
+  abstol=1e-14 savecurrents
.control
  save all
  op
  remzerovec 
  write OTA_FoldedCascode_AC1.raw

  set appendwrite
  ac dec 10 1 1e9
  remzerovec
  write OTA_FoldedCascode_AC1.raw

  tran 10u 20m
  write OTA_FoldedCascode_AC1.raw

.endc
"}
C {devices/launcher.sym} 1000 -380 0 0 {name=h3
descr="Netlist & sim" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/launcher.sym} 1000 -210 0 0 {name=h4 
descr="Load/unload
AC waveforms" 
tclcommand="
xschem raw_read $netlist_dir/OTA_FoldedCascode_AC1.raw ac
"
}
C {devices/launcher.sym} 1000 -270 0 0 {name=h2 
descr="Load/unload
TRAN waveforms" 
tclcommand="
xschem raw_read $netlist_dir/OTA_FoldedCascode_AC1.raw tran
"
}
C {sky130_fd_pr/corner.sym} -1510 -740 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/lab_pin.sym} -1110 -250 0 0 {name=p14 sig_type=std_logic lab=IN+}
C {devices/vsource.sym} -1110 -200 0 0 {name=VbiasR1 value="0 ac 1 0
+ sin(0 100u 50 0 0 0)"}
C {devices/lab_pin.sym} -1110 -70 0 1 {name=p3 sig_type=std_logic lab=GND}
C {devices/vsource.sym} -1110 -120 0 0 {name=V2 value=0.9 savecurrent=false}
C {devices/lab_wire.sym} -30 -160 0 0 {name=p30 sig_type=std_logic lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} -30 -230 0 0 {name=C3 model=cap_mim_m3_1 W=25 L=20 MF=1 spiceprefix=X}
C {devices/capa.sym} -820 -100 2 1 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -820 -40 0 0 {name=l2 lab=GND}
C {devices/res.sym} -470 -230 1 0 {name=R1
value=1G
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} -1350 -130 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/lab_pin.sym} -1350 -70 0 1 {name=p9 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -1350 -190 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -1220 -130 0 0 {name=V3 value=0 savecurrent=false}
C {devices/lab_pin.sym} -1220 -70 0 1 {name=p8 sig_type=std_logic lab=GND
value=0}
C {devices/lab_pin.sym} -1220 -190 0 0 {name=p1 sig_type=std_logic lab=VSS
value=0}
C {OFC.sym} -360 -320 0 0 {name=x1}
C {OFC.sym} -360 -690 0 0 {name=x2 
schematic=OFC_parax.sim
spice_sym_def="tcleval(.include [file normalize ../mag/OFC.sim.spice])"
tclcommand="textwindow [file normalize ../mag/OFC.sim.spice]"}
C {devices/lab_pin.sym} -600 -690 0 0 {name=p2 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -600 -320 0 0 {name=p4 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -180 -770 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -130 -770 0 0 {name=p12 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} -180 -390 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -130 -390 0 0 {name=p15 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} 90 -670 0 1 {name=p16 sig_type=std_logic lab=out_parax}
C {devices/lab_pin.sym} 80 -300 0 1 {name=p17 sig_type=std_logic lab=out}
C {devices/lab_wire.sym} -30 -490 0 0 {name=p7 sig_type=std_logic lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} -30 -560 0 0 {name=C1 model=cap_mim_m3_1 W=25 L=20 MF=1 spiceprefix=X}
C {devices/capa.sym} -820 -490 2 1 {name=C4
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} -470 -560 1 0 {name=R2
value=1G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} -820 -430 0 0 {name=l4 lab=GND}
