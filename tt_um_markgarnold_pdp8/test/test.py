# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import Timer
        
max_clock_cycles = 250
max_clock_cycles_isz = 1500

#  pdp8_cpu cpu(write,membus,cont,
#                    ba,ma,mb,halt,reset,sysclk);
#      cont = 1;
#      reset = 0;//1;
#      reset = #1 1; //#1 0;
#      reset = #3 0; //#3 1;

def init_m():
    m=[]
    for i in range(0, 128):
        m.append(0)

    m[0o0100] = 0o7300  # CLA CLL 
    m[0o0101] = 0o1104  # TAD A   
    m[0o0102] = 0o3105  # DCA B    
    m[0o0103] = 0o7402  # HLT     
    m[0o0104] = 0o1234  # A, data to copy
    m[0o0105] = 0o0000  # B, loc where copy goes
    return m
        

def init_m_isz():
    m=[]
    for i in range(0, 128):
        m.append(0)
    m[0o0100] = 0o7300; # CLA CLL
    m[0o0101] = 0o1110; # L,TAD SEVEN
    m[0o0102] = 0o2106; # ISZ COUNT
    m[0o0103] = 0o5101; # JMP L
    m[0o0104] = 0o3107; # DCA PROD
    m[0o0105] = 0o7402; # HLT
    m[0o0106] = 0o7770; # COUNT, -8 
    m[0o0107] = 0o0000; # PROD,  0
    m[0o0110] = 0o0007; # SEVEN, 7
    return m

def init_m_and():
    m=[]
    for i in range(0, 128):
        m.append(0)
    m[0o0100] = 0o7300; # CLA CLL
    m[0o0101] = 0o1104; # TAD A
    m[0o0102] = 0o0105; # AND B
    m[0o0103] = 0o3105; # DCA B
    m[0o0104] = 0o7402;
    m[0o0105] = 0o0707;
    return m



def read_m(m,ma,ba):
    word = m[ma]
    return 1&(word>>ba)

def write_m(m,ma,ba,mb):
    m[ma] &= 4095-(1 << ba)
    m[ma] |= mb << ba
    return m
 
def display_m(m):
    for i in range(0o0100, 0o0127):
        print(oct(i+0o10000)[3:]+' '+oct(m[i]+0o10000)[3:])

def log_m(m,dut):
    dut._log.info(" ")
    for i in range(0o0100, 0o0127):
        dut._log.info(oct(i+0o10000)[3:]+'/'+oct(m[i]+0o10000)[3:])

def bitdisplay_m(m):
    for i in range(0o0100, 0o0106):
        for j in range(11,-1,-1):
            print(read_m(m,i,j),end='')
        print('')
 

#module tt_markgarnold_pdp8 (
#    input  wire [7:0] ui_in,    // Dedicated inputs
#    output wire [7:0] uo_out,   // Dedicated outputs
#    input  wire [7:0] uio_in,   // IOs: Input path
#    output wire [7:0] uio_out,  // IOs: Output path
#    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
#    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
#    input  wire       clk,      // clock
#    input  wire       rst_n     // reset_n - low to reset
#  wire membus = ui_in[0];
#  wire contin = ui_in[1];
#  assign uo_out  = {halt, ma};
#  assign uio_oe  = 8'b11111111; //all uios are outputs
#  assign uio_out = {2'b0,write,mb,ba}; //2 unused





