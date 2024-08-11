# Mathe II

© Copyright: **Jan B.** created the majority of the visible content.

## How do I build the PDF?

### With just `lualatex`

If you already have a working LaTeX installation (`lualatex`) then you can use that to build the pdf.
To run the build, execute `make build` in the project root.
This will generate a `main.pdf` file in the root, which you can open with any pdf viewer.

### With Nix

If you don't want to setup a full LaTeX toolchain on your system you can use [Nix](https://nixos.org/) to fully automate the setup and build process.

Just run `nix build -o main.pdf` to build the pdf.
This will generate a `main.pdf` file in the root, which you can open with any pdf viewer.
Note that this is just a symlink, and therefore might not support all of the operations of a normal file.
