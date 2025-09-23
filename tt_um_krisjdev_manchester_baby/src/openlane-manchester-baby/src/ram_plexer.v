module ram_plexer(
    inout [31:0] io_bus,
    input rw_switch_i,
    input [31:0] tx_data_i, // from baby
    output [31:0] rx_data_o // to baby
);

    // io bus needs to tristate, as it can be driven by the baby and the world
    // rw_switch_1 = 0 = read bus, 1 = write to bus

    reg [31:0] r_copy_io;

    // keep copy of bus
    always @(*) begin
        if (rw_switch_i == 1'b0) begin
            r_copy_io <= io_bus;
        end
    end

    // tx_data_i is the data from the baby, to send to ram
    // rx_data_o is the data to the baby, from the ram

    assign rx_data_o = r_copy_io;
    assign io_bus = rw_switch_i == 1'b1 ? tx_data_i : 'hz;

endmodule