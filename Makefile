nix: flake.nix
	nix flake update

build:
	lualatex main.tex
