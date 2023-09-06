{ pkgs, ... }:
{
  fonts = {
    fonts = with pkgs; [
      nerdfonts
      joypixels
      noto-fonts
      noto-fonts-emoji
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "JoyPixels" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "JoyPixels" "Noto Color Emoji" ];
      monospace = [ "Hack Nerd Font Mono" "JoyPixels" "Noto Color Emoji" ];
      emoji = [ "Hack Nerd Font Mono" "JoyPixels" "Noto Color Emoji" ];
    };
  };
}
