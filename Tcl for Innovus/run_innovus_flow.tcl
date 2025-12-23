# ==============================================================================
# run_innovus_flow.tcl
# Purpose: Run the whole Innovus flow in order
# ==============================================================================

source init_innovus.tcl
source floorplan.tcl
source macro_placement.tcl
source powerplan.tcl
source place_opt.tcl
source cts.tcl
source route.tcl
source signoff.tcl
source export_gds.tcl
