{
  description = "My configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    garuda.url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
  };

  outputs = { garuda, nixpkgs, ... }: {
    nixosConfigurations = {
      hostname = garuda.lib.garudaSystem {
        system = "x86_64-linux";
	pkgs = import nixpkgs; {
          inherit system;
          config.allowUnfree = true;
      	};
      	pkgsUnstable = import nixpkgs-unstable; {
          inherit system;
	  config.allowUnfree = true;
      	};
        modules = [
          ./configuration.nix # Your system configuration.
        ];
      };
    };
  };
}
