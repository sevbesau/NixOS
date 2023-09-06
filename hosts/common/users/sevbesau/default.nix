{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # users.mutableUsers = false; TODO setup sops
  users.users.sevbesau = {
    description = "Seppe Van Besauw";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "network"
      "i2c"
      "docker"
      "git"
    ];

    openssh.authorizedKeys.keys = [ (builtins.readFile ../../../../home/sevbesau/ssh.pub) ];
    # passwordFile = config.sops.secrets.sevbesau-password.path; # TODO setup sops
    packages = [ pkgs.home-manager ];
  };

  # TODO setup sops
  # sops.secrets.sevbesau-password = {
  #   sopsFile = ../../secrets.yaml;
  #   neededForUsers = true;
  # };

  home-manager.users.sevbesau = import ../../../../home/sevbesau/${config.networking.hostName}.nix;

  services.geoclue2.enable = true;
  # security.pam.services = { swaylock = { }; };
}