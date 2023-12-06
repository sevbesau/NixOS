{pkgs, ...}: let
  callPackage = pkgs.callPackage;
in {
  nixpkgs.overlays = [(final: prev: {
    mypackages = {
      gtk-theme = callPackage ./gtk-theme.nix {};
    };
  })];
}