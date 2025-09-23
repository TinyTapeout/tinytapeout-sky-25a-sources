`default_nettype none
`timescale 1ns / 1ps

module tt_um_combo_haz(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

     wire data, str, ctrl, branch, fwrd, crct;
     reg pc_freeze, resolved, do_flush;
     assign uio_oe = 8'b0;

     assign data = ui_in[7];
     assign str = ui_in[6];
     assign ctrl = ui_in[5];
     assign branch = ui_in[4];
     assign fwrd = ui_in[3];
     assign crct = ui_in[2];
     
     assign uo_out[4:0] = 5'b0;
     assign uio_out = 8'b0;

     wire _unused = &{ena};

    always @(posedge clk) begin
        if (!rst_n) begin
            pc_freeze <= 1'b0;
            resolved  <= 1'b1;
            do_flush  <= 1'b0;
        end else begin
            // Defaults
            pc_freeze <= 1'b0;
            resolved  <= 1'b1;
            do_flush  <= 1'b0;

            // Priority: Flush > Ctrl > Data > Structural
            if (ctrl && branch && !crct) begin
                // Branch mispredict → flush
                pc_freeze <= 1'b1;
                resolved  <= 1'b0;
                do_flush  <= 1'b1; // pulse
            end
            else if (ctrl) begin
                pc_freeze <= 1'b1;
                resolved  <= 1'b0;
            end
            else if (data && !fwrd) begin
                pc_freeze <= 1'b1;
                resolved  <= 1'b0;
            end
            else if (str) begin
                pc_freeze <= 1'b1;
                resolved  <= 1'b0;
            end
            // else no hazard
        end
    end

assign uo_out[7] = resolved;
assign uo_out[6] = pc_freeze;
assign uo_out[5] = do_flush;
    
endmodule
