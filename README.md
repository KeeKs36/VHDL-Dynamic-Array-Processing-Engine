# VHDL Dynamic Array Processing Engine

A flexible and scalable digital hardware system implemented in VHDL, featuring interconnected computational units, multiplexers, and storage modules. This project demonstrates advanced modular design for parallel data processing, dynamic routing, and multi-level control.

## Overview

This engine is built around a 2x4 array of processing elements, each combining a computational unit (CU), storage units, and 4x1 multiplexers. The architecture supports dynamic input selection, configurable operations, and hierarchical data flow, enabling complex processing pipelines for digital systems.

## Key Features

- **Arrayed Modular Design:** Processing units arranged in a 2x4 matrix for parallel computation and flexible data movement.
- **Configurable Operations:** Each CU supports a wide range of arithmetic, logic, shift, and comparison functions.
- **Dynamic Data Routing:** 4x1 multiplexers allow each stage to select inputs from external sources or other processing units.
- **Integrated Storage:** 4-bit and 5-bit storage modules provide intermediate data retention and operation selection.
- **Testbenches Included:** Comprehensive simulation environments validate all modules and the complete system.

## Applications

- Digital signal processing
- Custom data pipelines
- FPGA-based computation
- Educational reference for modular VHDL design

## How to Use

1. Clone the repository to your local machine.
2. Open the VHDL source and testbench files in your preferred simulator (e.g., ModelSim, Vivado).
3. Run simulations to explore and verify the design’s functionality.
4. Adapt or extend the modules for your own digital system projects.

## License

Open-source for educational and research use. Contributions are welcome!

---

For questions or improvements, please open an issue or submit a pull request.
