v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1710 -2050 1710 -2010 {lab=#net1}
N 1610 -2050 1710 -2050 {lab=#net1}
N 1160 -1810 1160 -1770 {lab=GND}
N 1160 -1920 1160 -1870 {lab=VDD}
N 1610 -2050 1610 -2040 {lab=#net1}
N 1610 -1980 1610 -1960 {lab=#net2}
N 1710 -1950 1710 -1910 {lab=GND}
N 1610 -1960 1610 -1940 {lab=#net2}
N 1560 -1940 1610 -1940 {lab=#net2}
N 1240 -1920 1240 -1880 {lab=GND}
N 1240 -1920 1260 -1920 {lab=GND}
N 1160 -1940 1160 -1920 {lab=VDD}
N 1160 -1940 1260 -1940 {lab=VDD}
C {sky130_fd_pr/corner.sym} 940 -1845 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/code.sym} 940 -2020 0 0 {name=spice
only_toplevel=false
value="
.control
.option savecurrents
dc V2 0 1.8 0.05
save all
plot i(vmeas1)
op
write currentmirror_tb.raw
.endc
.save all
"}
C {vsource.sym} 1710 -1980 0 0 {name=V2 value=1.8 savecurrent=false}
C {vsource.sym} 1160 -1840 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} 1160 -1770 0 0 {name=l3 lab=GND}
C {lab_wire.sym} 1160 -1900 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {ammeter.sym} 1610 -2010 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {gnd.sym} 1710 -1910 0 0 {name=l1 lab=GND}
C {Guido/TTSKY25A-UP-analog-circuit/xschem/currentmirror.sym} 1410 -1930 0 0 {name=x1}
C {gnd.sym} 1240 -1880 0 0 {name=l2 lab=GND}
