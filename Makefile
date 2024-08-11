.PHONY: nix

build: ./main.tex
	lualatex main.tex

build-nix: flake.nix flake.lock main.tex
	nix build -o main.pdf
