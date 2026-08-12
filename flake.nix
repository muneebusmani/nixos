{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, catppuccin, nur, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; }; 
          modules = [
            ./configuration.nix
            nur.modules.nixos.default 
            nixos-hardware.nixosModules.dell-xps-15-9550-nvidia
            home-manager.nixosModules.home-manager
            catppuccin.nixosModules.catppuccin
            # Add this block to give Home Manager access to Catppuccin
            {
              home-manager.sharedModules = [
                catppuccin.homeModules.catppuccin
              ];
            }
          ];
        };
      };
    };
}
