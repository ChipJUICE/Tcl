# ==============================================================================
# route.tcl
# Purpose: Route signals, then fix timing/DRC with post-route optimization
# ==============================================================================

# Global route
# Why: Rough routing plan for congestion/timing awareness
routeDesign -globalDetail

# Detailed route
# Why: Final wires/vias that satisfy DRC
routeDesign -detail

# Post-route optimization
# Why: Fix residual setup/hold with buffering/sizing (clears tiny hold like 0.04ns)
optDesign -postRoute

# Reports
timeDesign -postRoute -reportOnly > $RPT_DIR/timing_postRoute.rpt
verify_drc > $RPT_DIR/drc_postRoute.rpt

# Save
saveDesign $OUT_DIR/${DESIGN_NAME}_route.enc
