v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -1730 -620 -1730 -600 {
lab=IN+}
N -1730 -540 -1730 -520 {
lab=#net1}
N -1730 -460 -1730 -440 {
lab=GND}
N -510 10 -510 30 {
lab=out}
N -510 90 -510 130 {
lab=GND}
N -1300 100 -1300 160 {
lab=MINUS}
N -1300 220 -1300 250 {
lab=GND}
N -850 60 -650 60 {
lab=out}
N -920 60 -850 60 {
lab=out}
N -1300 60 -980 60 {
lab=MINUS}
N -1300 60 -1300 100 {
lab=MINUS}
N -650 60 -590 60 {
lab=out}
N -1960 -470 -1960 -440 {
lab=GND}
N -1960 -560 -1960 -530 {
lab=VDD}
N -1830 -470 -1830 -440 {
lab=GND}
N -1830 -560 -1830 -530 {
lab=VSS}
N -690 -420 -660 -420 {
lab=VDD}
N -660 -480 -660 -420 {
lab=VDD}
N -690 -400 -640 -400 {
lab=VSS}
N -640 -400 -610 -400 {
lab=VSS}
N -610 -480 -610 -400 {
lab=VSS}
N -1040 -420 -990 -420 {
lab=MinusP}
N -1080 -400 -990 -400 {
lab=IN+}
N -1040 -50 -990 -50 {
lab=MINUS}
N -1080 -30 -990 -30 {
lab=IN+}
N -690 -50 -660 -50 {
lab=VDD}
N -660 -100 -660 -50 {
lab=VDD}
N -690 -30 -610 -30 {
lab=VSS}
N -610 -100 -610 -30 {
lab=VSS}
N -690 -10 -550 -10 {
lab=out}
N -690 -380 -560 -380 {
lab=out_parax}
N -550 -10 -400 -10 {
lab=out}
N -510 -10 -510 10 {
lab=out}
N -590 -10 -590 60 {
lab=out}
N -510 -320 -510 -300 {
lab=out_parax}
N -510 -240 -510 -200 {
lab=GND}
N -1300 -230 -1300 -170 {
lab=MinusP}
N -1300 -110 -1300 -80 {
lab=GND}
N -850 -270 -650 -270 {
lab=out_parax}
N -920 -270 -850 -270 {
lab=out_parax}
N -1300 -270 -980 -270 {
lab=MinusP}
N -1300 -270 -1300 -230 {
lab=MinusP}
N -650 -270 -590 -270 {
lab=out_parax}
N -510 -340 -510 -320 {
lab=out_parax}
N -560 -380 -390 -380 {
lab=out_parax}
N -510 -380 -510 -340 {
lab=out_parax}
N -590 -380 -590 -330 {
lab=out_parax}
N -590 -330 -590 -280 {
lab=out_parax}
N -590 -280 -590 -270 {
lab=out_parax}
C {devices/simulator_commands_shown.sym} -2410 -370 0 0 {name=COMMANDS1
simulator=ngspice
only_toplevel=false 
value="
.option reltol=1e-5
+  abstol=1e-14 savecurrents
.control
  save all
  op
  remzerovec 
  write OTA_FoldedCascode_Noise1.raw

  set appendwrite
  
  noise v(out) VbiasR1 dec 10 0.5 1e3
  remzerovec
  write OTA_FoldedCascode_Noise1.raw
  setplot noise1
  plot inoise_spectrum

.endc
"}
C {sky130_fd_pr/corner.sym} -2520 -390 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/lab_pin.sym} -1730 -620 0 0 {name=p14 sig_type=std_logic lab=IN+}
C {devices/vsource.sym} -1730 -570 0 0 {name=VbiasR1 value="0 ac 1 0
+ sin(0 10u 50 0 0 0)"}
C {devices/lab_pin.sym} -1730 -440 0 1 {name=p3 sig_type=std_logic lab=GND}
C {devices/vsource.sym} -1730 -490 0 0 {name=V2 value=0.9 savecurrent=false}
C {devices/lab_wire.sym} -510 130 0 0 {name=p30 sig_type=std_logic lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} -510 60 0 0 {name=C3 model=cap_mim_m3_1 W=25 L=20 MF=1 spiceprefix=X}
C {devices/capa.sym} -1300 190 2 1 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -1300 250 0 0 {name=l2 lab=GND}
C {devices/res.sym} -950 60 1 0 {name=R1
value=1G
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -1300 60 2 1 {name=l3 sig_type=std_logic lab=MINUS}
C {devices/launcher.sym} -1870 -230 0 0 {name=h5
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/launcher.sym} -1870 -300 0 0 {name=h6
descr="Netlist & sim" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/vsource.sym} -1960 -500 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/lab_pin.sym} -1960 -440 0 1 {name=p9 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -1960 -560 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -1830 -500 0 0 {name=V3 value=0 savecurrent=false}
C {devices/lab_pin.sym} -1830 -440 0 1 {name=p8 sig_type=std_logic lab=GND
value=0}
C {devices/lab_pin.sym} -1830 -560 0 0 {name=p1 sig_type=std_logic lab=VSS
value=0}
C {OFC.sym} -840 -30 0 0 {name=x1}
C {OFC.sym} -840 -400 0 0 {name=x2 
schematic=OFC_parax.sim
spice_sym_def="tcleval(.include [file normalize ../mag/OFC.sim.spice])"
tclcommand="textwindow [file normalize ../mag/OFC.sim.spice]"}
C {devices/lab_pin.sym} -1080 -400 0 0 {name=p2 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -1080 -30 0 0 {name=p4 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -1040 -420 0 0 {name=p5 sig_type=std_logic lab=MinusP}
C {devices/lab_pin.sym} -1040 -50 0 0 {name=p6 sig_type=std_logic lab=MINUS}
C {devices/lab_pin.sym} -660 -480 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -610 -480 0 0 {name=p12 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} -660 -100 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -610 -100 0 0 {name=p15 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} -390 -380 0 1 {name=p16 sig_type=std_logic lab=out_parax}
C {devices/lab_pin.sym} -400 -10 0 1 {name=p17 sig_type=std_logic lab=out}
C {devices/lab_wire.sym} -510 -200 0 0 {name=p7 sig_type=std_logic lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} -510 -270 0 0 {name=C1 model=cap_mim_m3_1 W=25 L=20 MF=1 spiceprefix=X}
C {devices/capa.sym} -1300 -140 2 1 {name=C4
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} -950 -270 1 0 {name=R2
value=1G
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -1300 -270 2 1 {name=l1 sig_type=std_logic lab=MinusP}
C {devices/gnd.sym} -1300 -80 0 0 {name=l4 lab=GND}
