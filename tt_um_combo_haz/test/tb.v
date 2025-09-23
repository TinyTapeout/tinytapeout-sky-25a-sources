`default_nettype none
`timescale 1ns / 1ps

module tb ();

  reg clk;
  reg rst_n;
  reg data, str, ctrl, branch, fwrd, crct;

  // Wires to DUT
  wire [7:0] ui_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  reg [7:0] uio_in;
  reg ena;
  wire VPWR = 1'b1;
  wire VGND = 1'b0;

  // Pack individual signals into ui_in (matching your RTL)
  assign ui_in = {data, str, ctrl, branch, fwrd, crct, 1'b0, 1'b0};

  // DUT instantiation
  tt_um_combo_haz user_project (
`ifdef GL_TEST
    .VPWR(VPWR),
    .VGND(VGND),
`endif
    .ui_in  (ui_in),
    .uo_out (uo_out),
    .uio_in (uio_in),
    .uio_out(uio_out),
    .uio_oe (uio_oe),
    .ena    (ena),
    .clk    (clk),
    .rst_n  (rst_n)   // active-low reset
  );

  // Clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns period
  end

  // VCD dump
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
  end
  
initial begin
        ena=1;
        uio_in=8'h00;
        // Start with reset asserted (active-low)
        rst_n = 0;
        data = 0; str  = 0; ctrl = 0; branch = 0; fwrd = 0; crct = 1;
        #20;
        rst_n = 1; // release reset

        // ================ TESTS ================

        // 1) Control hazard resolved CORRECTLY
        #10;
        $display("\n-- Test 1: Control hazard resolved CORRECTLY (no flush) --");
        ctrl = 1; branch = 1; crct = 1; // correct prediction
        #20;
        ctrl = 0; branch = 0; crct = 1;

        // 2) Control hazard MIS-PREDICT (flush)
        #10;
        $display("\n-- Test 2: Control hazard MIS-PREDICT (expect flush) --");
        ctrl = 1; branch = 1; crct = 0; // mispredict => flush
        #20;
        ctrl = 0; branch = 0; crct = 1;

        // 3) Wrong prediction but NO control hazard → no flush
        #10;
        $display("\n-- Test 3: Wrong prediction but no ctrl (should NOT flush) --");
        ctrl = 0; branch = 1; crct = 0; // branch wrong but ctrl=0
        #20;
        branch = 0; crct = 1;

        // 4) Data hazard resolved by forwarding
        #10;
        $display("\n-- Test 4: Data hazard resolved by forwarding (no stall) --");
        data = 1; fwrd = 0;
        #20;
        fwrd = 1; // forwarding now resolves hazard
        #20;
        data = 0;

        // 5) Structural hazard
        #10;
        $display("\n-- Test 5: Structural hazard --");
        str = 1; #20; str = 0;

        // 6) Priority tests
        #10;
        $display("\n-- Test 6A: ctrl + data (ctrl wins) --");
        ctrl = 1; data = 1; fwrd = 0;
        #20;
        ctrl = 0; data = 0;

        #10;
        $display("\n-- Test 6B: ctrl + str (ctrl wins) --");
        ctrl = 1; str = 1;
        #20;
        ctrl = 0; str = 0;

        #10;
        $display("\n-- Test 6C: data + str (data wins) --");
        data = 1; fwrd = 0; str = 1;
        #20;
        data = 0; str = 0;

        // Finish
        #40;
        $display("\nAll tests finished.");
        $finish;
    end

endmodule
