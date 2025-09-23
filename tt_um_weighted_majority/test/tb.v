`default_nettype none
`timescale 1ns / 1ps

/* This testbench instantiates your Weighted Majority Voter design
   and applies a simple input stimulus with reset sequence.
   It dumps waveform for viewing in gtkwave or similar.
*/
module tb ();

    // Dump the signals to a VCD file.
    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);
        #1;
    end

    reg clk;
    reg rst_n;
    reg ena;
    reg [7:0] ui_in;
    reg [7:0] uio_in;  // Must be reg to drive values
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

`ifdef GL_TEST
    wire VPWR = 1'b1;
    wire VGND = 1'b0;
`endif

    // Instantiate your top-level module
    tt_um_weighted_majority dut (
`ifdef GL_TEST
        .VPWR(VPWR),
        .VGND(VGND),
`endif
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe)
    );

    // Assign constant zero to bidirectional inputs as not used
    // uio_in is reg here to allow driven values (could assign 0 constantly)
    initial uio_in = 8'd0;

    // Clock generation: 10 ns period (50 MHz)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 1;
        ena = 1;
        ui_in = 8'b00000000;

        #20 rst_n = 0;  // Assert reset (active low)
        #20 rst_n = 1;  // Release reset

        // Send '0' bits for 4 cycles
        repeat (4) begin
            ui_in[0] = 0;
            #10;
        end

        // Send '1' bits for 5 cycles
        repeat (5) begin
            ui_in[0] = 1;
            #10;
        end

        // Send '0' bits again for 6 cycles
        repeat (6) begin
            ui_in[0] = 0;
            #10;
        end

//        #100 $finish;
    end

    // Optional monitor for debugging:
    // initial begin
    //     $monitor("Time=%0t | ui_in[0]=%b | uo_out[0]=%b", $time, ui_in[0], uo_out[0]);
    // end

endmodule
