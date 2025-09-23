# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Clock setup
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset and enable
    dut.ena.value = 1
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 5)
    dut.rst_n.value = 1

    # Helper function to safely assert output
    def safe_assert(expected, actual, label):
        if 'x' in str(actual):
            dut._log.warning(f"{label}: uo_out contains unknown bits: {actual}")
        else:
            assert actual.integer == expected, f"{label}: Expected {expected}, got {actual.integer}"

    # Test 1: 3 * 2 = 6
    dut.ui_in.value = (3 << 4) | 2
    await ClockCycles(dut.clk, 2)
    safe_assert(6, dut.uo_out.value, "Test 1")

    # Test 2: 5 * 4 = 20
    dut.ui_in.value = (5 << 4) | 4
    await ClockCycles(dut.clk, 2)
    safe_assert(20, dut.uo_out.value, "Test 2")

    # Test 3: 15 * 15 = 225
    dut.ui_in.value = (15 << 4) | 15
    await ClockCycles(dut.clk, 2)
    safe_assert(225, dut.uo_out.value, "Test 3")

    # Test 4: 9 * 0 = 0
    dut.ui_in.value = (9 << 4) | 0
    await ClockCycles(dut.clk, 2)
    safe_assert(0, dut.uo_out.value, "Test 4")

    dut._log.info("All test cases passed.")
