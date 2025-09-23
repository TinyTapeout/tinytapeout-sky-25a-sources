# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
clk_r=100

@cocotb.test()
async def test_project_0d(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, clk_r, units="ns")
    cocotb.start_soon(clock.start())
    
    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    

    for sub_i_I_cor in range(4):
        i_I_cor=sub_i_I_cor+0
        I_cor = f'{i_I_cor:05b}'
        # print(f'{i_I_cor} -> {I_cor}')
        
        select="000"
        
        
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        
        
        await ClockCycles(dut.clk, 2)
        dut.rst_n.value = 1
        dut._log.info("Test project behavior")
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="001"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="010"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        # Set the input values you want to test
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="011"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="100"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1    
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="101"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="110"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="111"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(61000/clk_r))
        dut.rst_n.value = 0

@cocotb.test()
async def test_project_8d(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, clk_r, units="ns")
    cocotb.start_soon(clock.start())
    
    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    

    for sub_i_I_cor in range(2):
        i_I_cor=sub_i_I_cor+12
        I_cor = f'{i_I_cor:05b}'
        # print(f'{i_I_cor} -> {I_cor}')

        select="000"
        
        
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        
        
        await ClockCycles(dut.clk, 2)
        dut.rst_n.value = 1
        dut._log.info("Test project behavior")
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="001"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="010"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        # Set the input values you want to test
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="011"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="100"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1    
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="101"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="110"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="111"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        dut.rst_n.value = 0


@cocotb.test()
async def test_project_16d(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, clk_r, units="ns")
    cocotb.start_soon(clock.start())
    
    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    

    for sub_i_I_cor in range(2):
        i_I_cor=sub_i_I_cor+20
        I_cor = f'{i_I_cor:05b}'
        # print(f'{i_I_cor} -> {I_cor}')

        select="000"
        
        
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        
        
        await ClockCycles(dut.clk, 2)
        dut.rst_n.value = 1
        dut._log.info("Test project behavior")
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="001"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="010"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        # Set the input values you want to test
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="011"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="100"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1    
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="101"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="110"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="111"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        dut.rst_n.value = 0

@cocotb.test()
async def test_project_24d(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, clk_r, units="ns")
    cocotb.start_soon(clock.start())
    
    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    

    for sub_i_I_cor in range(4):
        i_I_cor=sub_i_I_cor+27
        I_cor = f'{i_I_cor:05b}'
        # print(f'{i_I_cor} -> {I_cor}')

        select="000"
        
        
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        
        
        await ClockCycles(dut.clk, 2)
        dut.rst_n.value = 1
        dut._log.info("Test project behavior")
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="001"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="010"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        # Set the input values you want to test
        await ClockCycles(dut.clk, int(61000/clk_r))
        
        dut.rst_n.value = 0
        select="011"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="100"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1    
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="101"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="110"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        
        dut.rst_n.value = 0
        select="111"
        ui_valor=int(I_cor+select,2)
        dut.ui_in.value = ui_valor
        await ClockCycles(dut.clk, int(1600/clk_r))
        dut.rst_n.value = 1
        await ClockCycles(dut.clk, int(5000/clk_r))
        dut.rst_n.value = 0
