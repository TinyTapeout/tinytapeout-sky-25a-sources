module decoder_p (
    input  wire [2:0] in,   // Input a 3 bit
    output wire [7:0] y_d, n_d   // Output a 8 bit (one-hot)
);

    assign y_d = 1 << in;   // Shift left per selezionare la riga
    assign n_d = ~y_d;
endmodule

