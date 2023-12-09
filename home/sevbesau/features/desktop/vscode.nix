{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    aspellDicts.nl
  ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      bbenoist.nix
      bradlc.vscode-tailwindcss
      eamodio.gitlens
      github.vscode-pull-request-github
      github.vscode-github-actions
      tomoki1207.pdf
      ms-azuretools.vscode-docker
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      humao.rest-client
      ms-vsliveshare.vsliveshare
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
      {
        name = "code-spell-checker";
        publisher = "streetsidesoftware";
        version = "3.0.1";
        sha256 = "29e604ebfc8eda7dd11cf8e724e9cec87b33e175bcd72f406e4482fc8f7be644";
      }
      {
        name = "code-spell-checker-dutch";
        publisher = "streetsidesoftware";
        version = "0.4.0";
        sha256 = "f9cf5f760c9c444d7e70f0aefba94c711705bb13f154dc6e0864bc8421005169";
      }
      {
        name = "pretty-ts-errors";
        publisher = "yoavbls";
        version = "0.5.2";
        sha256 = "83a2488977e340a404b5d5d982c42c96e2ae2593b432c0f58a3cbe40b604d6e6";
      }
      {
        name = "vscode-stripe";
        publisher = "Stripe";
        version = "2.0.14";
        sha256 = "918264ccf6f9f395a1916bd767dbb211032f7b5e447e344c8fb347b502596f3b";
      }
      {
        name = "vscode-dotnet-runtime";
        publisher = "ms-dotnettools";
        version = "2.0.0";
        sha256 = "a13795b2483dc9fa219415b81a18108f74ecc1e52867a5aec669edb22b29c4ea";
      }
      {
        name = "markdown-pdf";
        publisher = "yzane";
        version = "1.5.0";
        sha256 = "6a289f6601d70b819411b90a01b2dcd29fe3519c69d6317f27563f288caf2c81";
      }
    ];
    userSettings = {
      "terminal.external.linuxExec" = "urxvt";
      "update.mode" = "none";
      "keyboard.dispatch" = "keyCode";
      "window.zoomLevel" = 2;
      "window.menuBarVisibility" = "hidden";
      "editor.tabSize" = 2;
      "editor.minimap.enabled" = false;
      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "workbench.colorTheme" = "Monokai";
      "extensions.autoCheckUpdates" = false;
      "extensions.autoUpdate" = false;
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "files.autoSave" = "onFocusChange";
      "editor.codeActionsOnSave" = {
        "source.fixAll.eslint" = true;
      };
      "npm.enableRunFromFolder" = true;
      "debug.javascript.autoAttachFilter" = "always";
      "telemetry.telemetryLevel" = "off";
      "stripe.cliInstallPath" = "/home/sevbesau/.nix-profile/bin/stripe";

      "markdown-pdf.executablePath" = "/home/sevbesau/.nix-profile/bin/chromium";
      "markdown-pdf.displayHeaderFooter" = true;
      "markdown-pdf.headerTemplate" = "<div></div>";
    };
  };
}
