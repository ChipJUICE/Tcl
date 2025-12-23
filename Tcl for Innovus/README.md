# Cadence Innovus – Physical Design TCL Flow (RTL → GDSII)

This folder contains the complete **Cadence Innovus TCL-based physical design flow**, taking a synthesized netlist through **floorplanning, placement, CTS, routing, signoff, and GDSII generation**.

The flow emphasizes **macro-aware design**, **timing closure**, and **signoff-quality deliverables**.

---

## Purpose

- Perform full-chip ASIC physical design
- Handle SRAM macros and power planning
- Achieve post-route timing closure
- Generate DRC-clean, LVS-ready GDSII

---

## Script Overview (Execution Order)

### init_innovus.tcl
- Loads netlist, LEFs, libraries, and constraints
- Initializes the Innovus design database

**Why:** Establishes a consistent physical design starting point.

---

### mmmc.tcl
- Defines library sets, RC corners, and analysis views

**Why:** Enables signoff-quality multi-corner timing analysis.

---

### floorplan.tcl
- Defines die/core size and placement rows

**Why:** Floorplan quality directly impacts congestion and timing.

---

### macro_placement.tcl
- Places SRAM macros
- Adds placement keepouts and routing blockages

**Why:** Prevents routing and DRC issues near macros.

---

### powerplan.tcl
- Builds power rings and stripes
- Special-routes VDD/VSS

**Why:** Ensures robust and IR-drop-safe power delivery.

---

### place_opt.tcl
- Standard cell placement
- Pre-CTS timing optimization

**Why:** Reduces congestion and early timing violations.

---

### cts.tcl
- Builds the clock tree
- Performs post-CTS optimization

**Why:** Controls skew, latency, and clock quality.

---

### route.tcl
- Global and detailed routing
- Post-route optimization and DRC checks

**Why:** Produces manufacturable routing and clears final timing.

---

### signoff.tcl
- Signoff timing analysis
- Exports post-route netlist and parasitics (optional)

**Why:** Generates handoff-quality signoff data.

---

### export_gds.tcl
- Writes DEF and final GDSII

**Why:** Produces the final silicon-ready layout.

---

## How to Run

```bash
innovus -64 -batch -files run_innovus_flow.tcl | tee innovus.log
```

---

## Outputs

- .enc databases at each stage
- Timing and congestion reports
- Post-route netlist
- DEF and final GDSII

---

## Key Features

- Macro-aware routing blockages
- Power-aware floorplanning
- Timing-driven placement and CTS
- Post-route hold-fix capability

---

