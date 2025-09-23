
module posit8_div(
    input  wire        CLK,
    input  wire        RSTN,
    input  wire [7:0] A,
    input  wire [7:0] B,
    output reg  [7:0] QUOT
    );
localparam DIV_STAGES = 11;

wire [3:0] a_scale, b_scale;
wire [4:0] c_scale, d_scale;
wire [5:0] a_decoded, b_decoded;
wire [DIV_STAGES:0] c_decoded;
wire [DIV_STAGES+1:0] d_decoded;
wire a_sign, b_sign, d_sign;
wire [7:0] posit_pre_fix;
wire c_rem;

decode_posit8 A_decode(
    .A( A         ),
    .E( a_scale   ),
    .S( a_sign    ),
    .F( a_decoded )
    );
decode_posit8 B_decode(
    .A( B         ),
    .E( b_scale   ),
    .S( b_sign    ),
    .F( b_decoded )
    );

scale_and_div #(1, DIV_STAGES) sa
(
    .CLK    ( CLK       ),
    .RSTN   ( RSTN      ),
    .SCALE_A( a_scale   ),
    .SCALE_B( b_scale   ),
    .FRAC_A ( a_decoded ),
    .FRAC_B ( b_decoded ),
    .SCALE_C( c_scale   ),
    .FRAC_C ( c_decoded ),
    .REM_C  ( c_rem     )
);

rescale re
(
    .SCALE_IN ( c_scale   ),
    .FRAC_IN  ( c_decoded ),
    .SCALE_OUT( d_scale   ),
    .FRAC_OUT ( d_decoded )
);

PIPE #(.W(1), .L(DIV_STAGES)) pipe_sign (.CLK(CLK), .RSTN(RSTN), .A(a_sign ^ b_sign ), .B(d_sign));

round ro
(
    .SCALE_IN( d_scale   ),
    .FRAC_IN ( d_decoded ),
    .SIGN    ( d_sign    ),
    .REM     ( c_rem     ),
    
    .POSIT_OUT( posit_pre_fix ) // [ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
);

wire [7:0] a_piped;
wire [7:0] b_piped;

PIPE #(.W(8), .L(DIV_STAGES)) pipe_A (.CLK(CLK), .RSTN(RSTN), .A(A), .B(a_piped));
PIPE #(.W(8), .L(DIV_STAGES)) pipe_B (.CLK(CLK), .RSTN(RSTN), .A(B), .B(b_piped));

always_comb begin
    if          ((a_piped == 8'b1000_0000) || (b_piped == 8'b0000_0000) || (b_piped == 8'b1000_0000)) begin
        QUOT               = 8'b1000_0000;
    end else if ((a_piped == 8'b0000_0000) ) begin
        QUOT               = 8'b0000_0000;
    end else begin
        QUOT               = posit_pre_fix; 
    end
end

endmodule