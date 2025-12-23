# ==============================================================================
# cts.tcl
# Purpose: Build clock tree, manage skew/latency, then re-optimize timing
# ==============================================================================

# CTS setup
# Why: Controls buffers/inverters used and target skew/latency
set_ccopt_property target_skew <SKEW_NS>
set_ccopt_property target_latency <LAT_NS>

# Build clock tree
# Why: Distributes clock physically with controlled insertion delay/skew
ccopt_design

# Post-CTS optimization
# Why: Fix new timing issues introduced by the clock tree
optDesign -postCTS

# Reports
timeDesign -postCTS -reportOnly > $RPT_DIR/timing_postCTS.rpt

# Save
saveDesign $OUT_DIR/${DESIGN_NAME}_cts.enc
