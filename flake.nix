{
  description = "My NixOS config";

  imputs = {
    hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
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
  };
  
  outputs = {}@inputs:
  {
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" ]; # for rbpi or other ARM: "aarch64-linux" 
      forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
      pkgsFor = nixpkgs.legacyPackages;
    in 
    {
      inherit lib;

      nixosConfigurations = {
        # Desktop
        # guillotine = lib.nixosSystem {
        #   modules = [ ./hosts/guillotine ];
        #   specialArgs = { inherit inputs outputs; };
        # };
        # Laptop
        switchblade = lub.nixosSystem {
          modules = [ ./hosts/switchblade ];
          specialArgs = { inherit inputs outputs; };
        };
      };

      homeConfigurations = {
        # # Desktop
        # "sevbesau@guillotine" = lib.homeManagerConfiguration {
        #   modules = [ ./home/sevbesau/guillotine.nix ];
        #   pkgs = pkgsFor.x86_64-linux;
        #   extraSpecialArgs = { inherit inputs outputs; };
        # };
        # Laptop
        "sevbesau@switchblade" = lib.homeManagerConfiguration {
          modules = [ ./home/sevbesau/switchblade.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
      }
    };
  };
}