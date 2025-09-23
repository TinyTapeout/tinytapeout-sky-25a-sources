# Makefile for Cocotb + GHDL + Yosys VHDL-to-Verilog conversion

# Default target: run simulation
all: sim

# Sim target depends on generated Verilog
sim: $(GENERATED_VERILOG)

SIM ?= icarus
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
BUILD_DIR = $(PWD)/build

VHDL_PROJECT_SOURCES = captouch.vhd
GENERATED_VERILOG = $(SRC_DIR)/captouch.v
VERILOG_PROJECT_SOURCES = project.v

# Module and testbench
TOPLEVEL = tb
MODULE = test
VERILOG_SOURCES += $(PWD)/tb.v

# Convert VHDL to Verilog before simulation
$(GENERATED_VERILOG): $(addprefix $(SRC_DIR)/,$(VHDL_PROJECT_SOURCES))
	@echo "🛠️  Converting VHDL to Verilog via GHDL + Yosys..."
	mkdir -p $(BUILD_DIR)
	ghdl -a --workdir=$(BUILD_DIR) $(SRC_DIR)/captouch.vhd
	ghdl -e --workdir=$(BUILD_DIR) capacitivetouch
	ghdl --synth --out=verilog --workdir=$(BUILD_DIR) capacitivetouch > $(GENERATED_VERILOG)

# Include generated Verilog for RTL simulation
ifneq ($(GATES),yes)

SIM_BUILD = sim_build/rtl
VERILOG_SOURCES += $(SRC_DIR)/captouch.v
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(VERILOG_PROJECT_SOURCES))

else

# Gate-level simulation settings
SIM_BUILD = sim_build/gl
COMPILE_ARGS += -DGL_TEST -DFUNCTIONAL -DUSE_POWER_PINS -DSIM -DUNIT_DELAY=\#1
VERILOG_SOURCES += \
  $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v \
  $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v \
  $(PWD)/gate_level_netlist.v

endif

# Include shared include paths
COMPILE_ARGS += -I$(SRC_DIR)

# Ensure Verilog is generated before simulation
# all: $(GENERATED_VERILOG)
# 	make sim

# Include Cocotb simulation make rules
include $(shell cocotb-config --makefiles)/Makefile.sim
