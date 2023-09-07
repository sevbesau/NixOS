{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.esbenp.prettier-vscode
      pkgs.vscode-extensions.asvetliakov.vscode-neovim
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.bradlc.vscode-tailwindcss
    ];
    userSettings = {
      "keyboard.dispatch" = "keyCode";
      "window.zoomLevel" = 2;
      "editor.tabSize" = 2;
      "editor.minimap.enabled" = false;
      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "workbench.colorTheme" = "Default Light Modern";
    };
  };
}