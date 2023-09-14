{ pkgs, inputs, outputs, ... }:
{
  imports = [
    ./common
  ];
  
  home.packages = with pkgs; [
    steam
  ];
}