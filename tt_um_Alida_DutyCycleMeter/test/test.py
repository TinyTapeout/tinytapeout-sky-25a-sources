# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge, ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 20 ns (50 MHz)
    clock = Clock(dut.clk, 20, units="ns")
    cocotb.start_soon(clock.start())
    
    # Imposta alimentazione (se presenti nei segnali del top)
    if hasattr(dut, "VPWR"):
        dut.VPWR.value = 1
    if hasattr(dut, "VGND"):
        dut.VGND.value = 0

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.sig_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior")


    # Genera segnale PWM: duty ~60ns alto, 40ns basso, periodo 100ns
    for _ in range(10):
        dut.sig_in.value = 1
        await Timer(60, units="ns")
        dut.sig_in.value = 0
        await Timer(40, units="ns")

    # Attesa finale
    await Timer(100, units="ns")
