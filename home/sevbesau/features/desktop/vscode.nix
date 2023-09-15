{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      esbenp.prettier-vscode
      asvetliakov.vscode-neovim
      bbenoist.nix
      bradlc.vscode-tailwindcss
      eamodio.gitlens
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "volar";
        publisher = "vue";
        version = "1.8.11";
        sha256 = "637be102ba685c2187b3f038efbd7a5c191bb462afea4a1ea59b66fee918ee4f";
      }
      {
        name = "vscode-typescript-vue-plugin";
        publisher = "vue";
        version = "1.8.11";
        sha256 = "b9bbd20f3b67d1c60d33287e0a6ee5e3c37ac27d59b7a2d6a67c3cebd89d83ba";
      }

    ];
    userSettings = {
      "keyboard.dispatch" = "keyCode";
      "window.zoomLevel" = 2;
      "editor.tabSize" = 2;
      "editor.minimap.enabled" = false;
      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "workbench.colorTheme" = "Monokai";
      "extensions.autoCheckUpdates" = false;
      "extensions.autoUpdate" = false;
      "git.autofetch" = true;
      "git.confirmSync" = false;
    };
  };
}
