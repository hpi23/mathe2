.PHONY: nix

nix: flake.nix
	nix flake update

build: ./main.tex
	lualatex main.tex
