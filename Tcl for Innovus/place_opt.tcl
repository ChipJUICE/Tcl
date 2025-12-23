# ==============================================================================
# place_opt.tcl
# Purpose: Place standard cells, reduce congestion, and optimize timing pre-CTS
# ==============================================================================

# Placement
# Why: Legalize and optimize cell locations for wirelength/timing
place_design

# Pre-CTS optimization
# Why: Fix setup/hold early, reduce later CTS pain
optDesign -preCTS

# Reports
timeDesign -preCTS -reportOnly > $RPT_DIR/timing_preCTS.rpt
reportCongestion -overflow > $RPT_DIR/congestion_preCTS.rpt

# Save
saveDesign $OUT_DIR/${DESIGN_NAME}_placeopt.enc
