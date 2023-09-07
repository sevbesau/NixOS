{ pkgs, ... }:
{
  # graphical boot
  boot.plymouth = {
    enable = true;
    themePackages = with pkgs; [
      adi1090x-plymouth-themes
    ];
    theme = "green_blocks";
  };
}