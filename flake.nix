{
  description = "Screplit: A replit extension for web scraping";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShells = {
          default = pkgs.mkShell {
            nativeBuildInputs = [ pkgs.bun pkgs.just ];
            shellHook = ''
              bun install
            '';
          };
        };
      });
}
