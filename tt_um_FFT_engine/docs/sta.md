## Static Timing Analysis

### Synthesis and Timing Signoff

To ensure the design meets timing requirements across all process corners and voltage variations, we performed full **static timing analysis (STA)** using OpenLane's `opensta` toolchain. The setup is provided [here](../verilog_sta/).

#### Key Metrics Checked:

- **Setup/Hold Timing**  
  All flip-flop paths were verified to meet setup and hold constraints at the target frequency (50 MHz).
- **Min/Max Path Analysis**  
  - **Min path violations** were identified on asynchronous reset and combinational outputs.
  - These were resolved by synchronizing resets and registering all outputs.
- **Clock Tree Propagation**  
  Clock buffers and insertion delay were accounted for in the propagated timing analysis.

### Final Timing Signoff

All checks passed across the following PVT corners:

- **SS** (Slow-Slow @ 0.55 V, 125 °C) — Ensures **hold** and min delay safety
- **TT** (Typical-Typical @ 1.8 V, 25 °C) — Nominal case for performance/power
- **FF** (Fast-Fast @ 1.95

#### Timing Highlights

- **Hold Checks**: All paths met hold constraints  
  - *Worst slack*: **+0.32 ns**
- **Setup Checks**: All paths met setup constraints  
  - *Worst slack*: **+5.53 ns**
- **Recovery/Removal**: Reset paths validated; no violations  
  - *Worst slack*: **+3.96 ns**
- **Clock Skew and Uncertainty**: Within acceptable bounds 
  - **-0.10ns**

See the full results [here](../verilog_sta/results.txt).

## Pre-PNR vs. Post-PNR Static Timing Analysis Comparison

This report compares the Static Timing Analysis (STA) results before and after the Place and Route (PNR) stage.

*   **Pre-PNR (Synthesis Stage):** Timing is estimated using statistical wire load models. This stage is useful for identifying major architectural issues but is not physically accurate.
*   **Post-PNR (Layout Stage):** Timing is analyzed on the final layout with parasitic extraction (SPEF). This provides an accurate signoff analysis, as it accounts for real interconnect delays, clock tree skew, and cell placement.

### Summary of Timing Closure

The PNR process was successful in resolving all timing and design rule check (DRC) violations present after synthesis.

| Metric                     | Pre-PNR (Synthesis)               | Post-PNR (Layout)                 | Analysis / Comment                                                                                                                              |
| :------------------------- | :-------------------------------- | :-------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------- |
| **Worst Hold Slack**       | `-0.0884 ns` <br> (**Violation**) | `+0.1068 ns` <br> (**Fixed**)      | The initial hold violation was successfully fixed by the PNR tool, likely by adding delay buffers or optimizing cell placement.               |
| **Hold Violation Count**   | 1                                 | 0                                 | Confirms the hold violation was resolved.                                                                                                       |
| **Worst Setup Slack**      | `+5.9515 ns`                      | `+7.5619 ns`                      | Setup slack *improved* after PNR. This is common as Clock Tree Synthesis (CTS) optimizes clock paths, leading to better overall timing margins. |
| **Setup Violation Count**  | 0                                 | 0                                 | The design met setup constraints in both stages.                                                                                                |
| **Max Cap Violations**     | 1                                 | 0                                 | The single capacitance violation (likely a high-fanout net) was fixed, probably by buffering the net during PNR.                            |
| **Max Slew Violations**    | 89                                | 0                                 | All 89 slew rate (transition time) violations were fixed by the PNR tool, typically by inserting buffers or using stronger driver cells.     |

### Conclusion

The data clearly shows the importance of post-PNR STA. While the initial synthesis reported significant **slew and hold violations**, the OpenLane PNR flow successfully **resolved all violations**, delivering a design that meets timing across all signoff corners.
