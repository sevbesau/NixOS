{ inputs, outputs, ... }:
{
  imports = [
    ./locale.nix
    ./docker.nix
    ./fonts.nix
    ./nix.nix
    ./openssh.nix
    ./optin-persistance.nix
    ./sops.nix
    ./systemd-initrd.nix
  ];
  
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  
  nixpkgs.config.allowUnfree = true;
  
  environment.enableAllTerminfo = true;
  
  hardware.enableRedistributableFirmware = true;
}