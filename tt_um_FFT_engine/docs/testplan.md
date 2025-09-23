# FFT Engine Pre-Silicon Verification Test Plan

## Overview
This document outlines the comprehensive verification strategy for the 4-point FFT engine pre si tapeout.
## Test Architecture

### Test Framework
- **Framework**: Cocotb (Python-based testbench)
- **Simulator**: Icarus Verilog (default) / other Verilog simulators
- **Language**: Python for testbenches, SystemVerilog for DUT Harness
- **Coverage**: Functional and timing verification

### Test Hierarchy
```
test/
├── butterfly_unit/     # Butterfly computation tests
├── fft_engine/        # Core FFT algorithm tests  
├── io_ctrl/          # Input/output control tests
├── memory_ctrl/      # Memory management tests
└── top_fft/         # Full system integration tests
```

## Test Categories

### 1. Unit Tests

#### Butterfly Unit (`butterfly_unit/`)
**Purpose**: Validate the core butterfly operation used in FFT computation

**Test Cases**:
- Basic butterfly operation with known inputs
- Edge case inputs (max/min values)
- Twiddle factor multiplication accuracy
- Overflow/underflow handling

**Key Metrics**:
- Computational accuracy vs reference model
- Proper scaling to prevent overflow
- Timing: Single cycle operation

#### FFT Engine (`fft_engine/`)
**Purpose**: Verify the complete 4-point FFT algorithm

**Test Cases**:
- DC input (all samples = constant)
- Impulse input (single non-zero sample)
- Complex exponential inputs
- Random input patterns
- Frequency response validation

**Key Metrics**:
- Output matches mathematical FFT
- 20-cycle processing latency
- Proper pipeline operation

#### Memory Controller (`memory_ctrl/`)
**Purpose**: Validate sample storage and retrieval

**Test Cases**:
- Sequential sample loading
- Address generation and routing
- Data integrity during load/read cycles
- Reset behavior

#### I/O Controller (`io_ctrl/`)
**Purpose**: Verify input/output control signals

**Test Cases**:
- Button press detection
- Load pulse generation
- Output pulse timing
- Address counter sequencing

### 2. Integration Tests

#### Top-Level System (`top_fft/`)
**Purpose**: Validate complete system operation end-to-end

**Test Cases**:

1. **Reset Test** (`TEST_ID = 1`)
   - Verify all registers initialize to zero
   - Check proper reset behavior across all modules

2. **Complex Input Test** (`TEST_ID = 2`)
   - Load complex samples with known FFT output
   - Verify 20-cycle processing time
   - Compare output with reference model

3. **Impulse Response Test** (`TEST_ID = 3`)
   - Input: [1, 0, 0, 0] (impulse)
   - Expected: Flat frequency response
   - Validates system frequency characteristics

4. **DC Test** (`TEST_ID = 4`)
   - Input: [C, C, C, C] (constant)
   - Expected: Energy only in DC bin (bin 0)
   - Tests zero-frequency response

5. **Random Input Test** (`TEST_ID = 5`)
   - Multiple random input patterns
   - Statistical validation against reference
   - Stress testing edge cases

## Static Timing Analysis
See the dedicated doc [here](./sta.md)

## Timing Requirements

### Critical Timing Constraints
- **Processing Latency**: Exactly 20 clock cycles from last input to first valid output
- **Clock Frequency**: 50 MHz operation
- **Setup/Hold**: All signals must meet timing at 50 MHz

### Test Methodology/ things we kept in mind
1. **Cycle-Accurate Simulation**: Verify exact 20-cycle latency
2. **Clock Domain Analysis**: Ensure single clock domain operation
3. **Signal Integrity**: Check for glitches and race conditions

## Reference Models

### Python Reference Implementation
Each test includes a bit-accurate Python model:

```python
def fft_engine_ref_model(in0, in1, in2, in3):
    # Implements exact same algorithm as hardware
    # Including quantization and overflow behavior
    # Returns expected hardware outputs
```

### Verification Strategy
1. **Input Generation**: Create test vectors with known outputs
2. **Hardware Simulation**: Run vectors through RTL simulation  
3. **Comparison**: Bit-exact match with reference model
4. **Error Analysis**: Report any mismatches with detailed diagnostics

## Test Execution

### Automated Testing
```bash
# Run all tests
make test_all

# Run specific module tests
make test_butterfly
make test_fft_engine  
make test_top_fft
```

### Success Criteria
- [x] All tests pass
- [x] 20-cycle timing requirement met
- [x] No timing violations at 50 MHz

### Post-Silicon Testing

Once the chip is fabricated, we thought it was necessary to ensure the dut is able to be validated post si as well. as such, we wrote the following tests which can be performed using the PCB interface:

#### Hardware Interface
- **Switches**: 8 input switches on PCB, with Switch 0 controlling input and Switch 1 controlling output
- **7-Segment Display**: Shows current operation mode to user
- **Bidirectional I/O**: 8-bit data bus for sample input and frequency bin output

#### Test Procedure

**Sample Input Phase**:
1. Toggle Switch 0 first time → Load first 8-bit sample via bidirectional pins
2. Toggle Switch 0 second time → Load second sample
3. Toggle Switch 0 third time → Load third sample  
4. Toggle Switch 0 fourth time → Load fourth sample

**Processing Phase**:
- FFT computation occurs automatically (20 cycles)

**Output Phase**:
1. Toggle Switch 1 first time → Output first frequency bin
2. Toggle Switch 1 second time → Output second frequency bin
3. Toggle Switch 1 third time → Output third frequency bin
4. Toggle Switch 1 fourth time → Output fourth frequency bin

#### 7-Segment Display Status
- **1**: Input/Load the first sample
- **2**: Input/Load the second sample  
- **3**: Input/Load the third sample
- **4**: Input/Load the fourth sample
- **5**: Output/Read the first frequency group
- **6**: Output/Read the second frequency group
- **7**: Output/Read the third frequency group
- **8**: Output/Read the fourth frequency group

#### Recommended Post-Silicon Test Cases

1. **Minimum Input Test**: `[0,0,0,0]`
   - Expected Output: All frequency bins should be 0
   - Validates basic operation and zero handling

2. **Maximum Input Test**: `[max, max, max, max]` (full-scale values)
   - Expected Output: DC component at bin 0, other bins should be 0
   - Tests summing capability and overflow handling

3. **Impulse Response Test**: `[max, 0, 0, 0]`
   - Expected Output: Same value across all frequency bins
   - Validates frequency response characteristics

4. **Alternating Pattern Test**: `[-max/2, +max/2, -max/2, +max/2]`
   - Expected Output: Energy in high-frequency bins
   - Tests alternating pattern recognition and confirms no overflow

5. **Real-Only Input Test**: Complex samples with zero imaginary parts
   - Expected Output: Should exhibit conjugate symmetry in frequency domain
   - Validates real signal processing

6. **Complex-Only Input Test**: Samples with significant imaginary components
   - Expected Output: Results won't have conjugate symmetry
   - Tests complex arithmetic paths

7. **Mid-Operation Reset Test**: Reset during computation
   - Expected Output: System should restart cleanly without leftover data
   - Validates reset functionality under all conditions
