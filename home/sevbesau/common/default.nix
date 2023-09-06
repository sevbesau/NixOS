{ inputs, lib, pkgs, config, outputs, ... }:
{
  imports = [
    ../features/bash.nix
    ../features/inputrc.nix
    ../features/vscode.nix
  ];
  
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
  
  programs.home-manager.enable = true;
  
  home = {
    username = "sevbesau";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.05";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
  
  home.packages = with pkgs; [
    _1password-gui
    nodejs_18
    nodePackages.pnpm
    htop
  ];
  
  programs.neovim = {
    enable = true;
  };
  
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
      # TODO
      # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      #   onepassword-password-manager
      # ];
    };
  }
  
  programs.git = {
    enable = true;
    userName = "sevbesau";
    userEmail = "seppe@sevbesau.xyz";
  };
  
  programs.urxvt = {
    enable = true;
    fonts = [ "xft:monospace:size=18" ];
    scroll.bar.enable = false;
  };
  
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