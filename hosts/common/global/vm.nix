{ pkgs, ... }:
{
  programs.dconf.enable = true; # virt-manager requires dconf to remember settings
  
  users.users.sevbesau.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [ 
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
  ];
  
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

}