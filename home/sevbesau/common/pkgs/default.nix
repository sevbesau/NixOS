{pkgs, ...}: let
  callPackage = pkgs.callPackage;
in {
  nixpkgs.overlays = [(final: prev: {
    mypackages = {
      monokai-gtk = callPackage ./monokai-gtk.nix {};
    };
  })];
}