{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Or a specific commit hash!
    home-manager = {
      url = "github:nix-community/home-manager/master"; # Or a specific commit hash!
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
        nixos_wsl = { # lib.mkDefault { 
          system = system;
          modules = [
            "${baseDir}/wsl/config.nix"
            home-manager.nixosModules.home-manager
          ];
        };

      };


      homeConfigurations = {
        muneeb = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [ "${baseDir}/nixos/home/home.nix" ]; # Ensure this file exists!
        };
        muneeb_wsl = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [ "${baseDir}/wsl/home.nix" ];
        };
      };

    };
}
