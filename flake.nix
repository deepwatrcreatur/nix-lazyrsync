{
  description = "Nix flake for lazyrsync — safe terminal user interface for rsync";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        packages.lazyrsync = pkgs.callPackage ./package.nix { };
        packages.default = packages.lazyrsync;

        apps.lazyrsync = flake-utils.lib.mkApp { drv = packages.lazyrsync; };
        apps.default = apps.lazyrsync;

        devShells.default = pkgs.mkShell {
          inputsFrom = [ packages.lazyrsync ];
          packages = with pkgs; [
            cargo
            rustc
          ];
        };
      }
    )
    // {
      overlays.default = final: prev: {
        lazyrsync = final.callPackage ./package.nix { };
      };
    };
}
