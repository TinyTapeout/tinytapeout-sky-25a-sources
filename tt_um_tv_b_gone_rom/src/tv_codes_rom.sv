/*
 * Copyright (c) 2025 SemiQa
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tv_codes_rom
#(
    parameter SIZE = 4740,      // EU -> 4740, NA -> 5320
    parameter DATA_WIDTH = 8,
    parameter INIT_FILE = "../rom/eu_tv_codes_rom.mif",
    localparam ADDRESS_BITS = $clog2(SIZE)
)
(
    input bit [ADDRESS_BITS-1:0] address,
    output bit [DATA_WIDTH-1:0] data,
    output bit address_overflow
);
	wire [7:0] data_32k;
	wire [7:0] data_4k0;
	wire [7:0] data_4k1;

	assign address_overflow = (address >= SIZE);

	rom_tvbgone_32k rom32k_I (
			.addr (address[11:0]),
			.q    (data_32k)
	);

	rom_tvbgone_4k0 rom4k0_I (
			.addr (address[8:0]),
			.q    (data_4k0)
	);

	rom_tvbgone_4k1 rom4k1_I (
			.addr (address[8:0]),
			.q    (data_4k1)
	);

	assign data = address[12] ? (address[9] ? data_4k1 : data_4k0) : data_32k;

endmodule
