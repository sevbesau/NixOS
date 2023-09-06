{ pkgs, ... }:
{
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings.allowed-users = [
      "@wheel"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
      # keep last 3 generations
      options = "delete-older-than +3"
    };
  };
}