
![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# sky_tiny_tapeout_General_purpose_Processor

## Overview

This project implements a simple **general-purpose processor** using the Tiny Tapeout flow, enabling the design to be taped out on a real silicon chip. The aim was to understand the end-to-end flow of digital hardware design, simulation, and fabrication using open hardware and EDA tools.

---

## Table of Contents

- [Project Description](#project-description)
- [Features](#features)
- [Design Files](#design-files)
- [How to Use](#how-to-use)
- [Steps I Followed](#steps-i-followed)
- [Testing & Results](#testing--results)
- [Acknowledgements](#acknowledgements)

---

## Project Description

A minimal general-purpose processor designed for educational and tapeout purposes. The processor supports an instruction set and can perform basic operations.

---

## Features

- Open-source HDL design
- Instruction fetch, decode, and execute cycle
- Arithmetic and logic unit (ALU)
- Register file
- Basic I/O interfaces
- Tiny Tapeout-compatible interfaces

---

## Design Files

- `rtl/`: Verilog source files
- `sim/`: Simulation scripts and testbenches
- `tt_project.yaml`: Project descriptor for Tiny Tapeout
- `README.md`: Project documentation (this file)

---

## How to Use

1. Clone the repository.
2. Run the provided simulation scripts to test processor behavior.
3. Use the Tiny Tapeout submission instructions to generate GDS files.
4. Follow the Tapeout process for chip fabrication.

---

## Steps I Followed

1. **Project Setup**
   - Cloned the Tiny Tapeout template repository and initialized the project structure.
2. **HDL Coding**
   - Wrote the processor core in Verilog/SystemVerilog.
   - Created supporting modules (ALU, register file, PC, decoder, etc.).
3. **Simulation**
   - Developed and executed testbenches to verify processor correctness.
   - Simulated core instruction flow and basic programs.
4. **Integration with Tiny Tapeout**
   - Adapted the top-level module to match the Tiny Tapeout interface requirements.
   - Configured `tt_project.yaml` with metadata and pin mapping.
5. **Synthesis and Verification**
   - Ran synthesis, LVS, and DRC through the Tiny Tapeout flow.
   - Fixed any functional or design rule issues.
6. **Submission and Tapeout**
   - Generated GDS files and submitted the project per Tiny Tapeout guidelines.
   - Awaited project inclusion in a shuttle run for fabrication.
7. **Documentation**
   - Documented the design, usage, and test results in this README.
   - Provided instructions for simulation and verification.

---

## Testing & Results

- Verified basic instruction execution via simulation.
- Checked hardware signals on the testbench and waveform viewers.
- After fabrication, the physical chip was tested using the provided harness.

---

## Acknowledgements

- Tiny Tapeout community and maintainers.
- Open-source EDA tool developers.
- Contributors to the project.
