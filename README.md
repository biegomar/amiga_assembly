# amiga_assembly
A few small examples of assembler programming on an old AMIGA machine.

## Requirements

For developing and building this project, the **VS Code Amiga-Assembly Plugin** is required. This plugin provides the necessary tools and build configurations for Amiga assembler development.

### Plugin Installation
1. Open VS Code
2. Go to Extensions view (Ctrl+Shift+X)
3. Search for "Amiga Assembly"
4. Install the plugin by Paul Raingeard

## Build Process

The project uses a predefined build configuration provided by the Amiga-Assembly plugin.

### Build Configuration

The build task is already configured and uses:

- **VASM (Versatile Assembler)**: Assembler for Motorola 68000
  - Command: `vasmm68k_mot`
  - Parameters:
    - `-m68000`: Target processor Motorola 68000
    - `-Fhunk`: Amiga-Hunk file format
    - `-linedebug`: Include debug information

- **VLINK (Versatile Linker)**: Linker for the final executable
  - Command: `vlink`
  - Input files: `*.{s,S,asm,ASM}`
  - Output file: `../uae/dh0/sample`
  - Entry point: `sample.s`
  - Parameters:
    - `-bamigahunk`: Amiga-Hunk output format
    - `-Bstatic`: Static linking

### Running the Build

To build the project, you have the following options:

1. **Via Command Palette**:
   - Press `Ctrl+Shift+P`
   - Type "Tasks: Run Task"
   - Select "amigaassembly: build"

2. **Via Keyboard Shortcut**:
   - Press `Ctrl+Shift+B` (Default build task)

3. **Via Terminal**:
   - The plugin automatically executes the appropriate VASM/VLINK commands

### Output

After a successful build, the executable file `sample` is created in the `uae/dh0/` directory. This can be run directly in an Amiga emulator.

## Launch Configuration

The Amiga-Assembly plugin includes integrated emulator support, allowing you to run your assembled programs directly from VS Code. Two emulators are bundled with the plugin:

### Available Emulators
- **WinUAE**: Full-featured Amiga emulator
- **FS-UAE**: Cross-platform Amiga emulator

### Running the Program

After building, you can launch your program directly in an emulator:

1. **Via Command Palette**:
   - Press `Ctrl+Shift+P`
   - Type "Amiga Assembly: Run"
   - Select your preferred emulator

2. **Via Debug Menu**:
   - Press `F5` to start debugging
   - The program will launch in the configured emulator

3. **Via Run and Debug Panel**:
   - Open the Run and Debug view (Ctrl+Shift+D)
   - Select the appropriate launch configuration
   - Click the play button

### Emulator Configuration

The plugin automatically configures the emulator with:
- Appropriate Kickstart ROM (if available)
- Hard drive mounted to `uae/dh0/`
- Optimal settings for development

The built executable will be automatically loaded and executed in the emulator environment.
