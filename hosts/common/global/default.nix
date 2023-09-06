# This file (and the global directory) holds config that i use on all hosts
{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./docker.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    # ./openssh.nix
    ./packages.nix
    ./pipewire.nix
    ./printing.nix
    # ./sops.nix
    ./systemd-initrd.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  environment.enableAllTerminfo = true;

  hardware.enableRedistributableFirmware = true;
}