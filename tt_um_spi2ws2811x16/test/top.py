# SPDX-License-Identifier: UNLICENSED

from pathlib import Path
import os
import threading

import cocotb
from cocotb.runner import get_runner
from cocotb.triggers import Timer
from cocotb.triggers import ClockCycles
from cocotb.types import Bit

import math

FREQ = 900000 * 16 
PERIOD_NS = math.ceil(1000000000 / FREQ)

class ClockHandle:
    def __init__(self):
        self.signal = Bit(0)


@cocotb.test()
async def test_top(dut):
    dut._log.info("Start full Test")

    # Set the clock period
    clk_en = threading.Lock()
    class SpiClock:
        def __init__(self, lock):
            self.lock = lock

        async def start(self):
            high_time = Timer(PERIOD_NS/2, units="ns")
            low_time = Timer(PERIOD_NS/2, units="ns")
            while True:
                dut.clk.value = 1
                await high_time
                if self.lock.locked():
                    dut.clk.value = 0
                await low_time

    def set_copi(copi: bool):
        d = dut.ui_in.value.integer
        if copi:
            dut.ui_in.value = d | 0b00000010
        else:
            dut.ui_in.value = d & 0b11111101

    def set_cs(cs: bool):
        d = dut.ui_in.value
        if cs:
            dut.ui_in.value = d | 0b00000001
        else:
            dut.ui_in.value = d & 0b11111110

    def get_out0():
        return (dut.uo_out.value & 1) == 1

    spi_clk = SpiClock(clk_en)
    cocotb.start_soon(spi_clk.start())

    # Initial setup
    dut._log.info("Initial Setup")
    dut.ena.value = 1
    dut.rst_n.value = 0
    dut.clk.value = 1

    dut.ui_in.value = 0
    dut.uio_oe.value = 0
    await Timer(1, units='us')
    dut.rst_n.value = 1
    await Timer(1, units='us')

    # Test 1: Initial state (both inputs 0, should maintain state)
    dut._log.info("Test 1: Enable chip select")
    set_cs(True)
    await Timer(1, units='us')

    # Test 2: Set operation (set=1, reset=0 -> output=1)
    dut._log.info("Test 2: Start SPI frame")
    with clk_en:
        # cmd = 0b00000001
        # for i in range(8):
        #     await ClockCycles(dut.clk, 1, rising=False)
        #     bit  = ((cmd >> (7 - i)) & 1) == 1
        #     set_copi(bit)
        #     await ClockCycles(dut.clk, 1)

        # Test 3: Send the data for the first LED
        dut._log.info("Test 3: Send data for first LED")
        await Timer(PERIOD_NS/2, units='ns')
        for led in [
            [0b11110000, 0b10101010, 0b11001100, 0b00001111],
        ]  * 16 + [[0]]* 8 :
            for byte in led:
                for i in range(8):
                    bit  = ((byte >> (7 - i)) & 1) == 1
                    set_copi(bit)
                    await ClockCycles(dut.clk, 1)
                    

        set_cs(False)

    await Timer(5, units='us')
    dut._log.info("✅ All Set-Reset Gate tests passed!")

if __name__ == "__main__":
    proj_path = Path(__file__).resolve().parent
    src_path = proj_path.parent / "src"

    runner = get_runner("ghdl")
    runner.build(
        sources=[src_path / "spi.vhdl"],
        hdl_toplevel="spi",
        build_args=["--std=08"],
    )
    runner.build(
        sources=[src_path / "ws2811.vhdl"],
        hdl_toplevel="ws2811",
        build_args=["--std=08"],
    )
    runner.build(
        sources=[src_path / "top.vhdl"],
        hdl_toplevel="tt_um_spi2ws2811x16",
        build_args=["--std=08"],
    )

    runner.test(hdl_toplevel="tt_um_spi2ws2811x16", test_module="top,", waves=True, plusargs=["--vcd=tb.vcd"])