`timescale 1ps/1ps


module one_outof_n(
    input clk,
    input wire t0, t1, t2, t3, t4, t5, t6,
    output wire [7:0] a
);

assign a[0] = ~t0;
assign a[1] = t0 & ~t1 & ~t2 & ~t3 & ~t4 & ~t5 & ~t6;
assign a[2] = t0 & t1 & ~t2 & ~t3 & ~t4 & ~t5 & ~t6;
assign a[3] = t0 & t1 & t2 & ~t3 & ~t4 & ~t5 & ~t6;
assign a[4] = t0 & t1 & t2 & t3 & ~t4 & ~t5 & ~t6;
assign a[5] = t0 & t1 & t2 & t3 & t4 & ~t5 & ~t6;
assign a[6] = t0 & t1 & t2 & t3 & t4 & t5 & ~t6;
assign a[7] = t0 & t1 & t2 & t3 & t4 & t5 & t6;

endmodule

module fat_tree(
    input wire [7:0] a,
    output wire o0, o1, o2
);

assign o0 = (a[1] + a[3]) + (a[5] + a[7]);
assign o1 = (a[2] + a[3]) + (a[6] + a[7]);
assign o2 = (a[4] + a[5]) + (a[6] + a[7]);

endmodule

module encoder(
    input wire clk,
    input wire t0, t1, t2, t3, t4, t5, t6,
    output wire o0, o1, o2
);

wire [7:0] a;

one_outof_n one_outof_n_0(
    .clk(clk),
    .t0(t0),
    .t1(t1),
    .t2(t2),
    .t3(t3),
    .t4(t4),
    .t5(t5),
    .t6(t6),
    .a(a)
);

fat_tree fat_tree_0(
    .a(a),
    .o0(o0),
    .o1(o1),
    .o2(o2)
);


endmodule
