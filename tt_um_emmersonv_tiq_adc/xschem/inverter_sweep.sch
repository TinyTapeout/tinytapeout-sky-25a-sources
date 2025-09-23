v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 230 -610 720 -340 {flags=graph
y1=1.4400001
y2=3.24
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-0.13529569
x2=1.6647048
divx=5
subdivx=1
dataset=-1
unitx=1
logx=0
logy=0
rainbow=1
}
N 0 -90 0 -10 {lab=Vout}
N 0 50 0 90 {lab=GND}
N 0 20 0 50 {lab=GND}
N 0 -190 0 -150 {lab=#net1}
N 0 -150 0 -120 {lab=#net1}
N 0 -50 100 -50 {lab=Vout}
N -80 -120 -40 -120 {lab=#net2}
N -80 -120 -80 20 {lab=#net2}
N -80 20 -40 20 {lab=#net2}
N -120 -50 -80 -50 {lab=#net2}
N -190 -50 -120 -50 {lab=#net2}
N -190 10 -190 30 {lab=GND}
N -0 90 0 120 {lab=GND}
N -0 -230 0 -190 {lab=#net1}
N 60 -230 70 -230 {lab=GND}
N 70 -230 70 -210 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -20 20 0 0 {name=M1
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -20 -120 0 0 {name=M2
W=W
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} -190 -20 0 0 {name=Vin value=3 savecurrent=false}
C {vsource.sym} 30 -230 3 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -190 30 0 0 {name=l1 lab=GND}
C {gnd.sym} 0 120 0 0 {name=l2 lab=GND}
C {gnd.sym} 70 -210 0 0 {name=l3 lab=GND}
C {lab_wire.sym} 80 -50 0 0 {name=p1 sig_type=std_logic lab=Vout}
C {devices/simulator_commands_shown.sym} 190 -240 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.lib /foss/pdks/sky130A/libs.tech/combined/sky130.lib.spice tt
.param W=1
.options savecurrents
.dc Vin 0 1.8 0.01
.control
  let start_w = 10
  let stop_w = 25
  let delta_w = 1
  let w_act = start_w
  while w_act le stop_w
    alterparam W = $&w_act
    reset
    save all
    save @m.xm2.msky130_fd_pr__pfet_01v8[W] 
    run
    remzerovec
    write inverter_sweep.raw
    let w_act = w_act + delta_w
    set appendwrite
  end
.endc
"}
