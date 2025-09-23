
`default_nettype none

module tt_um_simonsays (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Local Signals

    //Input
    wire reset = ~rst_n | ui_in[4];                             

    //Start Reg
    wire start = ui_in[5]; 
    wire START_REG_OUT;
    wire rst_START_REG; 
    

    //IDLE 
    wire en_IDLE;
    wire rst_IDLE; 
    wire complete_IDLE; 
    
    //LFSR
    wire [7:0] LFSR_SEED = uio_in[7:0];
    wire [7:0] LFSR_out;
    wire complete_LFSR;                              
    wire en_LFSR;
    wire rst_LFSR;
    
    //32bMEM
    wire MEM_LOAD;
    wire [7:0]MEM_IN; // load 8 bits at a time
    wire [1:0]MEM_LOAD_VAL;
    wire rst_MEM;
    wire [31:0]MEM_OUT;

    

    //DISPLAY
    wire en_DISPLAY;
    wire rst_DISPLAY;
    wire complete_DISPLAY;
    wire [31:0] seq_in_DISPLAY;

    

    //WAIT
    wire en_WAIT;
    wire rst_WAIT;
    wire [31:0] seq_out_WAIT;
    wire [1:0] colour_val_WAIT;
    wire colour_in_WAIT;
    wire complete_WAIT;
    
    //CHECK
    wire en_CHECK;
    wire rst_CHECK;
    wire game_complete;
    wire complete_CHECK;
    wire idle_rst_CHECK_OUT;
    wire display_rst_CHECK_OUT;
    wire wait_rst_CHECK_OUT;
    wire check_rst_CHECK_OUT;

    //Counter 
    wire [3:0] counter_out;
    wire [3:0] counter_in;
    wire rst_counter;
    wire counter_load;

    
    //Encoder - output
    wire [1:0] colour_enc_in;
    wire en_colour_enc; 
    wire [3:0] colour_enc_out;

    //Decoder - input
    wire [3:0] colour_dec_in = ui_in[3:0];
    wire [1:0]colour_dec_out;

    // Assignments
    // START
    assign rst_START_REG = ~rst_n;

    //IDLE
    assign en_IDLE = START_REG_OUT & ~complete_IDLE;
    assign rst_IDLE = idle_rst_CHECK_OUT | reset;
    
    //LFSR
    assign rst_LFSR = reset;

    // MEM
    assign rst_MEM = reset;
    
    // DISPLAY
    assign en_DISPLAY = complete_IDLE & ~complete_DISPLAY;
    assign rst_DISPLAY = display_rst_CHECK_OUT | reset;
    
    // WAIT
    assign en_WAIT = complete_DISPLAY & ~complete_WAIT;
    assign rst_WAIT = wait_rst_CHECK_OUT | reset;
    assign colour_val_WAIT = colour_dec_out;
    assign colour_in_WAIT = ui_in[0] | ui_in[1] | ui_in[2] | ui_in[3]; // if any button is pressed
    
    // CHECK
    assign en_CHECK = complete_WAIT & ~complete_CHECK;
    assign rst_CHECK = check_rst_CHECK_OUT | reset;

    // counter
    assign counter_load = complete_CHECK; // dc this logic
    assign rst_counter = reset | game_complete;
    
    start_reg START (
        .clk   (clk),
        .rst   (reset),       
        .start (start),
        .done  (game_complete),
        .out   (START_REG_OUT)
    );

    colour_decoder decoder(
        .ui(ui_in[3:0]),
        .colour_dec_out(colour_dec_out)
    );

    colour_encoder encoder(
        .oe(en_colour_enc),
        .colour_enc_in(colour_enc_in),
        .uo(colour_enc_out) // need enable?
    );

    LFSR lfsr(
        .LFSR_SEED(LFSR_SEED),      // Use the first 7 bits of ui_in as the seed
        .clk(clk),
        .rst(rst_LFSR),                // Active low reset
        .enable(ena),                // Enable signal
        .LFSR_OUT(LFSR_out),     // Output the LFSR value to uio_out[6:0]
        .complete_LFSR(complete_LFSR)   // Indicate completion in the last bit of uio_out
    );

    IDLE_STATE idle(
        .clk(clk),
        .en_IDLE(en_IDLE),
        .rst_IDLE(rst_IDLE),
        .complete_LFSR(complete_LFSR),
        .LFSR_output(LFSR_out), // Use the first 7 bits of LFSR output
        .en_LFSR(en_LFSR),
        .MEM_IN(MEM_IN), // Load the LFSR output into memory
        .MEM_LOAD(MEM_LOAD),
        .complete_IDLE(complete_IDLE),
        .MEM_LOAD_VAL(MEM_LOAD_VAL)
    );

    `ifdef COCOTB_SIM
        reg        tb_mem_load = 1'b0;
        reg [31:0] tb_mem_data = 32'd0;
    `endif

    MEM mem (
        .clk(clk),
        .MEM_LOAD(MEM_LOAD),
        .MEM_IN(MEM_IN),
        .rst_MEM(rst_MEM),
        .MEM_LOAD_VAL(MEM_LOAD_VAL),
        .MEM_OUT(MEM_OUT),

        // -------- test‑bench only ----------
        .test_load(`ifdef COCOTB_SIM tb_mem_load `else 1'b0 `endif),
        .test_data(`ifdef COCOTB_SIM tb_mem_data `else 32'd0 `endif)
    );

    WAIT_STATE wait_state(
        .clk(clk),
        .rst(rst_WAIT),
        .en(en_WAIT),
        .colour_in(colour_in_WAIT),
        .colour_val(colour_val_WAIT),
        .sequence_len(counter_out),
        .complete_wait(complete_WAIT),
        .sequence_val(seq_out_WAIT)
    );

    check_state check_state(
        .clk(clk),
        .rst_check(rst_CHECK),
        .en_check(en_CHECK),
        .seq_in_check(seq_out_WAIT),
        .seq_mem(MEM_OUT),
        .round_ctr_in(counter_out),
        .round_ctr_out(counter_in),
        .complete_check(complete_CHECK),
        .game_complete(game_complete),
        .rst_wait(wait_rst_CHECK_OUT),
        .rst_display(display_rst_CHECK_OUT),
        .rst_idle(idle_rst_CHECK_OUT),
        .rst_check_out(check_rst_CHECK_OUT)
    );

    // display_state display_state(
    //     .clk(clk),
    //     .rst_display(rst_DISPLAY),
    //     .en_display(en_DISPLAY),
    //     .seq_in_display(MEM_OUT),
    //     .round_ctr(counter_out),
    //     .colour_bus(colour_enc_in),
    //     .colour_oe(en_colour_enc),
    //     .complete_display(complete_DISPLAY)
    // );

    `ifdef COCOTB_SIM
    display_state #(
        .HOLD_CYCLES(10)  // shorter delay for simulation
    ) display_state_inst (
    `else
    display_state display_state_inst (
    `endif
        .clk(clk),
        .rst_display(rst_DISPLAY),
        .en_display(en_DISPLAY),
        .seq_in_display(MEM_OUT),
        .round_ctr(counter_out),
        .colour_bus(colour_enc_in),
        .colour_oe(en_colour_enc),
        .complete_display(complete_DISPLAY)
    );


    SEQUENCE_MEM sequence_mem(
        .clk(clk),
        .rst(rst_counter),
        .load(counter_load),
        .data_in(counter_in),
        .data_out(counter_out)
    );


    // State Debug
    // uo[5]uo[4]
    // IDLE: 00
    // DISPLAY: 01
    // WAIT: 10
    // CHECK: 11

    //reg for display output - Use double register + double buffer for timing
    reg [3:0] display_output_reg;
    reg [3:0] display_output_reg2;  // Additional register stage
    
    always @(posedge clk) begin
        if (reset) begin
            display_output_reg <= 4'b0000;
            display_output_reg2 <= 4'b0000;
        end else begin
            display_output_reg <= colour_enc_out;
            display_output_reg2 <= display_output_reg;  // Second register stage
        end
    end

    wire [3:0] display_output_delayed;

    // Parameterized buffer module for timing delay
    parameterized_buffer #(
        .WIDTH(4),
        .BUFFER_STAGES(40)  // Increased from 5 to 8 for more delay
    ) display_buffer (
        .data_in(display_output_reg2),
        .data_out(display_output_delayed)
    );

    assign uo_out[3:0] = display_output_delayed;

    // Internal flip-flops
    reg uo4_ff;
    reg uo5_ff;

    always @(posedge clk) begin
        if (reset) begin
            uo4_ff <= 1'b0;
            uo5_ff <= 1'b0;
        end else begin
            uo4_ff <= en_DISPLAY | en_CHECK;
            uo5_ff <= en_WAIT | en_CHECK;
        end
    end

    // Output registers for proper timing
    reg uo4_out_reg;
    reg uo5_out_reg;

    always @(posedge clk) begin
        if (reset) begin
            uo4_out_reg <= 1'b0;
            uo5_out_reg <= 1'b0;
        end else begin
            uo4_out_reg <= uo4_ff;
            uo5_out_reg <= uo5_ff;
        end
    end

    // --- Parameterized buffers to delay the output ---
    wire uo4_delayed;
    wire uo5_delayed;

    parameterized_buffer #(
        .WIDTH(1),
        .BUFFER_STAGES(40)  // Increased from 3 to 6 for more delay
    ) uo4_buffer (
        .data_in(uo4_out_reg),
        .data_out(uo4_delayed)
    );

    parameterized_buffer #(
        .WIDTH(1),
        .BUFFER_STAGES(40)  // Increased from 3 to 6 for more delay
    ) uo5_buffer (
        .data_in(uo5_out_reg),
        .data_out(uo5_delayed)
    );

    // Assign buffered outputs to pins
    assign uo_out[4] = uo4_delayed;
    assign uo_out[5] = uo5_delayed;



    
    // drive unused ports
    assign uio_out = 8'b0;
    assign uo_out[7:6] = 2'b00;
    assign uio_oe  = 8'b1111_1111; // All uio_out pins are outputs
endmodule