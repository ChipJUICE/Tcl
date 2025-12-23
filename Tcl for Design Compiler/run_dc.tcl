# ==============================================================================
# run_dc.tcl
# Purpose: Read RTL -> elaborate -> apply constraints -> compile -> write outputs
# ==============================================================================

source setup.tcl

# Analyze RTL
# Why: Parses source files into DC database
analyze -format sverilog [glob -nocomplain $RTL_DIR/*.sv]
analyze -format verilog  [glob -nocomplain $RTL_DIR/*.v]

# Elaborate top
# Why: Builds design hierarchy with chosen top module
elaborate $DESIGN_NAME
current_design $DESIGN_NAME

# Link
# Why: Resolves module/cell references using link_library
link

# Basic sanity checks
# Why: Catch unconnected ports, unresolved refs before optimization
check_design > $RPT_DIR/check_design.rpt

# Apply constraints
# Why: Timing intent guides optimization
source $CONSTRAINTS_DIR/<constraints.sdc>


# Design constraints best-practice knobs
# Why: Prevent tool from breaking hierarchy/names unexpectedly
set_app_var compile_delete_unloaded_sequential_cells false
set_fix_multiple_port_nets -all -buffer_constants

# Compile (main synthesis)
# Why: Maps RTL to gates and optimizes for timing/area/power
compile_ultra -no_autoungroup

# Post-compile reports
# Why: Evidence for timing/area/power and debugging
report_timing -max_paths 50 -delay_type max > $RPT_DIR/timing_setup.rpt
report_timing -max_paths 50 -delay_type min > $RPT_DIR/timing_hold.rpt
report_area  -hierarchy > $RPT_DIR/area.rpt
report_power -hierarchy > $RPT_DIR/power.rpt
report_qor             > $RPT_DIR/qor.rpt

# Write deliverables for Innovus
# Why: Innovus needs gate netlist + constraints + timing libs
write -format verilog -hierarchy -output $OUT_DIR/${DESIGN_NAME}_syn.v
write_sdc $OUT_DIR/${DESIGN_NAME}.sdc

# Write DDC (DC database) for reopening
write -format ddc -hierarchy -output $OUT_DIR/${DESIGN_NAME}.ddc

