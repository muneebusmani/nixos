{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05"; 
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux"; # Or your system architecture
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
      baseDir = "/home/muneeb/dotfiles";

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          system = system;
          modules = [
            "${baseDir}/nixos/configuration.nix"
            home-manager.nixosModules.home-manager
          ];
        };
      };

      homeConfigurations = {
        muneeb = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [ "${baseDir}/nixos/home/home.nix" ]; # Ensure this file exists!
        };
      };

    };
}
