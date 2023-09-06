{
  description = "flake for switchblade";
  
  inputs = {
    nikpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  
  outputs = { self, nikpkgs }: 
  {
    nixosConfigurations = {
      sevbesau = nikpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/switchblade
        ];
      };
    };
  };
}