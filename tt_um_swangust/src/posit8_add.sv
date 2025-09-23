
module posit8_add(
    input  wire [7:0] A,
    input  wire [7:0] B,
    output reg  [7:0] SUM
    );


wire [3:0] a_scale, b_scale, c_scale, d_scale;
wire [11:0] a_decoded, b_decoded, c_decoded, d_decoded;
wire d_sign;
wire [7:0] posit_pre_fix;

decode_posit8 A_decode(
    .A( A         ),
    .E( a_scale   ), // [MUX8]
    .F( a_decoded )  // [MUX7, OR5, NAND2]
    );
decode_posit8 B_decode(
    .A( B         ),
    .E( b_scale   ), // [MUX8]
    .F( b_decoded )  // [MUX7, OR5, NAND2]
    );

scale_and_add #(1) sa
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
    .FRAC_OUT ( d_decoded ), // [2sCOMP, MUX1, OR4, MUX1, MUX2, MUX1]
    .S        ( d_sign    )  // []
);

round ro // [ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
(
    .SCALE_IN( d_scale   ),
    .FRAC_IN ( d_decoded ),
    .SIGN    ( d_sign    ),
    
    .POSIT_OUT( posit_pre_fix ) // [ADD6, MUX5, MUX1, MUX4, 2'sCOMP, MUX1]
);


always_comb begin
    if          ((A == 8'b1000_0000) || (B == 8'b1000_0000)) begin
        SUM          = 8'b1000_0000;
    end else if ((A == 8'b0000_0000) || (B == 8'b0000_0000)) begin
        SUM          = B ^ A;
    end else if (d_decoded[9] == 1'b0) begin
        SUM          = 8'b0000_0000;
    end else begin
        SUM          = posit_pre_fix; 
    end
end

endmodule