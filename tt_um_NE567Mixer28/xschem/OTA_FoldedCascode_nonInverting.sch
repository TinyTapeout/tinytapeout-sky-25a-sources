v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 190 -20 740 230 {flags=graph,unlocked


ypos1=0
ypos2=2

subdivy=1
unity=1



subdivx=8
node="\\"out db20()\\"
\\"out1 db20()\\""
color="4 5"
dataset=0
unitx=1
logx=1
logy=0

sweep=""
rawfile=$netlist_dir/OTA_FoldedCascode_nonInverting.raw
sim_type=ac


y2=99.77778




divx=8

y1=-10.222222

divy=10
x2=8
x1=0}
B 2 740 -610 1290 -290 {flags=graph,unlocked


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
B 2 190 -270 740 -20 {flags=graph,unlocked
rawfile=$netlist_dir/OTA_FoldedCascode_nonInverting.raw
sim_type=ac
y1=-176.66665
y2=223.33335
ypos1=0
ypos2=2

subdivy=1
unity=1



subdivx=8
node="ph(out) 180-
ph(out1) 180-"
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
B 2 190 -610 740 -290 {flags=graph,unlocked


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
N -1200 -20 -1200 0 {
lab=IN+}
N -1200 60 -1200 80 {
lab=#net1}
N -1200 140 -1200 160 {
lab=GND}
N -120 -50 -120 -30 {
lab=out}
N -120 30 -120 70 {
lab=GND}
N -910 100 -910 130 {
lab=IN-}
N -460 0 -260 0 {
lab=out}
N -530 0 -460 0 {
lab=out}
N -910 0 -590 0 {
lab=IN-}
N -260 0 -200 0 {
lab=out}
N -1440 130 -1440 160 {
lab=GND}
N -1440 40 -1440 70 {
lab=VDD}
N -1310 130 -1310 160 {
lab=GND}
N -1310 40 -1310 70 {
lab=VSS}
N -650 -110 -600 -110 {
lab=IN-}
N -690 -90 -600 -90 {
lab=IN+}
N -300 -110 -270 -110 {
lab=VDD}
N -270 -160 -270 -110 {
lab=VDD}
N -300 -90 -220 -90 {
lab=VSS}
N -220 -160 -220 -90 {
lab=VSS}
N -300 -70 -160 -70 {
lab=out}
N -160 -70 -10 -70 {
lab=out}
N -120 -70 -120 -50 {
lab=out}
N -200 -70 -200 0 {
lab=out}
N -910 -110 -650 -110 {
lab=IN-}
N -910 -110 -910 0 {
lab=IN-}
N -910 0 -910 30 {
lab=IN-}
N -910 90 -910 100 {
lab=IN-}
N -910 190 -910 230 {
lab=GND}
N -960 -0 -910 -0 {
lab=IN-}
N -910 30 -910 90 {
lab=IN-}
N -130 440 -130 460 {
lab=out1}
N -130 520 -130 560 {
lab=GND}
N -920 590 -920 620 {
lab=IN-1}
N -470 490 -270 490 {
lab=out1}
N -540 490 -470 490 {
lab=out1}
N -920 490 -600 490 {
lab=IN-1}
N -270 490 -210 490 {
lab=out1}
N -660 380 -610 380 {
lab=IN-1}
N -700 400 -610 400 {
lab=out}
N -310 380 -280 380 {
lab=VDD}
N -280 330 -280 380 {
lab=VDD}
N -310 400 -230 400 {
lab=VSS}
N -230 330 -230 400 {
lab=VSS}
N -310 420 -170 420 {
lab=out1}
N -170 420 -20 420 {
lab=out1}
N -130 420 -130 440 {
lab=out1}
N -210 420 -210 490 {
lab=out1}
N -920 380 -660 380 {
lab=IN-1}
N -920 380 -920 490 {
lab=IN-1}
N -920 490 -920 520 {
lab=IN-1}
N -920 580 -920 590 {
lab=IN-1}
N -920 680 -920 720 {
lab=GND}
N -970 490 -920 490 {
lab=IN-1}
N -920 520 -920 580 {
lab=IN-1}
C {devices/launcher.sym} 910 -90 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/simulator_commands_shown.sym} -1490 -490 0 0 {name=COMMANDS1
simulator=ngspice
only_toplevel=false 
value="
.option reltol=1e-5
+  abstol=1e-14 savecurrents
.control
  save all
  op
  remzerovec 
  write OTA_FoldedCascode_nonInverting.raw

  set appendwrite
  ac dec 10 1 1e9
  remzerovec
  write OTA_FoldedCascode_nonInverting.raw

  tran 10u 20m
  write OTA_FoldedCascode_nonInverting.raw

.endc
"}
C {devices/launcher.sym} 910 -150 0 0 {name=h3
descr="Netlist & sim" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/launcher.sym} 910 20 0 0 {name=h4 
descr="Load/unload
AC waveforms" 
tclcommand="
xschem raw_read $netlist_dir/OTA_FoldedCascode_AC1.raw ac
"
}
C {devices/launcher.sym} 910 -40 0 0 {name=h2 
descr="Load/unload
TRAN waveforms" 
tclcommand="
xschem raw_read $netlist_dir/OTA_FoldedCascode_AC1.raw tran
"
}
C {sky130_fd_pr/corner.sym} -1600 -510 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/lab_pin.sym} -1200 -20 0 0 {name=p14 sig_type=std_logic lab=IN+}
C {devices/vsource.sym} -1200 30 0 0 {name=VbiasR1 value="0 ac 1 0
+ sin(0 100u 50 0 0 0)"}
C {devices/lab_pin.sym} -1200 160 0 1 {name=p3 sig_type=std_logic lab=GND}
C {devices/vsource.sym} -1200 110 0 0 {name=V2 value=0.9 savecurrent=false}
C {devices/lab_wire.sym} -120 70 0 0 {name=p30 sig_type=std_logic lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} -120 0 0 0 {name=C3 model=cap_mim_m3_1 W=25 L=20 MF=1 spiceprefix=X}
C {devices/gnd.sym} -910 230 0 0 {name=l2 lab=GND}
C {devices/res.sym} -560 0 1 0 {name=R1
value=1G
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} -1440 100 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/lab_pin.sym} -1440 160 0 1 {name=p9 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -1440 40 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -1310 100 0 0 {name=V3 value=0 savecurrent=false}
C {devices/lab_pin.sym} -1310 160 0 1 {name=p8 sig_type=std_logic lab=GND
value=0}
C {devices/lab_pin.sym} -1310 40 0 0 {name=p1 sig_type=std_logic lab=VSS
value=0}
C {OFC.sym} -450 -90 0 0 {name=x1}
C {devices/lab_pin.sym} -690 -90 0 0 {name=p4 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -270 -160 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -220 -160 0 0 {name=p15 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} -10 -70 0 1 {name=p17 sig_type=std_logic lab=out}
C {devices/capa.sym} -910 160 0 0 {name=C1
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -960 0 0 0 {name=p2 sig_type=std_logic lab=IN-}
C {devices/lab_wire.sym} -130 560 0 0 {name=p5 sig_type=std_logic lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} -130 490 0 0 {name=C2 model=cap_mim_m3_1 W=25 L=20 MF=1 spiceprefix=X}
C {devices/gnd.sym} -920 720 0 0 {name=l1 lab=GND}
C {devices/res.sym} -570 490 1 0 {name=R2
value=1G
footprint=1206
device=resistor
m=1}
C {OFC.sym} -460 400 0 0 {name=x2}
C {devices/lab_pin.sym} -700 400 0 0 {name=p6 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} -280 330 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -230 330 0 0 {name=p11 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} -20 420 0 1 {name=p12 sig_type=std_logic lab=out1}
C {devices/capa.sym} -920 650 0 0 {name=C4
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -970 490 0 0 {name=p16 sig_type=std_logic lab=IN-1}
