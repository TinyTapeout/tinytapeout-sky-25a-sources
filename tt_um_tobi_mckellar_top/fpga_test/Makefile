# Makefile for building and programming an iCE40UP5K bitstream with PCF constraints

# Paths
SRC_DIR      := $(PWD)/../src
BUILD_DIR    := $(PWD)/bitstream
PINMAP_PCF   := $(PWD)/pinmap.pcf


# Top-level module (new wrapper)
TOP := tt_fpga_top

# Sources
VHDL_SOURCE       := $(SRC_DIR)/captouch.vhd
GENERATED_VERILOG := $(SRC_DIR)/captouch.v
VERILOG_SOURCES   := \
	$(SRC_DIR)/project.v \
	tt_fpga_top.v

# Default target
all: bitstream

# Convert VHDL to Verilog
$(GENERATED_VERILOG): $(VHDL_SOURCE)
	@echo "🔄 Converting VHDL to Verilog..."
	mkdir -p $(BUILD_DIR)
	ghdl -a --workdir=$(BUILD_DIR) $(VHDL_SOURCE)
	ghdl -e --workdir=$(BUILD_DIR) capacitivetouch
	ghdl --synth --out=verilog --workdir=$(BUILD_DIR) capacitivetouch > $(GENERATED_VERILOG)

# Generate bitstream with pin constraints
bitstream: $(GENERATED_VERILOG) $(VERILOG_SOURCES) $(PINMAP_PCF)
	@echo "🔧 Building bitstream for iCE40UP5K-SG48 with pin constraints..."
	mkdir -p $(BUILD_DIR)
	yosys -p "read_verilog -I$(SRC_DIR) $(GENERATED_VERILOG) $(VERILOG_SOURCES); synth_ice40 -top $(TOP) -json $(BUILD_DIR)/design.json"
	nextpnr-ice40 --up5k --package sg48 --pcf $(PINMAP_PCF) --json $(BUILD_DIR)/design.json --asc $(BUILD_DIR)/design.asc --pcf-allow-unconstrained
	icepack $(BUILD_DIR)/design.asc $(BUILD_DIR)/bitstream.bin
	@echo "✅ Bitstream generated: $(BUILD_DIR)/bitstream.bin"

# Flash the bitstream
prog: $(BUILD_DIR)/bitstream.bin
	@echo "⚡ Flashing bitstream to FPGA..."
	iceprog $(BUILD_DIR)/bitstream.bin
	@echo "✅ Done."

# Clean build outputs
clean:
	rm -rf $(BUILD_DIR)
	rm -f $(GENERATED_VERILOG)

.PHONY: all bitstream prog clean
