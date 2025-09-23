v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -830 -380 -830 -350 {
lab=GND}
N -830 -470 -830 -440 {
lab=VDD}
N -830 -160 -830 -140 {
lab=VSS}
N -730 -160 -730 -140 {
lab=VSS}
N -830 -240 -830 -220 {
lab=IN+}
N -730 -240 -730 -220 {
lab=IN-}
N -700 -380 -700 -350 {
lab=GND}
N -700 -470 -700 -440 {
lab=VSS}
N 160 -170 190 -170 {
lab=VDD}
N 190 -230 190 -170 {
lab=VDD}
N 160 -150 210 -150 {
lab=VSS}
N 210 -150 240 -150 {
lab=VSS}
N 240 -230 240 -150 {
lab=VSS}
N -190 -170 -140 -170 {
lab=IN-}
N -230 -150 -140 -150 {
lab=IN+}
N -190 -50 -140 -50 {
lab=IN-}
N -230 -30 -140 -30 {
lab=IN+}
N 160 -50 190 -50 {
lab=VDD}
N 190 -100 190 -50 {
lab=VDD}
N 160 -30 240 -30 {
lab=VSS}
N 240 -100 240 -30 {
lab=VSS}
N 160 -10 300 -10 {
lab=out}
N 160 -130 290 -130 {
lab=out_parax}
C {OFC.sym} 10 -30 0 0 {name=x1}
C {OFC.sym} 10 -150 0 0 {name=x2 
schematic=OFC_parax.sim
spice_sym_def="tcleval(.include [file normalize ../mag/OFC.sim.spice])"
tclcommand="textwindow [file normalize ../mag/OFC.sim.spice]"}
C {devices/simulator_commands_shown.sym} -1310 -590 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands

.options savecurrents

.control
save all
save @m.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
save @m.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]
save @m.xm3.msky130_fd_pr__nfet_01v8_lvt[gm]
save @m.xm4.msky130_fd_pr__nfet_01v8_lvt[gm]
save @m.xm5.msky130_fd_pr__nfet_01v8_lvt[gm]
save @m.xm6.msky130_fd_pr__nfet_01v8_lvt[gm]
save @m.xm7.msky130_fd_pr__pfet_01v8_lvt[gm]
save @m.xm8.msky130_fd_pr__pfet_01v8_lvt[gm]
save @m.xm9.msky130_fd_pr__pfet_01v8_lvt[gm]
save @m.xm10.msky130_fd_pr__pfet_01v8_lvt[gm]

   op
   remzerovec 
   write PLsim.raw
   set appendwrite
   dc Vbias 0.899 0.901 0.00001 
   *dc Vbias 0.899 0.901 0.0001
   *dc Vbias 0 1.8 0.01 
   *remzerovec 
   plot v(out),v(out_parax)
   plot deriv(v(out)),deriv(v(out_parax))
   
   write PLsim.raw

.endc
.end
" }
C {sky130_fd_pr/corner.sym} -1420 -610 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/vsource.sym} -830 -410 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/lab_pin.sym} -830 -350 0 1 {name=p9 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} -830 -470 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -830 -190 0 0 {name=Vbias value=0.9 savecurrent=false}
C {devices/vsource.sym} -730 -190 0 0 {name=VbiasR value=0.9 savecurrent=false}
C {devices/lab_pin.sym} -730 -240 0 0 {name=p13 sig_type=std_logic lab=IN-}
C {devices/lab_pin.sym} -830 -240 0 0 {name=p14 sig_type=std_logic lab=IN+}
C {devices/launcher.sym} -500 -200 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/lab_pin.sym} -830 -140 0 1 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -730 -140 0 1 {name=p12 sig_type=std_logic lab=VSS}
C {devices/launcher.sym} -500 -230 0 0 {name=h3
descr="Netlist & sim" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/vsource.sym} -700 -410 0 0 {name=V2 value=0 savecurrent=false}
C {devices/lab_pin.sym} -700 -350 0 1 {name=p8 sig_type=std_logic lab=GND
value=0}
C {devices/lab_pin.sym} -700 -470 0 0 {name=p18 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} -230 -150 0 0 {name=p1 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -230 -30 0 0 {name=p2 sig_type=std_logic lab=IN+}
C {devices/lab_pin.sym} -190 -170 0 0 {name=p3 sig_type=std_logic lab=IN-}
C {devices/lab_pin.sym} -190 -50 0 0 {name=p4 sig_type=std_logic lab=IN-}
C {devices/lab_pin.sym} 190 -230 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 240 -230 0 0 {name=p6 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} 190 -100 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 240 -100 0 0 {name=p15 sig_type=std_logic lab=VSS
value=0}
C {devices/lab_pin.sym} 290 -130 0 1 {name=p16 sig_type=std_logic lab=out_parax}
C {devices/lab_pin.sym} 300 -10 0 1 {name=p17 sig_type=std_logic lab=out}
