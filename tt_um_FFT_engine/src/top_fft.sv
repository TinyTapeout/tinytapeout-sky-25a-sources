module tt_um_FFT_engine (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);
    // Synchronize the external, asynchronous reset to the internal clock domain.
    wire rst_n_buffered;
    delay_cell rst_delay (.A(rst_n), .X(rst_n_buffered));

    logic rst_sync1, rst_sync2;
    wire rst_async = ~rst_n_buffered;
    
    always_ff @(posedge clk or posedge rst_async) begin
        if (rst_async) begin
            rst_sync1 <= 1'b1;
            rst_sync2 <= 1'b1;
        end else begin
            rst_sync1 <= 1'b0;
            rst_sync2 <= rst_sync1;
        end
    end
    
    wire rst_s = rst_sync2;

    // Control signals
    wire load_pulse, output_pulse;
    wire [1:0] addr;
    
    // Individual sample storage
    logic signed [7:0] sample0_real, sample0_imag;
    logic signed [7:0] sample1_real, sample1_imag;
    logic signed [7:0] sample2_real, sample2_imag;
    logic signed [7:0] sample3_real, sample3_imag;
    
    // Individual FFT outputs
    logic signed [7:0] fft0_real, fft0_imag;
    logic signed [7:0] fft1_real, fft1_imag;
    logic signed [7:0] fft2_real, fft2_imag;
    logic signed [7:0] fft3_real, fft3_imag;
    
    // State tracking
    logic processing, done;
    logic processing_dly;
    logic [1:0] output_counter;

    // Pipeline output to avoid hold violations
    logic [7:0] uio_out_next;
    wire [7:0] uo_out_from_display;
    wire [7:0] uio_oe_next;

    io_ctrl io_inst (
        .clk(clk), .rst(rst_s), .ena(ena),
        .ui_in0(ui_in[0]), .ui_in1(ui_in[1]),
        .load_pulse(load_pulse),
        .output_pulse(output_pulse),
        .addr(addr)
    );
    
    memory_ctrl mem_inst (
        .clk(clk), .rst(rst_s), .ena(ena),
        .load_pulse(load_pulse),
        .addr(addr),
        .data_in(uio_in),
        .real0_out(sample0_real), .imag0_out(sample0_imag),
        .real1_out(sample1_real), .imag1_out(sample1_imag),
        .real2_out(sample2_real), .imag2_out(sample2_imag),
        .real3_out(sample3_real), .imag3_out(sample3_imag)
    );
    
    fft_engine fft_inst (
        .clk(clk), .rst(rst_s),
        .in0_real(sample0_real), .in0_imag(sample0_imag),
        .in1_real(sample1_real), .in1_imag(sample1_imag),
        .in2_real(sample2_real), .in2_imag(sample2_imag),
        .in3_real(sample3_real), .in3_imag(sample3_imag),
        .out0_real(fft0_real), .out0_imag(fft0_imag),
        .out1_real(fft1_real), .out1_imag(fft1_imag),
        .out2_real(fft2_real), .out2_imag(fft2_imag),
        .out3_real(fft3_real), .out3_imag(fft3_imag)
    );
    
    display_ctrl disp_inst (
        .sample_counter(addr),
        .output_counter(output_counter),
        .processing(processing), .done(done),
        .seg_out(uo_out_from_display)
    );
    
    assign uio_oe_next = (output_pulse && done) ? 8'hFF : 8'h00;
    
    always_comb begin
        case(output_counter)
            2'd0: uio_out_next = {fft0_real[7:4], fft0_imag[7:4]};
            2'd1: uio_out_next = {fft1_real[7:4], fft1_imag[7:4]};
            2'd2: uio_out_next = {fft2_real[7:4], fft2_imag[7:4]};
            2'd3: uio_out_next = {fft3_real[7:4], fft3_imag[7:4]};
            default: uio_out_next = 8'h00;
        endcase
    end
    
    // State machine logic
    always_ff @(posedge clk or posedge rst_s) begin
        if (rst_s) begin
            processing <= 1'b0;
            done <= 1'b0;
            output_counter <= 2'b00;
            processing_dly <= 1'b0;
        end else if (ena) begin
            processing_dly <= processing;
            if (load_pulse && addr == 2'd3) 
                processing <= '1;
            else if (processing) 
                processing <= '0;
            
            if (processing_dly && !processing)
                done <= '1;
            else if (output_pulse && output_counter == 2'd3)
                done <= '0;
            
            if (output_pulse && done) begin
                output_counter <= (output_counter == 2'd3) ? '0 : output_counter + 1;
            end
        end
    end

    // Buffer FFT sample output
    logic [7:0] uio_out_reg;

    always_ff @(posedge clk or posedge rst_s) begin
        if (rst_s) begin
            uio_out_reg <= 8'h00;
        end else if (ena) begin
            uio_out_reg <= uio_out_next;
        end
    end

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : out_delay_gen
            delay_cell out_delay_inst (
                .A(uio_out_reg[i]),
                .X(uio_out[i])
            );
        end
    endgenerate

    // Buffer 7-seg output
    logic [7:0] uo_out_reg;
    
    always_ff @(posedge clk or posedge rst_s) begin
        if (rst_s) begin
            uo_out_reg <= 8'h00;
        end else if (ena) begin
            uo_out_reg <= uo_out_from_display;
        end
    end

    genvar j;
    generate
        for (j = 0; j < 8; j = j + 1) begin : uo_out_delay_gen
            delay_cell uo_delay_inst (
                .A(uo_out_reg[j]),
                .X(uo_out[j])
            );
        end
    endgenerate

    // Buffer output enable 
    logic [7:0] uio_oe_reg;

    always_ff @(posedge clk or posedge rst_s) begin
        if (rst_s) begin
            uio_oe_reg <= 8'h00;
        end else if (ena) begin
            uio_oe_reg <= uio_oe_next;
        end
    end

    genvar k;
    generate
        for (k = 0; k < 8; k = k + 1) begin : uio_oe_delay_gen
            delay_cell uio_oe_delay_inst (
                .A(uio_oe_reg[k]),
                .X(uio_oe[k])
            );
        end
    endgenerate

endmodule