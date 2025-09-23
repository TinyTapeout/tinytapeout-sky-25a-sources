# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
import apytypes as apy
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test a fixed-point two-bit divider")

    # Set the input values you want to test
    for a_bits in range(2**4):
        a = apy.APyFixed(a_bits, int_bits=2, frac_bits=2)
        for b_bits in range(1, 2**4):
            b = apy.APyFixed(b_bits, int_bits=2, frac_bits=2)
            input = (a.to_bits() << 4) + b.to_bits()

            print(f"a: {repr(a)} ({str(a)})")
            print(f"b: {repr(b)} ({str(b)})")
            print(f"input: {input} ({hex(input):04})")

            dut.ui_in.value = input
            await ClockCycles(dut.clk, 2)
            assert dut.uo_out.value == (a / b).cast(int_bits=4, frac_bits=4).to_bits()
