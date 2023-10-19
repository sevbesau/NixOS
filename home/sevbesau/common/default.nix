{ inputs, lib, pkgs, config, outputs, ... }:
let
  inherit (inputs.nix-colors) colorSchemes;
in
{ 
  imports = [
    ../features/console/bash.nix
    ../features/console/git.nix
    ../features/console/inputrc.nix
    ../features/console/neovim.nix
    ../features/console/ssh.nix

    ../features/desktop/dconf.nix
    ../features/desktop/discord.nix
    ../features/desktop/firefox.nix
    ../features/desktop/slack.nix
    ../features/desktop/terminal.nix
    ../features/desktop/transmission.nix
    ../features/desktop/vscode.nix

    inputs.nix-colors.homeManagerModules.default
  ];
  
  colorScheme = {
    slug = "monokai";
    name = "Monokai";
    author = "Wimer Hazenberg (http://www.monokai.nl)";
    colors = {
      base00 = "#272822";
      base01 = "#f92672";
      base02 = "#a6e22e";
      base03 = "#f4bf75";
      base04 = "#66d9ef";
      base05 = "#ae81ff";
      base06 = "#a1efe4";
      base07 = "#f8f8f2";
      base08 = "#75715e";
      base09 = "#f92672";
      base0A = "#a6e22e";
      base0B = "#f4bf75";
      base0C = "#66d9ef";
      base0D = "#ae81ff";
      base0E = "#a1efe4";
      base0F = "#f9f8f5";
    };
  };
  
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
  
  home = {
    username = "sevbesau";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.05";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      EDITOR = "nvim";
    };
    packages = with pkgs; [
      nodejs_18
      nodePackages.pnpm
      htop
      yarn-berry
      nest-cli
      wl-clipboard
      mongodb-compass
    ];
  };

  # Lets home-manager update itself
  programs.home-manager.enable = true;
 
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = null;
    publicShare = null;
    templates = null;
    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/downloads";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/pictures";
    videos = "${config.home.homeDirectory}/videos";
  };
}