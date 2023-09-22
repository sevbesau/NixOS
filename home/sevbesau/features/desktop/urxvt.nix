{ config, ... }:
let
  inherit (config.colorScheme) colors;
in
{
  programs.urxvt = {
    enable = true;
    fonts = [ "xft:monospace:size=18, xft:JoyPixels:size=18, Noto Color Emoji:size=18" ];
    scroll.bar.enable = false;
    extraConfig = {
      "perl-ext-common" = "zoom";
      "perl-lib" = "${config.home.profileDirectory}/lib/urxvt/perl";
      "keysym.C-equal" =  "perl:zoom:in"
      "keysym.C-minus" =  "perl:zoom:out"
      "keysym.C-plus" =  "perl:zoom:eq"

      "*.foreground" = "#${colors.base07}";
      "*.cursorColor" = "#${colors.base07}";
      "*.background" = "#${colors.base00}";
      "*.color0" = "#${colors.base00}";
      "*.color1" = "#${colors.base01}";
      "*.color2" = "#${colors.base02}";
      "*.color3" = "#${colors.base03}";
      "*.color4" = "#${colors.base04}";
      "*.color5" = "#${colors.base05}";
      "*.color6" = "#${colors.base06}";
      "*.color7" = "#${colors.base07}";
      "*.color8" = "#${colors.base08}";
      "*.color9" = "#${colors.base09}";
      "*.color10" = "#${colors.base0A}";
      "*.color11" = "#${colors.base0B}";
      "*.color12" = "#${colors.base0C}";
      "*.color13" = "#${colors.base0D}";
      "*.color14" = "#${colors.base0E}";
      "*.color15" = "#${colors.base0F}";
    };
  };
}