`timescale 1ns / 1ps
module IZ_RG_22_tb;
    // Inputs
    reg clk;
    reg rst;
    reg [2:0] select;
    reg [4:0] I;
    
    // Outputs
    wire [7:0] V_out;
    wire [7:0] U_out;
    wire spike;
    
    // Instantiate the Unit Under Test (UUT)
    IZ_RG_22 uut (
        .clk(clk),
        .rst(rst),
        .select(select),
        .I(I),
        .V_out(V_out),
        .U_out(U_out),
        .spike(spike)
    );
    
    // Acceso a señales internas mediante jerarquía de nombres
    wire [21:0] dv_term1 = uut.dv_term1;
    wire [21:0] dv_term2 = uut.dv_term2;
    wire [21:0] dv_term3 = uut.dv_term3;
    wire [21:0] dv_term4 = uut.dv_term4;
    wire [21:0] dv_term5 = uut.dv_term5;
    wire [21:0] dv_term6 = uut.dv_term6;
    wire [21:0] dv_term7 = uut.dv_term7;
    wire [21:0] dv_term8 = uut.dv_term8;
    wire [21:0] du_term1 = uut.du_term1;
    wire [21:0] du_term2 = uut.du_term2;
    wire [21:0] du_term3 = uut.du_term3;
    wire [21:0] du_term4 = uut.du_term4;
    wire [21:0] dv = uut.dv;
    wire [21:0] du = uut.du;
    wire [21:0] U = uut.U;
    wire [21:0] V = uut.V;
    wire [21:0] a = uut.a;
    wire [21:0] b = uut.b;
    wire [21:0] c = uut.c;
    wire [21:0] d = uut.d;
    
    // Clock generation
    initial begin
        clk = 0;
        forever #16 clk = ~clk; // 32ns period (31.25MHz)
    end
    
    // File descriptor for CSV output
    integer csv_file;
    
    // Stimulus and CSV generation
    initial begin
        // Initialize Inputs
        rst = 1;
        select = 3'b000; // Regular Spiking neuron
        I = 5'b00010;
        
        // Open CSV file
        csv_file = $fopen("IZ_RG_DATA_22.csv", "w");
        
        // Write CSV header - Fixed: all in one line
        $fwrite(csv_file, "Time(ns),clk,rst,select,");
        $fwrite(csv_file, "I,V,U,spike,");
        $fwrite(csv_file, "a,b,c,d,");
        $fwrite(csv_file, "dv_term1,dv_term2,dv_term3,dv_term4,");
        $fwrite(csv_file, "dv_term5,dv_term6,dv_term7,dv_term8,");
        $fwrite(csv_file, "du_term1,du_term2,du_term3,du_term4,");
        $fwrite(csv_file, "dv,du,V_out,U_out\n");
        
        #20;
        rst = 0;
        
        // Run for different select values
        #1600000;
        rst = 1;
        select = 3'b001;
        #80000;
        rst = 0;
        #1600000;

        rst = 1;
        select = 3'b010;
        #80000;
        rst = 0;
        #1600000;

        rst = 1;
        select = 3'b011;
        #80000;
        rst = 0;
        #1600000;

        rst = 1;
        select = 3'b100;
        #80000;
        rst = 0;
        #1600000;

        rst = 1;
        select = 3'b101;
        #80000;
        rst = 0;
        #1600000;

        rst = 1;
        select = 3'b110;
        #80000;
        rst = 0;
        #1600000;

        rst = 1;
        select = 3'b111;
        #80000;
        rst = 0;
        #1600000;

        // Close file and finish simulation
        $fclose(csv_file);
        $display("Simulation complete. Results saved to IZ_RG_DATA.csv");
        $finish;
    end
    
    // Write data to CSV on every positive clock edge only
    always @(posedge clk) begin
        // Write all data in one line - Fixed: combined V_out and U_out in the same line
        $fwrite(csv_file, "%0d,%b,%b,%b,", $time, clk, rst, select);
        $fwrite(csv_file, "%h,%h,%h,%b,", I, V, U, spike);
        $fwrite(csv_file, "%h,%h,%h,%h,", a, b, c, d);
        $fwrite(csv_file, "%h,%h,%h,%h,", dv_term1, dv_term2, dv_term3, dv_term4);
        $fwrite(csv_file, "%h,%h,%h,%h,", dv_term5, dv_term6, dv_term7, dv_term8);
        $fwrite(csv_file, "%h,%h,%h,%h,", du_term1, du_term2, du_term3, du_term4);
        $fwrite(csv_file, "%h,%h,%h,%h\n", dv, du, V_out, U_out);
    end
    
    // Generar archivo VCD para visualización en GTKWave
    initial begin
        $dumpfile("IZ_RG_22_tb.vcd");
        $dumpvars(0, IZ_RG_22_tb);
    end
endmodule