# nix-lazyrsync

Nix flake packaging for [lazyrsync](https://github.com/westpoint-io/lazyrsync) — a safe terminal user interface for `rsync`.

## Usage

### Run directly with Flakes

```bash
nix run github:deepwatrcreatur/nix-lazyrsync
```

### Add to a NixOS / Home Manager Configuration

```nix
{
  inputs = {
    nix-lazyrsync.url = "github:deepwatrcreatur/nix-lazyrsync";
  };

  outputs = { self, nixpkgs, nix-lazyrsync, ... }: {
    # Overlay usage:
    # nixpkgs.overlays = [ nix-lazyrsync.overlays.default ];

    # Direct package usage:
    # environment.systemPackages = [ nix-lazyrsync.packages.${system}.default ];
  };
}
```
