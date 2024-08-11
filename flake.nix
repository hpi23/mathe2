{
  description = "Environment for maechtige Beweise.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };

      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-small latexmk helvetic;
      };
    in {
      packages.default =
        pkgs.stdenv.mkDerivation
        rec {
          name = "mathe2-tex-build";
          src = self;
          buildInputs = with pkgs; [coreutils tex];

          phases = ["unpackPhase" "buildPhase" "installPhase"];
          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";
            mkdir -p .cache/texmf-var
            env TEXMFHOME=.cache TEXMFVAR=.cache/texmf-var \
              latexmk -interaction=nonstopmode -pdf -pdflatex \
              main.tex
          '';
          installPhase = ''
            # mkdir -p $out
            cp main.pdf $out
          '';
        };

      formatter = nixpkgs.legacyPackages.${system}.alejandra;
    });
}
