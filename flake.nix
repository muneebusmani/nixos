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
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      catppuccin,
      spicetify-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      waybarWeatherPkg = pkgs.callPackage ./system/kool/pkgs/waybar-weather.nix { };
    in
    {
      packages.${system} = {
        waybar-weather = waybarWeatherPkg;
      };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            # NixOS Configuration
            ./system
            ./modules
            nur.modules.nixos.default
            home-manager.nixosModules.home-manager
            catppuccin.nixosModules.catppuccin

            # Home Manager Configuration
            {
              home-manager = {
                useGlobalPkgs = true;
                extraSpecialArgs = { inherit inputs; };
                useUserPackages = true;
                users.muneeb = {
                  imports = [
                    ./home
                  ];
                };
                sharedModules = [
                  catppuccin.homeModules.catppuccin
                  spicetify-nix.homeManagerModules.default
                ];

              };
            }

          ];
        };
      };
    };
}
