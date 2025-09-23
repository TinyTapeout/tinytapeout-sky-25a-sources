# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge, FallingEdge
from cocotb.binary import BinaryValue

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start test for capacitive touch module")

    # Set the clock period to 42 ns (~24 MHz)
    clock = Clock(dut.clk, 42, units="ns")
    cocotb.start_soon(clock.start())

    # Reset
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 5)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 5)

    dut._log.info("Wait for initial calibration to complete")

    # Calibration occurs after 10 cycles discharge and rising edge on cap_in
    # Provide early rise time for calibration
    await ClockCycles(dut.clk, 20)
    dut.uio_in.value = BinaryValue("11111111", n_bits=8)  # If uio_in is 8 bits wide  # Early rise time for calibration
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = BinaryValue("00000000", n_bits=8)  # If uio_in is 8 bits wide    await ClockCycles(dut.clk, 5)

    for i in range(5):
        # --- Simulate no touch (short rise time) ---
        dut._log.info("Simulating no touch (fast rise time)")
        await ClockCycles(dut.clk, 15)
        dut.uio_in.value = BinaryValue("11111111", n_bits=8)  # If uio_in is 8 bits wide  # Fast rise after discharge
        await ClockCycles(dut.clk, 1)
        dut.uio_in.value = BinaryValue("00000000", n_bits=8)  # If uio_in is 8 bits wide
        # Wait for debounce to settle
        await ClockCycles(dut.clk, 20)
        assert dut.uo_out[0].value == 0, "Expected no touch (btn = 0)"

        # --- Simulate touch (slow rise time) ---
        dut._log.info("Simulating touch (slow rise time)")
        while dut.uo_out[0].value != 1:
            await ClockCycles(dut.clk, 20)  # Let it discharge again
            await ClockCycles(dut.clk, 20)  # Wait longer before rising
            dut.uio_in.value = BinaryValue("11111111", n_bits=8)  # If uio_in is 8 bits wide  # Slow rise → simulates touch
            await ClockCycles(dut.clk, 1)
            dut.uio_in.value = BinaryValue("00000000", n_bits=8)  # If uio_in is 8 bits wide

        assert dut.uo_out[0].value == 1, "Expected touch (btn = 1)"

        # dut._log.info("Touch detection passed.")

        # --- Simulate no touch (short rise time) ---
        for i in range(10):
            dut._log.info("Simulating no touch (fast rise time)")
            await ClockCycles(dut.clk, 15)
            dut.uio_in.value = BinaryValue("11111111", n_bits=8)  # If uio_in is 8 bits wide  # Fast rise after discharge
            await ClockCycles(dut.clk, 1)
            dut.uio_in.value = BinaryValue("00000000", n_bits=8)  # If uio_in is 8 bits wide

        # Wait for debounce to settle
        await ClockCycles(dut.clk, 20)
        assert dut.uo_out[0].value == 0, "Expected no touch (btn = 0)"
