# FFT Engine Test Suite

This directory contains comprehensive tests for the 4-point FFT engine using [cocotb](https://docs.cocotb.org/en/stable/) for simulation.

## Test Organization

The test suite is organized by module:
- `butterfly_unit/` - Tests for the butterfly computation unit
- `fft_engine/` - Tests for the complete FFT engine core
- `io_ctrl/` - Tests for input/output control logic  
- `memory_ctrl/` - Tests for sample memory management
- `top_fft/` - Full system integration tests

## Prerequisites

Install required Python packages:
```bash
pip install -r requirements.txt
```

## Running Tests

### Using Makefile Targets
The Makefile provides specific targets for each test module:

```bash
# Individual module tests
make test-butterfly     # Test butterfly computation units
make test-fft-engine   # Test core FFT engine  
make test-memory       # Test memory controller
make test-io           # Test I/O controller
make test-top          # Test complete system

# Run all tests sequentially
make all

# Clean build artifacts
make clean
```

### Gate-Level Testing
After synthesis, test with the gate-level netlist:
```bash
make test-top GATES=yes
```

## Detailed Test Descriptions

### 1. Butterfly Unit Tests (`butterfly_unit/`)

**Test File**: `test_butterfly.py`

#### Test Cases:

1. **`test_neg1_twiddle` (TEST_ID=1)**
   - **Purpose**: Test butterfly with twiddle factor = -1
   - **Inputs**: Various A, B values with W = (-1, 0)
   - **Verification**: Complex multiplication and addition/subtraction accuracy

2. **`test_negj_twiddle` (TEST_ID=2)**  
   - **Purpose**: Test butterfly with twiddle factor = -j
   - **Inputs**: Various A, B values with W = (0, -1)
   - **Verification**: 90-degree phase rotation accuracy

3. **`test_basic_butterfly` (TEST_ID=3)**
   - **Purpose**: Fundamental butterfly operation validation
   - **Inputs**: Known A, B values with W = (1, 0)
   - **Verification**: Basic add/subtract operations without twiddle effects

4. **`test_simple_multiply` (TEST_ID=4)**
   - **Purpose**: Complex multiplication verification
   - **Inputs**: Simple multiplicand pairs
   - **Verification**: Product calculation and scaling accuracy

5. **`test_rand_twiddle` (TEST_ID=5)**
   - **Purpose**: Randomized butterfly testing
   - **Inputs**: Random A, B, W values
   - **Verification**: Statistical validation against reference model

**Key Verifications**:
- 8-bit signed arithmetic accuracy
- Overflow handling and saturation
- Scaling (right shift by 7 bits)
- Complex multiplication correctness

### 2. FFT Engine Tests (`fft_engine/`)

**Test File**: `test_fft_engine.py`

Tests the complete 4-point FFT algorithm implementation with various input patterns to verify frequency domain accuracy.

### 3. Memory Controller Tests (`memory_ctrl/`)

**Test File**: `test_memory_ctrl.py`

#### Test Scenarios:
- **Read/Write Validity**: Write known data, read back for verification
- **Initial Zero State**: Verify memory initializes to zero
- **Address Alignment**: Test correct addressing for 4 sample locations
- **Reset Behavior**: Ensure clean state after reset

### 4. I/O Controller Tests (`io_ctrl/`)

**Test File**: `test_io_ctrl.py`

#### Test Scenarios:
- **Button Press Detection**: Verify switch input recognition
- **Load Pulse Generation**: Test sample loading control signals
- **Output Pulse Timing**: Verify result output sequencing
- **Address Counter**: Test 4-step address generation (0→1→2→3)

### 5. Top-Level Integration Tests (`top_fft/`)

**Test File**: `test_top_fft.py`

#### Complete System Tests:

1. **`test_reset_and_initial_state` (TEST_ID=1)**
   - **Purpose**: Verify proper system initialization
   - **Verification**: All registers start at zero, uio_oe low after reset

2. **`test_full_cycle_complex` (TEST_ID=2)**
   - **Purpose**: End-to-end test with complex input values
   - **Inputs**: `[(16, 32), (-48, -64), (80, -96), (-112, 112)]`
   - **Verification**: 20-cycle time, output matches reference FFT

3. **`test_fft_impulse` (TEST_ID=3)**
   - **Purpose**: Impulse response validation
   - **Inputs**: `[(16, 0), (0, 0), (0, 0), (0, 0)]` (unit impulse)
   - **Expected**: Flat frequency response across all bins
   - **Verification**: System frequency characteristics

4. **`test_fft_dc_input` (TEST_ID=4)**
   - **Purpose**: DC (constant) input validation  
   - **Inputs**: `[(16, 0), (16, 0), (16, 0), (16, 0)]` (constant value)
   - **Expected**: Energy only in DC bin (bin 0), other bins ≈ 0
   - **Verification**: Zero-frequency response isolation

5. **`test_randomized_end_to_end` (TEST_ID=5)**
   - **Purpose**: Stress testing with random inputs
   - **Inputs**: 5 iterations of random complex values
   - **Range**: Values from -128 to 127 in steps of 16
   - **Verification**: Statistical validation against Python reference model

## Timing Requirements

### Critical Timing Validation
- **Clock Frequency**: 50 MHz operation
- **I/O Timing**: Proper setup/hold for bidirectional pins

### Test Methodology
Each test validates cycle-accurate timing:
1. Load 4 samples (4 cycles)
3. Output 4 results (4 cycles)
4. Total: ~20 cycles end-to-end

## Reference Models

### Python Reference Implementation
All tests include bit-accurate Python models that replicate the hardware behavior, in order to check against randomized test input vectors.

```python
def fft_engine_ref_model(in0, in1, in2, in3):
    # Implements exact same algorithm as hardware
    # Including 8-bit quantization and overflow behavior
    # Returns expected hardware outputs
```

### Validation Strategy
1. **Input Generation**: Create test vectors with known outputs
2. **Hardware Simulation**: Run through RTL simulation
3. **Bit-Exact Comparison**: Match reference model output exactly
4. **Error Reporting**: Detailed mismatch analysis with hex values

## Viewing Results

### Waveforms
Each test generates timestamped VCD files in module-specific wave directories:

```bash
# View waveforms with GTKWave
gtkwave butterfly_unit/wave/butterfly_tb_YYYYMMDD_HH:MM:SS.vcd

# Or use Surfer  
surfer top_fft/wave/tt_um_FFT_engine_tb_YYYYMMDD_HH:MM:SS.vcd
```

### Console Output
Test results show:
- **PASS/FAIL** status for each test case
- Detailed timing information  
- Input/output values in hex format
- Reference model comparisons
- Error diagnostics for failures

## Debug Tips

1. **Timing Issues**: Check VCD for 20-cycle processing constraint
2. **Data Mismatch**: Compare hex values between DUT and reference
3. **Control Logic**: Verify switch inputs and uio_oe behavior
4. **Overflow**: Monitor butterfly scaling and saturation
5. **Reset Problems**: Ensure proper initialization sequence

### Timing
- **Processing Cycles**: 20 clock cycles from input to valid output
- **Test Duration**: Each test runs for sufficient cycles to capture full operation