{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixos-hardware = {
    #   url = "github:NixOS/nixos-hardware";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    catppuccin.url = "github:catppuccin/nix";
  };
  outputs =
    {
      self,
      nixpkgs,
      # nixos-hardware,
      home-manager,
      nur,
      catppuccin,
      spicetify-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            # nixos-hardware.nixosModules.dell-xps-15-9550
            spicetify-nix.nixosModules.default
            ./configuration.nix
            nur.modules.nixos.default
            home-manager.nixosModules.home-manager
            catppuccin.nixosModules.catppuccin
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
