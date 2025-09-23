# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_pepc(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 0.0005, units="us")
    cocotb.start_soon(clock.start())

    # ui_in[0] == 1: bidirectional outputs enabled, put a counter on both output and bidirectional pins
    dut.ui_in.value = 3    # 8'b00000011
    # MSB priority higher
    dut.uio_in.value = 0   # 3'b000
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)

    dut._log.info("Testing priority encoder with parity checker for MSB higher priority case")
    assert dut.uio_out.value == 2 << 4 | 1 << 3  # 8'b0010 1000
    assert dut.uo_out.value == 91 + 128               # 8'b1 1011011
    await ClockCycles(dut.clk, 1)

    dut._log.info("Testing priority encoder with parity checker for MSB higher priority case")
    dut.ui_in.value = 65    # 8'b01000001
    await ClockCycles(dut.clk, 10)
    assert dut.uio_out.value == 7 << 4 | 1 << 3  # 8'b0111 1000
    assert dut.uo_out.value == 7 + 128                # 8'b1 0000111
    await ClockCycles(dut.clk, 1)

    # LSB priority higher
    dut._log.info("Testing priority encoder with parity checker for LSB higher priority case")
    dut.ui_in.value = 65    # 8'b01000001
    dut.uio_in.value = 2    # 3'b010
    await ClockCycles(dut.clk, 10)
    assert dut.uio_out.value == 1 << 4 | 1 << 3  # 8'b0001 1000
    assert dut.uo_out.value == 6 + 128                 # 8'b1 0000110
    await ClockCycles(dut.clk, 1)

    # LSB priority higher and odd parity flag
    dut._log.info("Testing priority encoder with parity checker for LSB higher priority case")
    dut.ui_in.value = 67    # 8'b01000011
    dut.uio_in.value = 6    # 3'b110
    await ClockCycles(dut.clk, 10)
    assert dut.uio_out.value == 1 << 4 | 1 << 3   # 8'b0001 1000
    assert dut.uo_out.value == 6 + 128                  # 8'b1 0000110
    await ClockCycles(dut.clk, 1)
