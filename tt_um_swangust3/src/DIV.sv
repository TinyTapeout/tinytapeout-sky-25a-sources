
module DIV #
    (
        parameter W = 6,
        parameter S = 5
    )(
    input CLK,    // Clock
    input RSTN,      // Asynchronous reset active low
    input [W-1:0]A,  // Input numerator
    input [W-1:0]B,  // Input denominator
    
    output [S:0]C,  // Output quotient
    output REM      // Output remainder
        
);

wire [W-1:0] acc [S];
reg  [W-1:0] b[S];
wire [S-1:0] q[S]; // this is whack and will leave alot of unconnected pins
wire unconnected;

DIV_STAGE #(.W(W), .S(1), .R(0)) div_0 (.CLK(CLK), .RSTN(RSTN), .A_I(A), .B_I(B), .Q_I(1'b0), .Q_O({unconnected, q[0][0:0]}), .A_O(acc[0]), .B_O(b[0]));

generate
    for(genvar SI = 1; SI < S; SI++) begin
        DIV_STAGE #(.W(W+1), .S(SI)) div_n (.CLK(CLK), .RSTN(RSTN), .A_I({acc[SI-1], 1'b0}), .B_I({1'b0, b[SI-1]}), .Q_I(q[SI-1][SI-1:0]), .Q_O(q[SI][SI:0]), .A_O(acc[SI]), .B_O(b[SI]));
    end
endgenerate

wire a_ge_b;
assign a_ge_b = {acc[S-1], 1'b0} >= {1'b0, b[S-1]};

assign C = {q[S-1], a_ge_b};
assign REM = |(acc[S-1]);
endmodule

module DIV_STAGE #
    (
        parameter S = 1,
        parameter W = 10, // accumulator width
        parameter R = 1 // remove one bit
    )(
    input CLK,
    input RSTN,

    input wire [W-1:0] A_I,  // Asynchronous reset active low
    input wire [W-1:0] B_I,  // Asynchronous reset active low
    input wire [S-1:0] Q_I,  // quotient bits

    output reg [W-R-1:0] B_O,  // Asynchronous reset active low
    output reg [    S:0] Q_O,       // quotient bits
    output reg [W-1-R:0] A_O  // Asynchronous reset active low
    
);

wire [W-1:0] sub_val;
wire a_ge_b;

SUB #(.WIDTH(W), .TYPE("RCA")) sub_acc (.A(A_I), .B(B_I), .SUM(sub_val));

assign a_ge_b = A_I >= B_I;

always @(posedge CLK, negedge RSTN) begin // trying to not pipe the, todo maybe parameter to pipe one less bit?
    if(!RSTN) begin
        A_O <= 0;
    end else begin
        A_O <= a_ge_b ? sub_val[W-R-1:0] : A_I[W-R-1:0];
    end
end

always @(posedge CLK, negedge RSTN) begin
    if(!RSTN) begin
        Q_O <= '0;
    end else begin
        Q_O <= {Q_I, a_ge_b};
    end
end

always @(posedge CLK, negedge RSTN) begin // trying to not pipe the 0
    if(!RSTN) begin
        B_O <= '0;
    end else begin 
        B_O <= B_I[W-R-1:0];
    end
end

endmodule