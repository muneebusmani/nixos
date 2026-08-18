{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "https://releases.nixos.org/nixos/unstable/nixos-26.11pre1055335.e5bdc4a41d4c/nixexprs.tar.xz";
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
    # hyprmod-src = {
    #   url = "github:BlueManCZ/hyprmod";
    #   flake = false;
    # };

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
      # hyprmod-src,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      waybarWeatherPkg = pkgs.callPackage ./system/kool/pkgs/waybar-weather.nix { };
      # hyprlandBindings = pkgs.callPackage ./system/kool/pkgs/hyprland-python-bindings.nix { };
      # hyprmodPkg = pkgs.callPackage ./system/kool/pkgs/hyprmod.nix {
      #   hyprmodSrc = hyprmod-src;
      #   inherit hyprlandBindings;
      # };

    in
    {
      packages.${system} = {
        waybar-weather = waybarWeatherPkg;
        # hyprmod = hyprmodPkg;
      };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
            spicetify-nix.nixosModules.default
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
