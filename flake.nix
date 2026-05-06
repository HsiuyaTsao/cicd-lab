{
  description = "Nix development shell for cicd-lab";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nodejs_24
            act
            git
          ];

          shellHook = ''
            echo "Entered cicd-lab dev shell (Node $(node --version))"
          '';
        };
      });
}
