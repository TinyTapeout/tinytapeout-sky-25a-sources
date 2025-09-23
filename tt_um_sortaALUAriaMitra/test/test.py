# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

def pack_inputs(a, b):
    """Combine 4-bit A and B into 8-bit input"""
    return (a << 4) | (b & 0xF)

@cocotb.test()
async def test_sortaALU(dut):
    dut._log.info("Starting ALU Test")

    # Start clock (100kHz = 10us period)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 5)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 1)

    # Helper to run each operation
    async def run_op(a, b, uio_flag, expected):
        dut.ui_in.value = pack_inputs(a, b)
        dut.uio_in.value = uio_flag
        await ClockCycles(dut.clk, 1)
        actual = dut.uo_out.value.integer
        assert actual == expected, (
            f"Failed op with A={a}, B={b}, flag={bin(uio_flag)}. "
            f"Expected: {expected}, Got: {actual}"
        )

    # ADD (bit 7)
    await run_op(3, 4, 0b10000000, (3 + 4) << 4)

    # NEG A (bit 6) → two's complement of A
    await run_op(3, 0, 0b01000000, ((~3 + 1) & 0xF) << 4)

    # NEG B (bit 5)
    await run_op(0, 2, 0b00100000, ((~2 + 1) & 0xF) << 4)

    # SUB A - B (bit 4)
    await run_op(7, 2, 0b00010000, ((7 - 2) & 0xF) << 4)

    # MUL (bit 3)
    await run_op(3, 4, 0b00001000, 3 * 4)

    # AND (bit 2)
    await run_op(0b1100, 0b1010, 0b00000100, (0b1000 << 4))

    # OR (bit 1)
    await run_op(0b1100, 0b1010, 0b00000010, (0b1110 << 4))

    # XOR (bit 0)
    await run_op(0b1100, 0b1010, 0b00000001, (0b0110 << 4))

    dut._log.info("All tests passed!")

