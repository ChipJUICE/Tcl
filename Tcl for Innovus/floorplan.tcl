# ==============================================================================
# floorplan.tcl
# Purpose: Define die/core, utilization, rows; prep for macro-aware layout
# ==============================================================================

# Floorplan
# Why: Establish placement area and routing resources early
floorPlan -site <STD_SITE> \
  -d <DIE_LL_X> <DIE_LL_Y> <DIE_UR_X> <DIE_UR_Y> \
  -c <CORE_LL_X> <CORE_LL_Y> <CORE_UR_X> <CORE_UR_Y>

# Place standard-cell rows
# Why: Legal placement grid for standard cells
addRing -skip_via_on_wire_shape NOSTITCH

# IO placement
# Why: Fixes pin locations to reduce congestion/timing issues
editPin -fixOverlap 1 -spreadDirection clockwise -side <side> -layer <M?>

# Save
saveDesign $OUT_DIR/${DESIGN_NAME}_floorplan.enc
writeDEF $OUT_DIR/${DESIGN_NAME}_floorplan.def