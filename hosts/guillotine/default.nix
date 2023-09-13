{ config, inputs, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      #inputs.hardware.nixosModules.common-cpu-intel
      # inputs.hardware.nixosModules.common-gpu-nvidia TODO
      #inputs.hardware.nixosModules.common-gpu-intel
      #inputs.hardware.nixosModules.common-pc-ssd
      #inputs.hardware.nixosModules.lenovo-thinkpad-t480

      ../common/global
      ../common/users/sevbesau

      ../common/optional/gnome.nix
    ];

  networking.hostName = "switchblade"; 

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
