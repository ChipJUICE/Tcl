# ==============================================================================
# setup.tcl  (Design Compiler)
# Purpose: Define libraries, search paths, link/target libs, and common variables
# ==============================================================================

# Project identifiers (used in outputs)
set DESIGN_NAME          <TOP_MODULE_NAME>       ;# e.g., riscv_tcm_top
set CLK_PORT             <CLK_PORT_NAME>         ;# e.g., clk_i
set RST_PORT             <RESET_PORT_NAME>       ;# e.g., rst_ni

# Directories (placeholders)
set PROJ_DIR             <PROJECT_ROOT>
set RTL_DIR              $PROJ_DIR/<rtl_dir>
set OUT_DIR              $PROJ_DIR/<dc_out_dir>
set RPT_DIR              $PROJ_DIR/<dc_rpt_dir>
set CONSTRAINTS_DIR      $PROJ_DIR/<constraints_dir>
set TECH_DIR             $PROJ_DIR/<tech_lib_dir>

file mkdir $OUT_DIR
file mkdir $RPT_DIR

# Search path for RTL + libraries
# Why: DC needs to find RTL include files + tech .db libs
set_app_var search_path [list . $RTL_DIR $TECH_DIR]

# Technology libraries
# Why: target_library drives cell choices; link_library resolves references
set TARGET_LIBS [list \
  <stdcell_typical.db> \
]
set LINK_LIBS   [concat "*" $TARGET_LIBS <memories_or_io.db_if_any>]

set_app_var target_library $TARGET_LIBS
set_app_var link_library   $LINK_LIBS

# Optional: symbol library (for older flows / GUI)
# set_app_var symbol_library [list <generic.sdb>]

# HDL parsing options
# Why: keep names stable and improve debug friendliness
set_app_var hdlin_keep_comments true
set_app_var hdlin_preserve_sequential true
set_app_var verilogout_no_tri true

# Naming rules (avoid illegal chars in downstream tools)
define_name_rules verilog -allowed "A-Za-z0-9_[]" -max_length 255
