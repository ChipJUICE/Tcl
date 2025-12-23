# ==============================================================================
# init_innovus.tcl
# Purpose: Load tech + netlist + constraints; create Innovus design database
# Description:
#   This script initializes the Innovus design database by loading the
#   necessary technology files, netlist, and constraints. It also creates
#   output directories for results and reports.
# ==============================================================================

set DESIGN_NAME      <TOP_MODULE_NAME>       ;# e.g., riscv_tcm_top
set PROJ_DIR         <PROJECT_ROOT>
set NETLIST          $PROJ_DIR/<dc_out_dir>/${DESIGN_NAME}_syn.v
set SDC_FILE         $PROJ_DIR/<dc_out_dir>/${DESIGN_NAME}.sdc

# Tech / physical collateral placeholders
set TECH_LEF         <path_to_tech.lef>
set STD_LEF          <path_to_stdcell.lef>
set MACRO_LEFS       [list <path_to_sram_macro.lef>]
set LIBS_TT          [list <path_to_stdcell_tt.lib> <path_to_macro_tt.lib>]
set QRC_TECH         <path_to_qrcTechFile_or_qrc>
set MMMC_FILE        $PROJ_DIR/<mmmc_dir>/mmmc.tcl

# Create output dirs
set OUT_DIR          $PROJ_DIR/<innovus_out_dir>
set RPT_DIR          $PROJ_DIR/<innovus_rpt_dir>
file mkdir $OUT_DIR
file mkdir $RPT_DIR

# Load LEFs
# Why: LEF defines cell geometry, routing layers, macro abstracts
set init_lef_file [concat $TECH_LEF $STD_LEF $MACRO_LEFS]

# Load netlist
# Why: Gate-level connectivity from DC
set init_verilog $NETLIST
set init_top_cell $DESIGN_NAME

# Timing / constraints
# Why: SDC guides placement/CTS/route optimization for timing closure
set init_sdc_file $SDC_FILE

# MMMC (recommended)
# Why: Multi-mode/multi-corner timing views in Innovus
# If you use MMMC, you typically set init_mmmc_file instead of init_sdc_file
set init_mmmc_file $MMMC_FILE

# Power/Ground net names
# Why: Needed for special routing and checks
set init_pwr_net <VDD_NAME>     ;# e.g., VDD
set init_gnd_net <VSS_NAME>     ;# e.g., VSS

# Initialize design database
init_design

# Basic checks
checkDesign -all > $RPT_DIR/checkDesign_init.rpt

# Save initial database
saveDesign $OUT_DIR/${DESIGN_NAME}_init.enc
