# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
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
    await ClockCycles(dut.clk, 5)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior")

    # SPI shift in all ones, keeping load and enable high
    for _ in range(64):
        dut.ui_in.value = 0b00001110
        await ClockCycles(dut.clk, 1)
        dut.ui_in.value = 0b00001111
        await ClockCycles(dut.clk, 1)

    await ClockCycles(dut.clk, 16)
    dut.ui_in.value = 0b00000111 # enable off, load on
    await ClockCycles(dut.clk, 8)
    dut.ui_in.value = 0b00001111 # enable on, load on
    await ClockCycles(dut.clk, 8)

    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:
    #assert dut.uo_out.value == 50

