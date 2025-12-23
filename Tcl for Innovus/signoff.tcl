# ==============================================================================
# signoff.tcl
# Purpose: Generate signoff-quality outputs and final reports
# ==============================================================================

# Why: Accurate parasitics for timing/power
extractRC -outfile $OUT_DIR/${DESIGN_NAME}.cap

# Timing signoff reports
# Why: Evidence for final closure (setup/hold)
timeDesign -signoff -reportOnly > $RPT_DIR/timing_signoff.rpt

# Save netlists
# Why: Post-route netlist for gate-level simulation/STA handoff
saveNetlist $OUT_DIR/${DESIGN_NAME}_postroute.v

# SPEF (if enabled)
# Why: Parasitic exchange format for STA
rcOut -spef $OUT_DIR/${DESIGN_NAME}.spef

# SDF (optional)
# Why: Back-annotation delays for simulation
write_sdf $OUT_DIR/${DESIGN_NAME}.sdf
