{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        # Replace 'nixos' with your hostname if different
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            # Hardware module directly from flake input instead of <nixos-hardware/...>
            nixos-hardware.nixosModules.dell-xps-15-9550-nvidia

            # Home-Manager NixOS Module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.muneeb = import ./home/home.nix;
            }
          ];
        };
      };
    };
}
