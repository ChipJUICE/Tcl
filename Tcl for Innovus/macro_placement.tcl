# ==============================================================================
# macro_placement.tcl
# Purpose: Place SRAM macros and add macro-aware keepouts/blockages
# ==============================================================================

# Manual macro placement
# Why: Macro position dominates congestion, power routing, and timing
placeInstance <macro_inst_name> <x> <y> -orient R0

# Create keepout around macros
# Why: Prevents std-cell placement too close to macros -> routing/power issues
createPlaceBlockage -type soft -box <x1> <y1> <x2> <y2>

# Routing blockages over macro area
# Why: Stops signal routing on sensitive layers above SRAMs (macro-aware routing)
createRouteBlk -box <x1> <y1> <x2> <y2> -layer {<M1> <M2> <M3>} -exceptpgnet

# Save
saveDesign $OUT_DIR/${DESIGN_NAME}_macroplace.enc
