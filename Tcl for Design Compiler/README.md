# Synopsys Design Compiler (DC) – TCL Flow

This folder contains all **TCL scripts used for RTL synthesis** using **Synopsys Design Compiler** as part of a complete **RTL → GDSII ASIC flow**.

The scripts are written to be **modular, reproducible, and technology-agnostic**, with placeholders that can be easily adapted to different designs and PDKs.

---

## Purpose

- Synthesize Verilog/SystemVerilog RTL into a **gate-level netlist**
- Apply **realistic timing and I/O constraints**
- Generate clean **handoff artifacts** for Cadence Innovus
- Preserve hierarchy and naming for physical design

---

## Script Overview

### setup.tcl
**Role:** Environment and library configuration

- Defines project paths and top module
- Sets `search_path`, `target_library`, and `link_library`
- Configures HDL parsing and naming rules

**Why:** Ensures RTL and libraries are correctly resolved and downstream-safe.

---

### constraints.sdc
**Role:** Timing and I/O intent

- Creates core clock (e.g., 300 MHz target)
- Adds clock uncertainty and transition
- Models external I/O delays and loads
- Applies false paths (e.g., async reset)

**Why:** Guides timing-driven synthesis and avoids over-optimistic timing.

---

### run_dc.tcl
**Role:** Main synthesis driver

- Analyzes and elaborates RTL
- Applies constraints and runs `compile_ultra`
- Generates timing, area, power, and QoR reports
- Writes synthesized netlist, SDC, and DDC

**Why:** Produces the authoritative synthesized netlist for P&R.

---

## How to Run

```bash
dc_shell -64 -f run_dc.tcl | tee dc.log
```

---

## Outputs

- *_syn.v – Gate-level netlist
- *.sdc – Constraints for Innovus
- *.ddc – Design Compiler database
- Timing, area, power, and QoR reports

---

## Notes

- All paths and names are parameterized using placeholders
- Supports designs with SRAM macros, debug, and telemetry logic
- Designed to integrate seamlessly with the Innovus TCL flow

---

## Intended Audience

- ASIC / SoC design students
- Physical design engineers
- Anyone learning industry-standard synthesis flows
