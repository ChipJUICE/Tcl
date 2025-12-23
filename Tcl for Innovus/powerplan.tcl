# ==============================================================================
# powerplan.tcl
# Purpose: Build robust VDD/VSS distribution (rings/stripes) and connect macros
#         and standard cells to power grid.
# ==============================================================================

# Global nets
# Why: Connect logical VDD/VSS to physical power pins
globalNetConnect <VDD_NAME> -type pgpin -pin <VDD_PIN> -inst * -verbose
globalNetConnect <VSS_NAME> -type pgpin -pin <VSS_PIN> -inst * -verbose
globalNetConnect <VDD_NAME> -type tiehi -inst * -verbose
globalNetConnect <VSS_NAME> -type tielo -inst * -verbose

# Core ring
# Why: Low-impedance boundary power distribution around core
addRing -nets [list <VDD_NAME> <VSS_NAME>] \
  -layer [list top <M_TOP> bottom <M_TOP> left <M_RIGHT> right <M_RIGHT>] \
  -width <RING_W> -spacing <RING_S> -offset <RING_OFF>

# Power stripes
# Why: Deliver current across core and reduce IR drop
addStripe -nets [list <VDD_NAME> <VSS_NAME>] \
  -layer <STRIPE_LAYER> -width <STRIPE_W> -spacing <STRIPE_S> \
  -set_to_set_distance <PITCH> -direction <vertical_or_horizontal>

# Special route PG
# Why: Ensures PG connectivity to stdcells/macros
sroute -connect {corePin padPin blockPin} -nets [list <VDD_NAME> <VSS_NAME>]

# Save
saveDesign $OUT_DIR/${DESIGN_NAME}_power.enc
