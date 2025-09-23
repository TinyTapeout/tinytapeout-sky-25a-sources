v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {adut [clk t0 t1 t2 t3 t4 t5 t6] [o0 o1 o2] null dut
.model dut d_cosim simulation="encoder.so"}
E {}
N -50 -40 -40 -40 {lab=clk}
N -50 -20 -40 -20 {lab=t0}
N -50 -0 -40 -0 {lab=t1}
N -50 20 -40 20 {lab=t2}
N -50 40 -40 40 {lab=t3}
N -50 60 -40 60 {lab=t4}
N -50 80 -40 80 {lab=t5}
N -50 100 -40 100 {lab=t6}
N 30 -0 40 -0 {lab=o0}
N 30 -20 40 -20 {lab=o1}
N 30 -40 40 -40 {lab=d2}
C {ipin.sym} -50 -40 0 0 {name=p1 lab=clk}
C {ipin.sym} -50 -20 0 0 {name=p2 lab=t0}
C {ipin.sym} -50 0 0 0 {name=p3 lab=t1}
C {ipin.sym} -50 20 0 0 {name=p4 lab=t2}
C {ipin.sym} -50 40 0 0 {name=p5 lab=t3}
C {ipin.sym} -50 60 0 0 {name=p6 lab=t4}
C {ipin.sym} -50 80 0 0 {name=p7 lab=t5}
C {ipin.sym} -50 100 0 0 {name=p8 lab=t6}
C {opin.sym} 40 -40 0 0 {name=p9 lab=o2}
C {opin.sym} 40 -20 0 0 {name=p10 lab=o1}
C {opin.sym} 40 0 0 0 {name=p11 lab=o0}
C {noconn.sym} -40 -40 0 1 {name=l1}
C {noconn.sym} -40 -20 0 1 {name=l2}
C {noconn.sym} -40 0 0 1 {name=l3}
C {noconn.sym} -40 20 0 1 {name=l4}
C {noconn.sym} -40 40 0 1 {name=l5}
C {noconn.sym} -40 60 0 1 {name=l6}
C {noconn.sym} -40 80 0 1 {name=l7}
C {noconn.sym} -40 100 0 1 {name=l8}
C {noconn.sym} 30 -40 0 0 {name=l9}
C {noconn.sym} 30 -20 0 0 {name=l10}
C {noconn.sym} 30 0 0 0 {name=l11}
