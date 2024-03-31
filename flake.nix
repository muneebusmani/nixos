{
  description = "My NixOS configuration";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: {
    nixosConfigurations =
      let
        system = "x86_64-linux"; # replace this with your actual system type
        pkgs = nixpkgs;
        #wslDistroName = builtins.getEnv "WSL_DISTRO_NAME";
        #isNixOS = builtins.getEnv "NIX_OS" == "nixos";
        #config = if system == "x86_64-darwin" then ./darwin/configuration.nix
        #         else if system == "x86_64-linux" && wslDistroName == "" then ./nixos/configuration.nix
        #         else if system == "x86_64-linux" && wslDistroName != "" && isNixOS then ./nixos-wsl/configuration.nix
        #         else if system == "x86_64-linux" && wslDistroName != "" && !isNixOS then ./wsl/configuration.nix
        #         else ./configuration.nix;
        config = ./nixos/configuration.nix;
      in
      {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ config ];
        };
      };
  };
}
