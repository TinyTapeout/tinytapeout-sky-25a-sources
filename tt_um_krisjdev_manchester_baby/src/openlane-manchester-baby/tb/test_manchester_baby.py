import cocotb
from cocotb.triggers import Timer, Edge, RisingEdge, First, Combine
from cocotb.clock import Clock
from cocotb.types import Logic, LogicArray, Range
from cocotb.handle import Release

@cocotb.test()
async def halt(dut):

    # bit order: 31:0
    # little endian
    fake_program = [
        0x00000000,
        0x0000e000
    ]

    cocotb.start_soon(Clock(dut.clock, 1, units="ns").start())

    # reset baby & set ram data to first program line
    dut.reset_i.value = 1
    dut.ram_data_i.value = fake_program[0]

    await Timer(1, "ns") # let signals propagate
    dut.reset_i.value = 0

    # wait for program counter to change
    # long name is due to hierarchy
    # await Edge(dut.uut_manchester_baby.manchester_baby_instance.CIRCUIT_0.PC.q)
    await RisingEdge(dut.clock_o)

    # next program line (halt instruction)
    dut.ram_data_i.value = fake_program[1]

    # wait for halt instruction to illuminate the stop signal
    await RisingEdge(dut.stop_lamp_o) 

    assert dut.stop_lamp_o.value == 1

@cocotb.test()
async def run_long_division(dut):

    program = [
        0x00000013, 0x0000401f, 0x0000601f, 0x0000401f,
        0x0000801e, 0x0000c000, 0x00000000, 0x0000401f,
        0x0000601f, 0x0000401c, 0x0000801c, 0x0000601c,
        0x0000401f, 0x0000801f, 0x0000601f, 0x0000401c,
        0x0000601c, 0x0000c000, 0x0000001a, 0x0000e000,
        0x0000601f, 0x0000401d, 0x0000801c, 0x0000801c,
        0x0000601c, 0x0000001b, 0x00000002, 0x0000000b,
        0x00000000, 0x20000000, 0x00000014, 0x00000024
    ]

    cocotb.start_soon(Clock(dut.clock, 1, units="ns").start())

    # initial set up
    dut.reset_i.value = 1
    await Timer(1, "ns")
    dut.reset_i.value = 0 

    while True:

        if dut.stop_lamp_o.value == 1:
            break

        x = await First(
            RisingEdge(dut.clock_o)
        )

        time = cocotb.utils.get_sim_time()/1000
        # print(f"{x} ({time}) RAM_RW_EN_O: {dut.ram_rw_en_o.value}\tLOGISIM_CLOCK: {dut.logisim_clock_tree_0_out.value}\tSTOP: {dut.stop_lamp_o.value}")

        # read
        if dut.ram_rw_en_o.value == 0:
            # print(f"({time}) [READ] addr: {hex(dut.ram_addr_o.value)}", end="")
            dut.ram_data_i.value = program[dut.ram_addr_o.value]
            # try:
                # print(f"\tram_data_i: {hex(dut.ram_data_i.value)}")
            # except ValueError:
                # print(f"\tram_data_i: {dut.ram_data_i.value}")
        
        # write
        elif dut.ram_rw_en_o.value == 1:
            # print(f"({time}) [WRITE] addr: {hex(dut.ram_addr_o.value)}\tram_data_o: {hex(dut.ram_data_o.value)}")
            program[dut.ram_addr_o.value] = dut.ram_data_o.value
         
    assert dut.stop_lamp_o.value == 1
    assert program[-4] == 0xe0000000