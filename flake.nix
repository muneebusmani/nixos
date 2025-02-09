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
      nixosConfig = import "${baseDir}/nixos/configuration.nix" { inherit system pkgs lib; };
      homeManagerConfig = import "${baseDir}/nixos/home/home" { inherit system pkgs lib; };
      nixosWSLConfig = import "${baseDir}/wsl/config" { inherit system pkgs lib;};
      homeManagerWSLConfig =import "${baseDir}/wsl/home" { inherit system pkgs lib; };

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
            nixosWSLConfig.system
            home-manager.nixosModules.home-manager
          ];
        };
        test = {
          system = system;
          modules = [ ]; # Empty modules list for now
        };

      };

      homeConfigurations = {
        muneeb = home-manager.homeManager.lib.homeManager.mkDefault { # Replace "muneeb" with your username
          pkgs = import nixpkgs { inherit system; };
          modules = [ homeManagerConfig.home ]; # Add this line!
        };
        muneeb_wsl = home-manager.homeManager.lib.homeManager.mkDefault { # Replace "muneeb" with your username
          pkgs = import nixpkgs { inherit system; };
          modules = [ homeManagerWSLConfig.home ]; # Add this line!
        };
      };
    };
}
