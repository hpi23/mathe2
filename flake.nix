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
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      devShells.default = pkgs.mkShell {
        name = "Mathe II";

        buildInputs = with pkgs; [
            texlive.combined.scheme-full
        ];

        shellHook = ''
          # if running from zsh, reenter zsh
          if [[ $(ps -e | grep $PPID) == *"zsh" ]]; then
            zsh
            exit
          fi
        '';
      };

      formatter = nixpkgs.legacyPackages.${system}.alejandra;
    });
}
