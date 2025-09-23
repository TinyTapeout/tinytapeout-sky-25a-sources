# SPDX-FileCopyrightText: © 2024 Your Name
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def trend_detector_test(dut):
    """Cocotb test for Weighted Majority Voter / Trend Detector"""

    dut._log.info("Starting test and clock generation")

    # Use 10 ns clock period (simulate 100 MHz clock)
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())

    # Initialize inputs
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0

    # Reset pulse (active low) for 10 clock cycles
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)  # Wait after reset release

    dut._log.info("Applying input stimulus")

    # Send 0s for 4 cycles
    for _ in range(4):
        dut.ui_in.value = 0
        await ClockCycles(dut.clk, 1)

    # Send 1s for 5 cycles
    for _ in range(5):
        dut.ui_in.value = 1
        await ClockCycles(dut.clk, 1)

    # Send 0s for 6 cycles
    for _ in range(6):
        dut.ui_in.value = 0
        await ClockCycles(dut.clk, 1)

    # Allow some cycles to settle
    await ClockCycles(dut.clk, 5)

    dut._log.info(f"Final output trend: {dut.uo_out.value}")

    # Example assertion — update this to match your expected value at this point
    # For example, after last 0s, trend output should be 0 or 1 depending on hysteresis behavior
    expected_trend = 0  # Set based on your expected final output
    actual_trend = dut.uo_out.value.integer & 0x1  # Assume only bit 0 is valid output
    assert actual_trend == expected_trend, f"Trend output mismatch: expected {expected_trend}, got {actual_trend}"

    dut._log.info("Test completed successfully")
