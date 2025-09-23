module delay_cell (
    input A,
    output X
);
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16;
    wire w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32;
    wire w33, w34, w35, w36, w37, w38, w39;

    sky130_fd_sc_hd__buf_4 buf1 (.A(A),    .X(w1));
    sky130_fd_sc_hd__buf_4 buf2 (.A(w1),   .X(w2));
    sky130_fd_sc_hd__buf_4 buf3 (.A(w2),   .X(w3));
    sky130_fd_sc_hd__buf_4 buf4 (.A(w3),   .X(w4));
    sky130_fd_sc_hd__buf_4 buf5 (.A(w4),   .X(w5));
    sky130_fd_sc_hd__buf_4 buf6 (.A(w5),   .X(w6));
    sky130_fd_sc_hd__buf_4 buf7 (.A(w6),   .X(w7));
    sky130_fd_sc_hd__buf_4 buf8 (.A(w7),   .X(w8));
    sky130_fd_sc_hd__buf_4 buf9 (.A(w8),   .X(w9));
    sky130_fd_sc_hd__buf_4 buf10(.A(w9),   .X(w10));
    sky130_fd_sc_hd__buf_4 buf11(.A(w10),  .X(w11));
    sky130_fd_sc_hd__buf_4 buf12(.A(w11),  .X(w12));
    sky130_fd_sc_hd__buf_4 buf13(.A(w12),  .X(w13));
    sky130_fd_sc_hd__buf_4 buf14(.A(w13),  .X(w14));
    sky130_fd_sc_hd__buf_4 buf15(.A(w14),  .X(w15));
    sky130_fd_sc_hd__buf_4 buf16(.A(w15),  .X(w16));
    sky130_fd_sc_hd__buf_4 buf17(.A(w16),  .X(w17));
    sky130_fd_sc_hd__buf_4 buf18(.A(w17),  .X(w18));
    sky130_fd_sc_hd__buf_4 buf19(.A(w18),  .X(w19));
    sky130_fd_sc_hd__buf_4 buf20(.A(w19),  .X(w20));
    sky130_fd_sc_hd__buf_4 buf21(.A(w20),  .X(w21));
    sky130_fd_sc_hd__buf_4 buf22(.A(w21),  .X(w22));
    sky130_fd_sc_hd__buf_4 buf23(.A(w22),  .X(w23));
    sky130_fd_sc_hd__buf_4 buf24(.A(w23),  .X(w24));
    sky130_fd_sc_hd__buf_4 buf25(.A(w24),  .X(w25));
    sky130_fd_sc_hd__buf_4 buf26(.A(w25),  .X(w26));
    sky130_fd_sc_hd__buf_4 buf27(.A(w26),  .X(w27));
    sky130_fd_sc_hd__buf_4 buf28(.A(w27),  .X(w28));
    sky130_fd_sc_hd__buf_4 buf29(.A(w28),  .X(w29));
    sky130_fd_sc_hd__buf_4 buf30(.A(w29),  .X(w30));
    sky130_fd_sc_hd__buf_4 buf31(.A(w30),  .X(w31));
    sky130_fd_sc_hd__buf_4 buf32(.A(w31),  .X(w32));
    sky130_fd_sc_hd__buf_4 buf33(.A(w32),  .X(w33));
    sky130_fd_sc_hd__buf_4 buf34(.A(w33),  .X(w34));
    sky130_fd_sc_hd__buf_4 buf35(.A(w34),  .X(w35));
    sky130_fd_sc_hd__buf_4 buf36(.A(w35),  .X(w36));
    sky130_fd_sc_hd__buf_4 buf37(.A(w36),  .X(w37));
    sky130_fd_sc_hd__buf_4 buf38(.A(w37),  .X(w38));
    sky130_fd_sc_hd__buf_4 buf39(.A(w38),  .X(w39));
    sky130_fd_sc_hd__buf_4 buf40(.A(w39),  .X(X));
endmodule