v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {CLOCK FANOUT NETWORK
one inv at mosbius clock pin, and then fanned out, so a clock inv drives each column} -50 780 0 0 0.4 0.4 {}
T {RST asserted/de-asserted midway through test} -730 70 0 0 0.4 0.4 {}
T {Disabled Initially, then Enabled} -570 190 0 0 0.4 0.4 {}
N -250 -130 -250 -100 {
lab=VPWR}
N 80 -230 120 -230 {
lab=VPWR}
N 360 -40 360 -20 {
lab=GND}
N 280 -140 360 -140 {
lab=reg6,reg5,reg4,reg3,reg2,reg1,reg0}
N 360 -140 360 -100 {
lab=reg6,reg5,reg4,reg3,reg2,reg1,reg0}
N -180 -130 -180 -100 {
lab=clk_source}
N 80 -200 120 -200 {
lab=clk_inv}
N 80 -180 120 -180 {
lab=VPWR}
N -180 20 -180 50 {
lab=rstb}
N 80 -160 120 -160 {
lab=rstb}
N -180 150 -180 180 {
lab=ena}
N 80 -140 120 -140 {
lab=ena}
N -170 580 -100 580 {
lab=clk_inv}
N -320 580 -250 580 {
lab=clk_source}
N -100 580 40 580 {
lab=clk_inv}
N 280 -180 490 -180 {
lab=#net1}
N 490 -40 490 -20 {
lab=GND}
N 490 -180 490 -100 {
lab=#net1}
N 160 660 160 680 {
lab=GND}
N 160 580 160 600 {
lab=#net2}
N 120 580 160 580 {
lab=#net2}
N -320 -130 -320 -100 {
lab=VPB}
N -380 -130 -380 -100 {
lab=VNB}
N -440 -130 -440 -100 {
lab=VGND}
N 80 -100 120 -100 {
lab=VGND}
N 80 -250 120 -250 {
lab=VPWR}
N 80 -80 120 -80 {
lab=VGND}
C {devices/vsource.sym} -250 -70 0 0 {name=V2 value=1.8}
C {devices/gnd.sym} -250 -40 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 80 -230 0 0 {name=p2 sig_type=std_logic lab=VPWR}
C {devices/capa.sym} 360 -70 0 0 {name=C1[6:0]
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 360 -20 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -180 -70 0 0 {name=V1 value="PULSE 0 1.8 50n 100p 100p 50n 100n"}
C {devices/gnd.sym} -180 -40 0 0 {name=l9 lab=GND}
C {devices/lab_wire.sym} -250 -130 0 1 {name=p5 sig_type=std_logic lab=VPWR}
C {devices/lab_wire.sym} 300 -140 0 1 {name=p1 sig_type=std_logic lab=reg6,reg5,reg4,reg3,reg2,reg1,reg0}
C {devices/lab_wire.sym} -180 -130 0 1 {name=p3 sig_type=std_logic lab=clk_source}
C {devices/lab_pin.sym} 80 -200 0 0 {name=p6 sig_type=std_logic lab=clk_inv}
C {devices/lab_pin.sym} 80 -180 0 0 {name=p7 sig_type=std_logic lab=VPWR}
C {devices/vsource.sym} -180 80 0 0 {name=V3 value="PULSE 1.8 0 1u 100p 100p 500n 1m"}
C {devices/gnd.sym} -180 110 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} -180 20 0 1 {name=p4 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 80 -160 0 0 {name=p8 sig_type=std_logic lab=rstb}
C {sky130_fd_pr/corner.sym} 660 -270 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/code_shown.sym} 660 -70 0 0 {name=NGSPICE only_toplevel=true value=
"
*****************************************
* Shift Register Test
*****************************************
* holds a logic 1 at the shift reg input, and it propagates down
* the shift register. A asynchronous reset is also asserted.
* a shorter 8-bit shift register is tested for simulation time.
* includes clock fanout network
*****************************************
.control
   save all 
   set temp=27
   tran 100p 3u
   plot v(reg0) v(reg1) v(reg2) v(reg3) v(reg4) v(reg5) v(reg6)
   plot v(rstb) v(ena)
   plot v(clk_source) v(clk_inv)
.endc
"}
C {devices/vsource.sym} -180 210 0 0 {name=V4 value="PULSE 1.8 0 0 100p 100p 200n 2m"}
C {devices/gnd.sym} -180 240 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} -180 150 0 1 {name=p9 sig_type=std_logic lab=ena}
C {devices/lab_pin.sym} 80 -140 0 0 {name=p10 sig_type=std_logic lab=ena}
C {devices/lab_wire.sym} -160 580 0 1 {name=p12 sig_type=std_logic lab=clk_inv}
C {devices/lab_wire.sym} -320 580 0 1 {name=p13 sig_type=std_logic lab=clk_source}
C {devices/capa.sym} 490 -70 0 0 {name=C2
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 490 -20 0 0 {name=l11 lab=GND}
C {sky130_stdcells/clkinv_16.sym} -210 580 0 0 {name=x2 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/clkinv_1.sym} 80 580 0 0 {name=x3 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/capa.sym} 160 630 0 0 {name=C3[24:0]
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 160 680 0 0 {name=l6 lab=GND}
C {devices/code_shown.sym} 700 410 0 0 {name=NGSPICE1 only_toplevel=true format="tcleval( @value )" value=
"
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"}
C {devices/vsource.sym} -320 -70 0 0 {name=V5 value=1.8}
C {devices/gnd.sym} -320 -40 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} -320 -130 0 1 {name=p11 sig_type=std_logic lab=VPB}
C {devices/vsource.sym} -380 -70 0 0 {name=V6 value=0}
C {devices/gnd.sym} -380 -40 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} -380 -130 0 1 {name=p14 sig_type=std_logic lab=VNB}
C {devices/vsource.sym} -440 -70 0 0 {name=V7 value=0}
C {devices/gnd.sym} -440 -40 0 0 {name=l10 lab=GND}
C {devices/lab_wire.sym} -440 -130 0 1 {name=p15 sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} 80 -100 0 0 {name=p16 sig_type=std_logic lab=VGND}
C {devices/lab_pin.sym} 80 -250 0 0 {name=p17 sig_type=std_logic lab=VPWR}
C {devices/lab_pin.sym} 80 -80 0 0 {name=p18 sig_type=std_logic lab=VGND}
C {shift_reg_len7.sym} 200 -180 0 0 {name=x1}
