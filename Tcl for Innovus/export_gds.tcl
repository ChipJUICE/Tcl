# ==============================================================================
# export_gds.tcl
# Purpose: Write final GDSII + DEF for tapeout-style deliverables
# ==============================================================================

# Write DEF
# Why: Useful for debug and handoff
defOut -floorplan -routing $OUT_DIR/${DESIGN_NAME}.def

# Stream out GDS
# Why: Final layout database for fabrication
streamOut $OUT_DIR/${DESIGN_NAME}.gds \
  -mapFile <gds_map_file> \
  -merge [list <stdcell_gds> <macro_gds>] \
  -stripes 1 \
  -units 2000 \
  -mode ALL

# Final save
saveDesign $OUT_DIR/${DESIGN_NAME}_final.enc
