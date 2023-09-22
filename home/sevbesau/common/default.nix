{ inputs, lib, pkgs, config, outputs, ... }:
let
  inherit (inputs.nix-colors) colorSchemes;
in
{ 
  imports = [
    ../features/scripts/git-prompt.nix

    ../features/console/bash.nix
    ../features/console/git.nix
    ../features/console/inputrc.nix
    ../features/console/neovim.nix

    ../features/desktop/dconf.nix
    ../features/desktop/discord.nix
    ../features/desktop/firefox.nix
    ../features/desktop/slack.nix
    ../features/desktop/terminal.nix
    ../features/desktop/transmission.nix
    ../features/desktop/vscode.nix

    inputs.nix-colors.homeManagerModules.default
  ];
  
  colorScheme = lib.mkDefault colorSchemes.monokai;
  
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
  
  programs.thunderbird = {
    enable = true;
    profiles = {
      "Siliconminds" = {
        isDefault = true;
      };
    };
  };
  
  accounts.email.accounts = {
    "Siliconminds" = {
      address = "seppe@siliconminds.be";
      primary = true;
      realName = "Seppe Van Besauw";
      thunderbird = {
        enable = true;        
        profiles = [ "Siliconminds" ];
      };
      # signature = {
      # };
      imap = {
        host = "imap.gmail.com";
        port = 993;
        # tls = {
        #   useStarTls = true;
        # }
      };

    };
  };
}