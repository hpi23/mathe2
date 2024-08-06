# Mathe II

© Copyright: **Jan B.** created the majority of the visible content.

## How do I build the PDF?

### Prerequisites

If you have the [Nix](https://nixos.org/) package manager installed, execute `nix develop` in the project root to enter a devshell.
The devshell installs all required software to build the PDF.

### Actual Build

We use `lualatex` as our Latex compiler.
To invoke it, execute `make build` in the project root.