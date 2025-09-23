v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 530 -330 1080 -10 {flags=graph,unlocked


ypos1=0
ypos2=2


unity=1
x1=1.323489e-23





dataset=0
unitx=1
logx=0
logy=0

hilight_wave=-1
rawfile=$netlist_dir/OTA_FoldedCascode_SR.raw
sim_type=tran


color="4 5 6"
node="OUT
out_parax
in+"

y1=0




subdivx=10
subdivy=1
divx=10
divy=20
rainbow=1
y2=1.8
x2=1.6e-06}
N -650 -480 -650 -460 {
lab=#net1}
N -650 -560 -650 -540 {
lab=IN+}
N -650 -400 -650 -380 {
lab=GND}
N -280 -420 -230 -420 {
lab=#net2}
N -320 -400 -230 -400 {
lab=IN+}
N 70 -420 100 -420 {
lab=VDD}
N 100 -470 100 -420 {
lab=VDD}
N 70 -400 150 -400 {
lab=VSS}
N 150 -470 150 -400 {
lab=VSS}
N 70 -380 210 -380 {
lab=OUT}
N 340 -270 340 -230 {
lab=GND}
N -450 -260 -450 -200 {
lab=#net2}
N 0 -300 200 -300 {
lab=OUT}
N -70 -300 0 -300 {
lab=OUT}
N -450 -300 -130 -300 {
lab=#net2}
N -450 -300 -450 -260 {
lab=#net2}
N 200 -300 260 -300 {
lab=OUT}
N 210 -380 410 -380 {
lab=OUT}
N 340 -380 340 -330 {
lab=OUT}
N 260 -380 260 -300 {
lab=OUT}
N -890 -410 -890 -380 {
lab=GND}
N -890 -500 -890 -470 {
lab=VDD}
N -760 -410 -760 -380 {
lab=GND}
N -760 -500 -760 -470 {
lab=VSS}
N -450 -420 -280 -420 {
lab=#net2}
N -450 -420 -450 -310 {
lab=#net2}
N -450 -310 -450 -300 {
lab=#net2}
N -450 -130 -450 -110 {
lab=GND}
N -450 -140 -450 -130 {
lab=GND}
N 80 -900 110 -900 {
lab=VDD}
N 110 -960 110 -900 {
lab=VDD}
N 80 -880 130 -880 {
lab=VSS}
N 130 -880 160 -880 {
lab=VSS}
N 160 -960 160 -880 {
lab=VSS}
N -270 -900 -220 -900 {
lab=#net3}
N -310 -880 -220 -880 {
lab=IN+}
N 80 -860 210 -860 {
lab=out_parax}
N 260 -800 260 -780 {
lab=out_parax}
N 260 -720 260 -680 {
lab=GND}
N -530 -650 -530 -620 {
lab=GND}
N -80 -750 120 -750 {
lab=out_parax}
N -150 -750 -80 -750 {
lab=out_parax}
N -530 -750 -210 -750 {
lab=#net3}
N -530 -750 -530 -710 {
lab=#net3}
N 120 -750 180 -750 {
lab=out_parax}
N 260 -820 260 -800 {
lab=out_parax}
N 210 -860 380 -860 {
lab=out_parax}
N 260 -860 260 -820 {
lab=out_parax}
N 180 -860 180 -810 {
lab=out_parax}
N 180 -810 180 -760 {
lab=out_parax}
N 180 -760 180 -750 {
lab=out_parax}
N -530 -900 -530 -750 {
lab=#net3}
N -530 -900 -270 -900 {
lab=#net3}
C {devices/vsource.sym} -650 -510 0 0 {name=Vbias value="0 PULSE(-0.9 0.9 0 1n 1n 1u 10u)"

}
C {devices/lab_pin.sym} -650 -560 0 0 {name=p14 sig_type=std_logic lab=IN+}
C {devices/launcher.sym} 590 -470 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
value="
.option reltol=1e-5
+  abstol=1e-14 savecurrents
.control
  save all
  op
  remzerovec 
  write OTA_FoldedCascode_SR.raw
  set appendwrite
  tran 100u 10m
  write OTA_FoldedCascode_SR.raw
.endc
"}
C {devices/simulator_commands_shown.sym} -1370 -500 0 0 {name=COMMANDS1
simulator=ngspice
only_toplevel=false 
value="
.option reltol=1e-4
+ abstol=1e-12
+ chgtol=1e-14
+ trtol=7
+ maxord=2
+ savecurrents
.control
  save all
  op
  remzerovec 
  write OTA_FoldedCascode_SR.raw

  set appendwrite

  * Simulazione per 3 cicli (6ms) con tstep = 100ps
  tran 1n 1.6u

  write OTA_FoldedCascode_SR.raw
.endc
"}
C {devices/launcher.sym} 590 -520 0 0 {name=h3
descr="Netlist & sim" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/launcher.sym} 590 -420 0 0 {name=h2 
descr="Load/unload
TRAN waveforms" 
tclcommand="
xschem raw_read $netlist_dir/OTA_FoldedCascode_SR.raw tran
"
}
C {sky130_fd_pr/corner.sym} -1480 -520 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/lab_pin.sym} -650 -380 0 1 {name=p13 sig_type=std_logic lab=GND}
C {devices/vsource.sym} -650 -430 0 0 {name=V2 value=0.9 savecurrent=false}
C {OFC.sym} -80 -400 0 0 {name=x1}
C {devices/lab_pin.sym} -320 -400 0 0 {name=p11 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} 100 -470 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 150 -470 0 0 {name=p16 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} 410 -380 0 1 {name=p17 sig_type=std_logic lab=OUT}
C {devices/lab_wire.sym} 340 -230 0 0 {name=p24 sig_type=std_logic lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 340 -300 0 0 {name=C3 model=cap_mim_m3_1 W=25 L=20 MF=1 spiceprefix=X}
C {devices/capa.sym} -450 -170 2 1 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} -100 -300 1 0 {name=R2
value=1G
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} -890 -440 0 0 {name=V4 value=1.8 savecurrent=false}
C {devices/lab_pin.sym} -890 -380 0 1 {name=p25 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -890 -500 0 0 {name=p26 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -760 -440 0 0 {name=V5 value=0 savecurrent=false}
C {devices/lab_pin.sym} -760 -380 0 1 {name=p27 sig_type=std_logic lab=GND
value=0}
C {devices/lab_pin.sym} -760 -500 0 0 {name=p28 sig_type=std_logic lab=VSS
value=0}
C {devices/gnd.sym} -450 -110 0 0 {name=l1 lab=GND}
C {OFC.sym} -70 -880 0 0 {name=x2 
schematic=OFC_parax.sim
spice_sym_def="tcleval(.include [file normalize ../mag/OFC.sim.spice])"
tclcommand="textwindow [file normalize ../mag/OFC.sim.spice]"}
C {devices/lab_pin.sym} -310 -880 0 0 {name=p2 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} 110 -960 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 160 -960 0 0 {name=p12 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} 380 -860 0 1 {name=p3 sig_type=std_logic lab=out_parax}
C {devices/lab_wire.sym} 260 -680 0 0 {name=p7 sig_type=std_logic lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 260 -750 0 0 {name=C1 model=cap_mim_m3_1 W=25 L=20 MF=1 spiceprefix=X}
C {devices/capa.sym} -530 -680 2 1 {name=C4
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} -180 -750 1 0 {name=R1
value=1G
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} -530 -620 0 0 {name=l4 lab=GND}
