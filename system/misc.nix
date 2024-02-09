{ config, pkgs, ... }: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Karachi";
  environment.pathsToLink = [ "/libexec" ];
  powerManagement.cpuFreqGovernor = "schedutil";
  services.thermald.enable = true;
  system.autoUpgrade = {
  	enable = true;
  	allowReboot=true;
  };
  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
    packageOverrides = pkgs: {
      nur = import
        (builtins.fetchTarball {
          url = "https://github.com/nix-community/NUR/archive/master.tar.gz";
          sha256 = "04387gzgl8y555b3lkz9aiw9xsldfg4zmzp930m62qw8zbrvrshd";
        }
        )
        {
          inherit pkgs;
        };
    };

  };
  nix.settings.auto-optimise-store = true;
}
