# 3D Printed Unit Cells Repository

Welcome to the 3D Printed Unit Cells repository. This repository contains OpenSCAD models for various unit cells relevant to the chemistry of solids. These models are designed to be 3D printed and serve as educational tools for visualizing crystal structures.

## Available Models

Currently, the repository includes the following unit cell models:

1. Simple Cubic
2. Face Centered Cubic (FCC)
3. Body Centered Cubic (BCC)

Each model consists of full spheres representing atoms as well as a "unit cell" model with the spheres cut off to illustrate the unit cell structure. The models are designed with built-in supports to facilitate printing without additional support structures.

## Printing Instructions

### Printer Compatibility
These models have been tested on a Prusa MK2 printer with a layer height of 0.2 mm using PLA filament. However, they should be compatible with other FDM printers with similar specifications.

### Printing Parameters
- Layer Height: 0.2 mm
- Filament: PLA (or compatible material)
- Supports: Built-in supports included in the models, no additional supports needed
- Infill: Recommended infill percentage according to your desired level of solidity

### Instructions
1. Clone or download this repository to your local machine.
2. Open the desired unit cell model file (.scad) using OpenSCAD.
3. Customize the model if necessary (e.g., adjust dimensions, change materials).
4. Generate the STL file by rendering the model in OpenSCAD.
5. Load the generated STL file into your preferred slicing software.
6. Configure slicing settings according to the provided printing parameters.
7. Slice the model and save the G-code file.
8. Transfer the G-code file to your 3D printer.
9. Start the printing process and ensure that the printer is properly calibrated.
10. Once the printing is complete, remove the printed model from the printer bed and clean up any excess material if necessary.

## TODO
- Create the Hexagonal Close Packed (HCP) model.

## Contributing
If you have suggestions for improvements or additional unit cell models, feel free to contribute to this repository by submitting pull requests.

Thank you for your interest in 3D Printed Unit Cells! Happy printing and exploring the world of crystal structures!

## License

The 3D printed unit cell models in this repository are licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/).

You are free to:

- Share: Copy and redistribute the material in any medium or format.
- Adapt: Remix, transform, and build upon the material.

Under the following terms:

- Attribution: You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
- NonCommercial: You may not use the material for commercial purposes.
- ShareAlike: If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

For more details about the license, please see the [full text](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode).
