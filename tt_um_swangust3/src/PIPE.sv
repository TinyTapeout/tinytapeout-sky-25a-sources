
module PIPE #(
    parameter W = 1, // width 
    parameter L = 1 // latency
    )(
    input wire CLK,
    input wire RSTN,

    input  wire [W-1:0] A,
    output wire [W-1:0] B
    );

reg [W-1:0] a_q [L];

always @(posedge CLK, negedge RSTN) begin
    if(!RSTN) begin
        a_q[0] <= '0;
    end else begin
        a_q[0] <= A;
    end
end


generate
    for(genvar L_I = 1; L_I < L; L_I++) begin
        always @(posedge CLK, negedge RSTN) begin
            if(!RSTN) begin
                a_q[L_I] <= '0;
            end else begin
                a_q[L_I] <= a_q[L_I-1];
            end
        end
    end
endgenerate

assign B = a_q[L-1];
endmodule