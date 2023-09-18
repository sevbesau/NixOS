{
  description = "My NixOS configuration";
  
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable"; 
    };
    
    hardware.url = "github:nixos/nixos-hardware";
    sops-nix.url = "github:mic92/sops-nix";
    nix-colors.url = "github:misterio77/nix-colors";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland = {
    #   url = "github:hyprwm/hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hyprwm-contrib = {
    #   url = "github:hyprwm/contrib";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = [ "x86_64-linux" ]; # for ARM add: "aarch64-linux"
    forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
    pkgsFor = nixpkgs.legacyPackages;
  in
  {
    inherit lib;

    nixosConfigurations = {
      # Laptop
      switchblade = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/switchblade ];
        specialArgs = { inherit inputs outputs; };
      };
      # Desktop
      guillotine = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/guillotine ];
        specialArgs = { inherit inputs outputs; };
      };
    };
    
    homeConfigurations = {
      # Laptop
      "sevbesau@switchblade" = lib.homeManagerConfiguration {
        modules = [ ./home/sevbesau/switchblade.nix ];
        pkgs = pkgsFor.x86_64-linux; # for ARM use "aarch64-linux"
        extraSpecialArgs = { inherit inputs outputs; };
      };
      # Desktop
      "sevbesau@guillotine" = lib.homeManagerConfiguration {
        modules = [ ./home/sevbesau/guillotine.nix ];
        pkgs = pkgsFor.x86_64-linux; # for ARM use "aarch64-linux"
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
  };
}