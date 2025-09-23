# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
PROJECT_SOURCES = ./rtl/dff.v ./rtl/gpio.v ./rtl/SRC/fpga_defines.v ./rtl/SRC/sub_module/inv_buf_passgate.v ./rtl/SRC/sub_module/arch_encoder.v ./rtl/SRC/sub_module/local_encoder.v ./rtl/SRC/sub_module/mux_primitives.v ./rtl/SRC/sub_module/muxes.v ./rtl/SRC/sub_module/luts.v ./rtl/SRC/sub_module/wires.v ./rtl/SRC/sub_module/memories.v ./rtl/SRC/sub_module/shift_register_banks.v ./rtl/SRC/lb/logical_tile_io_mode_physical__iopad.v ./rtl/SRC/lb/logical_tile_io_mode_io_.v ./rtl/SRC/lb/logical_tile_clb_mode_default__fle_mode_n1_lut4__ble4_mode_default__lut4.v ./rtl/SRC/lb/logical_tile_clb_mode_default__fle_mode_n1_lut4__ble4_mode_default__ff.v ./rtl/SRC/lb/logical_tile_clb_mode_default__fle_mode_n1_lut4__ble4.v ./rtl/SRC/lb/logical_tile_clb_mode_default__fle.v ./rtl/SRC/lb/logical_tile_clb_mode_clb_.v ./rtl/SRC/lb/grid_io_top.v ./rtl/SRC/lb/grid_io_right.v ./rtl/SRC/lb/grid_io_bottom.v ./rtl/SRC/lb/grid_io_left.v ./rtl/SRC/lb/grid_clb.v ./rtl/SRC/routing/sb_0__0_.v ./rtl/SRC/routing/sb_0__1_.v ./rtl/SRC/routing/sb_0__2_.v ./rtl/SRC/routing/sb_1__0_.v ./rtl/SRC/routing/sb_1__1_.v ./rtl/SRC/routing/sb_1__2_.v ./rtl/SRC/routing/sb_2__0_.v ./rtl/SRC/routing/sb_2__1_.v ./rtl/SRC/routing/sb_2__2_.v ./rtl/SRC/routing/cbx_1__0_.v ./rtl/SRC/routing/cbx_1__1_.v ./rtl/SRC/routing/cbx_1__2_.v ./rtl/SRC/routing/cby_0__1_.v ./rtl/SRC/routing/cby_1__1_.v ./rtl/SRC/routing/cby_2__1_.v ./rtl/SRC/fpga_top.v ./rtl/SRC/top.v ./rtl/SRC/project.v

ifneq ($(GATES),yes)

# RTL simulation:
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

else

# Gate level simulation:
SIM_BUILD				= sim_build/gl
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/gate_level_netlist.v

endif

# Allow sharing configuration between design and testbench via `include`:
COMPILE_ARGS 		+= -I$(SRC_DIR)

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb.v
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
