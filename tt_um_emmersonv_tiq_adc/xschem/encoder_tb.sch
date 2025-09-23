v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 -390 -550 410 -150 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=8.2718061e-25
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="clk
o2
o1
o0"
color="4 6 8 7"
dataset=-1
unitx=1
logx=0
logy=0
}
N -250 150 -250 170 {lab=GND}
N -250 -70 -100 -70 {lab=CLK}
N -250 -50 -250 60 {lab=CLK}
N -250 -50 -100 -50 {lab=CLK}
N -250 150 -100 150 {lab=GND}
N 100 -20 140 -20 {lab=o2}
N 100 0 200 0 {lab=o1}
N 100 20 140 20 {lab=o0}
N 140 -80 200 -80 {lab=o2}
N 140 90 200 90 {lab=o0}
N 300 0 330 0 {lab=GND}
N 260 -80 330 -80 {lab=GND}
N 330 -80 330 -0 {lab=GND}
N 260 90 300 90 {lab=GND}
N 300 0 300 90 {lab=GND}
N -100 -30 -100 150 {lab=GND}
N -250 -70 -250 -50 {lab=CLK}
N -250 120 -250 150 {lab=GND}
N 260 -0 300 0 {lab=GND}
N 140 -80 140 -20 {lab=o2}
N 140 20 140 90 {lab=o0}
C {vsource.sym} -250 90 0 0 {name=V1 value="SIN(0.9 0.9 100MEG)" savecurrent=false}
C {gnd.sym} -250 170 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 140 -20 0 0 {name=p1 sig_type=std_logic lab=o2}
C {lab_wire.sym} 140 0 0 0 {name=p2 sig_type=std_logic lab=o1}
C {lab_wire.sym} 140 20 0 0 {name=p3 sig_type=std_logic lab=o0}
C {code_shown.sym} -730 -140 0 0 {name=s1 only_toplevel=false value=
"
.param vcc=1.8
.control
	save all
	tran 0.1ns 100ns
	write encoder_tb.raw
.endc
"}
C {encoder.sym} 50 50 0 0 {name=ADUT model=dut

xxxdevice_model=".model dut d_cosim simulation=\\"./encoder.so\\""

***Verilator***
device_model=".model dut d_cosim simulation=\\"./encoder.so\\""

tclcommand="edit_file [abs_sym_path encoder.v]"}
C {res.sym} 230 -80 1 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 230 0 1 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 230 90 1 0 {name=R3
value=1k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 330 0 0 0 {name=l2 lab=GND}
C {launcher.sym} -60 190 0 0 {name=h1
descr="Build Verilator object" 
tclcommand="execute 1 sh -c \\"cd $netlist_dir; ngspice vlnggen [abs_sym_path encoder.v]\\""
}
C {launcher.sym} -10 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/encoder_tb.raw tran"
}
C {lab_pin.sym} -250 -70 0 0 {name=p4 sig_type=std_logic lab=CLK}
