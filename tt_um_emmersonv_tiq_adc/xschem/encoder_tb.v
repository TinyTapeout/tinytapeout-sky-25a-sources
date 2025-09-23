`timescale 1ns/1ps
`include "encoder.v"

module encoder_tb;

reg clk, t0, t1, t2, t3, t4, t5, t6;
wire o0, o1, o2;

encoder dut(clk, t0, t1, t2, t3, t4, t5, t6, o0, o1, o2);

initial begin
    
    $dumpfile("encoder_tb.vcd");
    $dumpvars(0, encoder_tb);

    t0=0;
    t1=0;
    t2=0;
    t3=0;
    t4=0;
    t5=0;
    t6=0;
    #10

    t0=1;
    #10;
    t1=1;
    #10;
    t2=1;
    #10;
    t3=1;
    #10;
    t4=1;
    #10;
    t5=1;
    #10;
    t6=1;
    #10;
    


end

endmodule
