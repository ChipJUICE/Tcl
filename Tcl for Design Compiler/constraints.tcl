# ==============================================================================
# constraints.sdc
# Purpose: Timing intent for synthesis/STA; matches our 300MHz-style target flow
# Should be customized per design
# Should be invoked from run_dc.tcl after design is read in
# Should be named constraints.sdc and placed in CONSTRAINTS_DIR
# ==============================================================================

# Clock
# Why: Defines the timing reference for optimization
create_clock -name core_clk -period <CLK_PERIOD_NS> [get_ports <CLK_PORT_NAME>]
# e.g., 3.33 for ~300MHz

# Clock uncertainty
# Why: Budget for jitter/skew; prevents over-optimistic timing closure
set_clock_uncertainty -setup <SETUP_UNC_NS> [get_clocks core_clk]
set_clock_uncertainty -hold  <HOLD_UNC_NS>  [get_clocks core_clk]

# Clock transition (slew)
# Why: Prevents unrealistic ideal clocks; helps buffering/inverter sizing
set_clock_transition <CLK_SLEW_NS> [get_clocks core_clk]

# I/O delays (relative to core clock)
# Why: Models external launch/capture timing at chip boundary
set_input_delay  <IN_DELAY_NS>  -clock core_clk [remove_from_collection [all_inputs] [get_ports <CLK_PORT_NAME>]]
set_output_delay <OUT_DELAY_NS> -clock core_clk [all_outputs]

# Drive strength / input transition
# Why: Models input driver; affects internal timing and buffering
set_driving_cell -lib_cell <IN_DRV_CELL> -pin <IN_DRV_PIN> [remove_from_collection [all_inputs] [get_ports <CLK_PORT_NAME>]]
# OR: set_input_transition <IN_SLEW_NS> [all_inputs]

# Output loading
# Why: Models external capacitive load
set_load <OUT_LOAD_PF> [all_outputs]

# Reset handling
# Why: Avoid timing on async reset networks
set_false_path -from [get_ports <RESET_PORT_NAME>]

