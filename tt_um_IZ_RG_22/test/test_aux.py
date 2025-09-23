# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 32, units="ns")
    cocotb.start_soon(clock.start())
    
    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    
    dut.uio_in.value = 0
    dut.rst_n.value = 1
    

    for i_I_cor in range(32):
        I_cor = f'{i_I_cor:05b}'
        # print(f'{i_I_cor} -> {I_cor}')

        select="000"
        
        
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        
        
        await ClockCycles(dut.clk, 2)
        dut.rst_n.value = 0
        dut._log.info("Test project behavior")
        await ClockCycles(dut.clk, int(1600000/32))
        
        dut.rst_n.value = 1
        select="001"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(80000/32))
        dut.rst_n.value = 0
        await ClockCycles(dut.clk, int(1600000/32))
        
        dut.rst_n.value = 1
        select="010"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(80000/32))
        dut.rst_n.value = 0
        # Set the input values you want to test
        await ClockCycles(dut.clk, int(1600000/32))
        
        dut.rst_n.value = 1
        select="011"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(80000/32))
        dut.rst_n.value = 0
        await ClockCycles(dut.clk, int(1600000/32))
        
        dut.rst_n.value = 1
        select="100"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(80000/32))
        dut.rst_n.value = 0    
        await ClockCycles(dut.clk, int(1600000/32))
        
        dut.rst_n.value = 1
        select="101"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(80000/32))
        dut.rst_n.value = 0
        await ClockCycles(dut.clk, int(1600000/32))
        
        dut.rst_n.value = 1
        select="110"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(80000/32))
        dut.rst_n.value = 0
        await ClockCycles(dut.clk, int(1600000/32))
        
        dut.rst_n.value = 1
        select="111"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(80000/32))
        dut.rst_n.value = 0
        await ClockCycles(dut.clk, int(1600000/32))
        dut.rst_n.value = 1