# Tcl-Based ASIC Design Automation Repository  
**From Tcl Fundamentals to RTL → GDSII Physical Design**

This repository provides a **structured, end-to-end learning and execution framework** for using **Tcl scripting in VLSI and ASIC design flows**.  
It starts from **basic Tcl programming concepts** and progresses to **industry-standard EDA automation** using **Synopsys Design Compiler** and **Cadence Innovus**.

The objective of this repository is to demonstrate how **Tcl serves as the backbone of modern ASIC design automation**, enabling reproducible, scalable, and tool-driven RTL-to-GDSII flows.

---

## 📂 Repository Structure

```
.
├── Introduction to Tcl/
├── Tcl for Design Compiler/
├── Tcl for Innovus/
└── README.md
```

---

## 1️⃣ Introduction to Tcl

📁 **Introduction to Tcl/**

This folder builds **core Tcl proficiency** required before applying the language to EDA tools.

### Contents
- `HelloWorldBasics.tcl` – Tcl syntax, variables, and basics  
- `Array_String.tcl` – Arrays, strings, and indexing  
- `List.tcl` – List creation and manipulation  
- `Loops.tcl` – Iterative constructs (`for`, `foreach`, `while`)  
- `Cond_Proc.tcl` – Conditionals and procedures  
- `Files.tcl` – File I/O and text processing  
- `README.md` – Concept explanations

### Purpose
- Learn Tcl control flow and data structures  
- Understand file-driven automation  
- Prepare for EDA scripting workflows  

---

## 2️⃣ Tcl for Synopsys Design Compiler (Synthesis)

📁 **Tcl for Design Compiler/**

This folder contains **Tcl scripts for RTL synthesis** using **Synopsys Design Compiler**, forming the **front-end of the ASIC flow**.

### Key Scripts
- `setup.tcl` – Library setup, search paths, environment configuration  
- `constraints.tcl` – Clock, I/O, and timing constraints  
- `run_dc.tcl` – End-to-end synthesis driver  
- `README.md` – Detailed synthesis flow documentation  

### Flow Summary
- RTL → Gate-level netlist  
- Timing-driven synthesis  
- Generation of:
  - Synthesized netlist  
  - SDC for physical design  
  - Timing, area, power, and QoR reports  

### Concepts Demonstrated
- Constraint-driven synthesis  
- Timing optimization  
- Clean handoff to physical design  

---

## 3️⃣ Tcl for Cadence Innovus (Physical Design)

📁 **Tcl for Innovus/**

This folder implements a **complete Cadence Innovus physical design flow**, taking a synthesized netlist through **floorplanning to final GDSII**.

### Key Scripts
- `init_innovus.tcl` – Design and technology initialization  
- `mmmc.tcl` – Multi-Mode Multi-Corner timing setup  
- `floorplan.tcl` – Die and core definition  
- `macro_placement.tcl` – SRAM macro placement and routing blockages  
- `place_opt.tcl` – Placement and pre-CTS optimization  
- `cts.tcl` – Clock Tree Synthesis  
- `export_gds.tcl` – DEF and GDSII generation  
- `README.md` – Stage-by-stage flow explanation  

### Flow Summary
- Floorplanning and macro-aware layout  
- Power-aware placement and optimization  
- Clock tree synthesis and routing  
- Post-route timing closure  
- Final GDSII generation  

---

## 🔁 End-to-End Flow Overview

```
Tcl Fundamentals
      ↓
RTL Synthesis (Design Compiler)
      ↓
Gate-Level Netlist + SDC
      ↓
Physical Design (Innovus)
      ↓
GDSII (Silicon-Ready Layout)
```

---

## 🧠 Why This Repository Matters

- Demonstrates **industry-standard ASIC automation**
- Shows **tool-level Tcl expertise**
- Covers complete **RTL → GDSII flow**
- Suitable for:
  - VLSI / SoC coursework  
  - Physical Design interviews  
  - ASIC CAD / EDA roles  

---

## 🎯 Intended Audience

- ASIC / Physical Design Engineers  
- VLSI and Computer Engineering students  
- Researchers learning physical design automation  

---

## ⚙️ Tools Referenced

- Synopsys Design Compiler  
- Cadence Innovus  

---

## 📌 Notes

- Scripts are **parameterized and reusable**
- Technology-node agnostic  
- Focused on clarity, correctness, and reproducibility  

---

📬 *Feel free to fork, adapt, and extend this repository for your own ASIC projects.*
