{
  description = "Hosted hellolib with overlay";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        libPkg = pkgs.callPackage ./default.nix { };
      in {
        packages.default = libPkg;

        overlays.default = final: prev: {
          hellolib = prev.callPackage ./default.nix { };
        };

        devShells.default = pkgs.mkShell {
          packages = [ pkgs.cmake ];
        };
      });
}