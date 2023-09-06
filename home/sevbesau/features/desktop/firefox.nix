{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
      extensions = with pkgs.inputs.firefox-addons; [
        ublock-origin
        onepassword-password-manager
      ];
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}