@cocotb.test()
async def test_project(dut):
    m = init_m()
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test PDP8: TAD and DCA")
    await ClockCycles(dut.clk, 10)
    await ClockCycles(dut.clk, 10)
    
    contin = 1
    dut.ui_in.value = contin << 1
    halt = dut.uo_out.value >> 7
    counter = 0
    while halt == 1:
        # Wait for one clock cycle to see the output values
        await ClockCycles(dut.clk, 1)
        dut.ui_in.value = contin << 1
        halt = dut.uo_out.value >> 7
        dut._log.info("halted "+str(dut.uo_out.value))
    
    while (halt == 0) and (counter < max_clock_cycles):
        dut._log.info("run out "+str(dut.uo_out.value)+" "+str(dut.uio_out.value)+" counter="+str(counter))
        #halt = dut.uo_out.value >> 7
        #ma = dut.uo_out.value & 0x7f
        #write = dut.uio_out.value >>5
        #mb = (dut.uio_out.value >> 4) & 1
        #ba = dut.uio_out.value & 0xf

        #big endian (cocotb) + little endian (verilog PDP8) = 8 for byte
        halt = dut.uo_out.value[0]   #[7]
        ma = dut.uo_out.value[1:7]    #[6:0]
        write = dut.uio_out.value[2] #[5]
        mb = dut.uio_out.value[3]    #[4]
        ba = dut.uio_out.value[4:7]   #[3:0]
        
        if (halt == 0) and (write == 0):  #active low write during run
            m=write_m(m,int(ma),int(ba),int(mb))
            membus = int(mb)
            dut._log.info("write "+str(mb)+" ma="+str(ma)+" ba="+str(ba))
        else:
            membus = read_m(m,int(ma),int(ba))
            dut._log.info("read  "+str(membus)+" ma="+str(ma)+" ba="+str(ba))

        if ba==12:
            dut._log.info(oct(ma+0o10000)[3:]+'/'+oct(m[ma]+0o10000)[3:])

        #These did not solve the lag of membus:
        #dut.ui_in.setimmediatevalue((contin<<1)|membus)
        #await Timer(time=0, units='ns') 
        #instead added extra wait state in verilog so following works in the next cycle
        dut.ui_in.value = (contin<<1)|membus
            
        dut._log.info("run in="+str(dut.ui_in.value)) #this value lags one cycle behind
        contin = 0

        # Wait for one clock cycle to see the output values
        await ClockCycles(dut.clk, 1)
        counter += 1

    log_m(m,dut)

    assert m[0o0105] == 0o1234

    m = init_m_isz()        
    # Reset
    dut._log.info("Reset")
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1


    dut._log.info("Test PDP8: ISZ and JMP")
    await ClockCycles(dut.clk, 10)
    await ClockCycles(dut.clk, 10)
    
    contin = 1
    dut.ui_in.value = contin << 1
    halt = dut.uo_out.value >> 7
    counter = 0
    while halt == 1:
        # Wait for one clock cycle to see the output values
        await ClockCycles(dut.clk, 1)
        dut.ui_in.value = contin << 1
        halt = dut.uo_out.value >> 7
        dut._log.info("halted "+str(dut.uo_out.value))
    
    while (halt == 0) and (counter < max_clock_cycles_isz):
        dut._log.info("run out "+str(dut.uo_out.value)+" "+str(dut.uio_out.value)+" counter="+str(counter))
        #halt = dut.uo_out.value >> 7
        #ma = dut.uo_out.value & 0x7f
        #write = dut.uio_out.value >>5
        #mb = (dut.uio_out.value >> 4) & 1
        #ba = dut.uio_out.value & 0xf

        #big endian (cocotb) + little endian (verilog PDP8) = 8 for byte
        halt = dut.uo_out.value[0]   #[7]
        ma = dut.uo_out.value[1:7]    #[6:0]
        write = dut.uio_out.value[2] #[5]
        mb = dut.uio_out.value[3]    #[4]
        ba = dut.uio_out.value[4:7]   #[3:0]
        
        if (halt == 0) and (write == 0):  #active low write during run
            m=write_m(m,int(ma),int(ba),int(mb))
            membus = int(mb)
            dut._log.info("write "+str(mb)+" ma="+str(ma)+" ba="+str(ba))
        else:
            membus = read_m(m,int(ma),int(ba))
            dut._log.info("read  "+str(membus)+" ma="+str(ma)+" ba="+str(ba))

        if ba==12:
            dut._log.info(oct(ma+0o10000)[3:]+'/'+oct(m[ma]+0o10000)[3:])

        #These did not solve the lag of membus:
        #dut.ui_in.setimmediatevalue((contin<<1)|membus)
        #await Timer(time=0, units='ns') 
        #instead added extra wait state in verilog so following works in the next cycle
        dut.ui_in.value = (contin<<1)|membus
            
        dut._log.info("run in="+str(dut.ui_in.value)) #this value lags one cycle behind
        contin = 0

        # Wait for one clock cycle to see the output values
        await ClockCycles(dut.clk, 1)
        counter += 1

    log_m(m,dut)

    assert m[0o0107] == 0o0070

        
    m = init_m_and()        
    # Reset
    dut._log.info("Reset")
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1


    dut._log.info("Test PDP8: AND")
    await ClockCycles(dut.clk, 10)
    await ClockCycles(dut.clk, 10)
    
    contin = 1
    dut.ui_in.value = contin << 1
    halt = dut.uo_out.value >> 7
    counter = 0
    while halt == 1:
        # Wait for one clock cycle to see the output values
        await ClockCycles(dut.clk, 1)
        dut.ui_in.value = contin << 1
        halt = dut.uo_out.value >> 7
        dut._log.info("halted "+str(dut.uo_out.value))
    
    while (halt == 0) and (counter < max_clock_cycles_isz):
        dut._log.info("run out "+str(dut.uo_out.value)+" "+str(dut.uio_out.value)+" counter="+str(counter))
        #halt = dut.uo_out.value >> 7
        #ma = dut.uo_out.value & 0x7f
        #write = dut.uio_out.value >>5
        #mb = (dut.uio_out.value >> 4) & 1
        #ba = dut.uio_out.value & 0xf

        #big endian (cocotb) + little endian (verilog PDP8) = 8 for byte
        halt = dut.uo_out.value[0]   #[7]
        ma = dut.uo_out.value[1:7]    #[6:0]
        write = dut.uio_out.value[2] #[5]
        mb = dut.uio_out.value[3]    #[4]
        ba = dut.uio_out.value[4:7]   #[3:0]
        
        if (halt == 0) and (write == 0):  #active low write during run
            m=write_m(m,int(ma),int(ba),int(mb))
            membus = int(mb)
            dut._log.info("write "+str(mb)+" ma="+str(ma)+" ba="+str(ba))
        else:
            membus = read_m(m,int(ma),int(ba))
            dut._log.info("read  "+str(membus)+" ma="+str(ma)+" ba="+str(ba))

        if ba==12:
            dut._log.info(oct(ma+0o10000)[3:]+'/'+oct(m[ma]+0o10000)[3:])

        #These did not solve the lag of membus:
        #dut.ui_in.setimmediatevalue((contin<<1)|membus)
        #await Timer(time=0, units='ns') 
        #instead added extra wait state in verilog so following works in the next cycle
        dut.ui_in.value = (contin<<1)|membus
            
        dut._log.info("run in="+str(dut.ui_in.value)) #this value lags one cycle behind
        contin = 0

        # Wait for one clock cycle to see the output values
        await ClockCycles(dut.clk, 1)
        counter += 1

    log_m(m,dut)

    assert m[0o0105] == 0o0402


