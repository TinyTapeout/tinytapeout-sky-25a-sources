
module posit8_mul(
    input  wire [7:0] A,
    input  wire [7:0] B,
    output reg  [7:0] PROD
    );


wire [3:0] a_scale, b_scale;
wire [4:0] c_scale, d_scale;
wire [5:0] a_decoded, b_decoded;
wire [11:0] c_decoded;
wire [12:0] d_decoded;
wire a_sign, b_sign, d_sign;
wire [7:0] posit_pre_fix;

decode_posit8 A_decode(
    .A( A         ),
    .E( a_scale   ), // [MUX8]
    .S( a_sign    ),
    .F( a_decoded )  // [MUX7, OR5, NAND2]
    );
decode_posit8 B_decode(
    .A( B         ),
    .E( b_scale   ), // [MUX8]
    .S( b_sign    ),
    .F( b_decoded )  // [MUX7, OR5, NAND2]
    );

scale_and_mul #(1) sa
(
    .SCALE_A( a_scale   ),
    .SCALE_B( b_scale   ),
    .FRAC_A ( a_decoded ),
    .FRAC_B ( b_decoded ),
    .SCALE_C( c_scale   ), // [GT, MUX1]
    .FRAC_C ( c_decoded )  // [SUB4, SHIFT4, ADD12, MUX1]
);

rescale re
(
    .SCALE_IN ( c_scale   ),
    .FRAC_IN  ( c_decoded ),
    .SCALE_OUT( d_scale   ), // [2sCOMP, MUX1, OR4, MUX1, MUX2, ADD4, MUX1]
    .FRAC_OUT ( d_decoded )  // [2sCOMP, MUX1, OR4, MUX1, MUX2, MUX1]
);

round ro // [ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
(
    .SCALE_IN( d_scale   ),
    .FRAC_IN ( d_decoded ),
    .SIGN    ( a_sign ^ b_sign    ),
    
    .POSIT_OUT( posit_pre_fix ) // [ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
);


always_comb begin
    if          ((A == 8'b1000_0000) || (B == 8'b1000_0000)) begin
        PROD         = 8'b1000_0000;
    end else if ((A == 8'b0000_0000) || (B == 8'b0000_0000)) begin
        PROD         = 8'b0000_0000;
    end else begin
        PROD         = posit_pre_fix; 
    end
end

endmodule