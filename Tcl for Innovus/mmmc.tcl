# ==============================================================================
# mmmc.tcl
# Purpose: Define corners/modes/views for signoff-credible timing in Innovus
# ==============================================================================

# Libraries
create_library_set -name LIB_TT -timing [list <stdcell_tt.lib> <macro_tt.lib>]

# RC corners
create_rc_corner -name RC_TYP -qx_tech_file <QRC_TECH_FILE>

# Delay corners
create_delay_corner -name DC_TT -library_set LIB_TT -rc_corner RC_TYP

# Constraint modes
create_constraint_mode -name CM_FUNC -sdc_files [list <path_to_top.sdc>]

# Analysis views
create_analysis_view -name VIEW_TT -constraint_mode CM_FUNC -delay_corner DC_TT

# Set active views
set_analysis_view -setup VIEW_TT -hold VIEW_TT
