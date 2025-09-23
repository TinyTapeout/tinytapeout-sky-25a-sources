`timescale 1ns / 1ps

module decode_posit8(
    input  wire [ 7:0] A, // input posit 
    output reg  [ 3:0] E, // decoded scale,     4 bit signed integer
    output wire        S, // decoded sign, 
    output wire [5:0]  F  // decoded fraction,  <1.5> unsigned fixed point 
    );

    wire [4:0] partial_f;
    assign S = A[7];

    decode_frac df(.A(A[6:0]), .F(partial_f[4:0])); // P=[MUX7]
    decode_reg  dr(.A(A[7:0]), .E(E));      // P=[MUX8]

    assign F[4:0] = S ? (~partial_f)+1 : partial_f;  // P=[MUX7, OR5, NAND2]
    assign F[5] = 1'b1;

endmodule


/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * The following block of code calculates decodes the fraction from the regime. This always
 * block could just be part of decode_posit8, but creating a submodule might be easier
 * for hand P&R.
 * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */ 
module decode_frac (
    input wire [6:0] A,
    output reg [4:0] F
);

    always_comb begin : decode_frac_0
        casez(A[6:0])

            7'b000_0001 : F[4:0] = {        5'd0};
            7'b000_001? : F[4:0] = {A[  0], 4'd0};
            7'b000_01?? : F[4:0] = {A[1:0], 3'd0};
            7'b000_1??? : F[4:0] = {A[2:0], 2'd0};
            7'b001_???? : F[4:0] = {A[3:0], 1'd0};
            7'b01?_???? : F[4:0] = {A[4:0]      };
            7'b10?_???? : F[4:0] = {A[4:0]      };
            7'b110_???? : F[4:0] = {A[3:0], 1'd0};
            7'b111_0??? : F[4:0] = {A[2:0], 2'd0};
            7'b111_10?? : F[4:0] = {A[1:0], 3'd0};
            7'b111_110? : F[4:0] = {A[  0], 4'd0};
            7'b111_1110 : F[4:0] = {        5'd0};
            7'b111_1111 : F[4:0] = {        5'd0};
            default     : F[4:0] =          5'd0;
        endcase
    end
endmodule


/** -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 * The following block of code exponent This always block could just be part of decode_posit8,
 * but creating a submodule might be easier for hand P&R.
 * -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */ 
module decode_reg (
    input wire [7:0] A,
    output reg [3:0] E  
);

    always_comb begin : decode_regime // MUX8
        casez(A[6:0])
            7'b000_0001 : E = A[7] ? (                          4'b0110) : 4'b1010; //    :  6 : -6
            7'b000_001? : E = A[7] ? ( ( (A[  0])) ?  4'b0100 : 4'b0101) : 4'b1011; //  4 :  5 : -5
            7'b000_01?? : E = A[7] ? ( (|(A[1:0])) ?  4'b0011 : 4'b0100) : 4'b1100; //  3 :  4 : -4
            7'b000_1??? : E = A[7] ? ( (|(A[2:0])) ?  4'b0010 : 4'b0011) : 4'b1101; //  2 :  3 : -3
            7'b001_???? : E = A[7] ? ( (|(A[3:0])) ?  4'b0001 : 4'b0010) : 4'b1110; //  1 :  2 : -2
            7'b01?_???? : E = A[7] ? ( (|(A[4:0])) ?  4'b0000 : 4'b0001) : 4'b1111; //  0 :  1 : -1
            7'b10?_???? : E = A[7] ? ( (|(A[4:0])) ?  4'b1111 : 4'b0000) : 4'b0000; // -1 :  0 :  0
            7'b110_???? : E = A[7] ? ( (|(A[3:0])) ?  4'b1110 : 4'b1111) : 4'b0001; // -2 : -1 :  1
            7'b111_0??? : E = A[7] ? ( (|(A[2:0])) ?  4'b1101 : 4'b1110) : 4'b0010; // -3 : -2 :  2
            7'b111_10?? : E = A[7] ? ( (|(A[1:0])) ?  4'b1100 : 4'b1101) : 4'b0011; // -4 : -3 :  3
            7'b111_110? : E = A[7] ? ( ( (A[  0])) ?  4'b1011 : 4'b1100) : 4'b0100; // -5 : -4 :  4
            7'b111_1110 : E = A[7] ? (                          4'b1011) : 4'b0101; //    : -5 :  5
            7'b111_1111 : E = A[7] ? (                          4'b1010) : 4'b0110; //    : -6 :  6
            default     : E =                                              4'b0000;
        endcase
    end

endmodule