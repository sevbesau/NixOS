{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.users.sevbesau = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "minecraft"
      "network"
      "docker"
    ];

    openssh.authorizedKeys.keys = [ (builtins.readFile ../../../../home/sevbesau/ssh.pub) ];
    passwordFile = config.sops.secrets.sevbesau-password.path;
    packages = [ pkgs.home-manager ];
  };

  sops.secrets.sevbesau-password = {
    sopsFile = ../../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.sevbesau = import ../../../../home/sevbesau/${config.networking.hostName}.nix;

  services.geoclue2.enable = true;
  security.pam.services = { swaylock = { }; };
}