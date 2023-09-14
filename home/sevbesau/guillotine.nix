{ pkgs, inputs, outputs, ... }:
{
  imports = [
    ./common
    ./common/desktop/steam.nix
  ];
  
}