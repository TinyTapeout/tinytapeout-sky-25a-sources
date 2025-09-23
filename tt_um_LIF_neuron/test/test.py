# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst.value = 1
    await ClockCycles(dut.clk, 1)
    dut.rst.value = 0

    
    dut._log.info(f"\nset up E_rest")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 197
    dut.uio_in = 255
    
    dut._log.info(f"\nset up E_tau")
    # inital set up
    await ClockCycles(dut.clk, 2)
    dut.ui_in.value = 1
    dut.uio_in = 142
    
    dut._log.info(f"\nset up V_th")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 60
    dut.uio_in = 0

    dut._log.info(f"\nset up V_0")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 1
    dut.uio_in = 1

    dut._log.info(f"\nset up V_1")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 2
    dut.uio_in = 1

    dut._log.info(f"\nset up V_2")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 3
    dut.uio_in = 1

    dut._log.info(f"\nset up V_3")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 4
    dut.uio_in = 1

    dut._log.info(f"\nset up V_4")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 5
    dut.uio_in = 1

    dut._log.info(f"\nset up V_5")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 6
    dut.uio_in = 1

    dut._log.info(f"\nset up V_6")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 7
    dut.uio_in = 1

    dut._log.info(f"\nset up V_7")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 16
    dut.uio_in = 1

    dut._log.info(f"\nset up V_8")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 224
    dut.uio_in = 1

    dut._log.info(f"\nset up I_0")
    # inital set up
    await ClockCycles(dut.clk, 2)
    await RisingEdge(dut.clk)
    dut.ui_in.value = 0
    dut.uio_in = 0

    dut._log.info(f"\nset up I_1")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 8
    dut.uio_in = 0

    dut._log.info(f"\nset up I_2")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 16
    dut.uio_in = 0

    dut._log.info(f"\nset up I_3")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 24
    dut.uio_in = 0

    dut._log.info(f"\nset up I_4")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 32
    dut.uio_in = 0

    dut._log.info(f"\nset up I_5")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 40
    dut.uio_in = 0

    dut._log.info(f"\nset up I_6")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 48
    dut.uio_in = 0

    dut._log.info(f"\nset up I_7")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 56
    dut.uio_in = 0

    dut._log.info(f"\nset up I_6")
    # inital set up
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = 136
    dut.uio_in = 0

    for cycle in range(30):
        await RisingEdge(dut.clk)
        dut.ui_in.value = cycle
        
        # Read outputs
        #uo_out_value = int(dut.uo_out.value)
        dut._log.info(f"\nCycle {cycle}:input:{cycle}")
        #dut._log.info(f"\nCycle {cycle}:output:{uo_out_value}")
 
    dut._log.info("All behavioral checks passed!")
