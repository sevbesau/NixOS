{ pkgs, ... }:
{
  boot.plymouth = {
    enable = true;
    themePackages = with pkgs; [
      adi1090x-plymouth-themes
    ];
    # more nice themes: abstract_ring_alt cubes
    theme = "green_blocks";
  };
}