{ pkgs, ... }: {
  gtk.iconCache.enable = true;
  services = {
    libinput.enable = true;
    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandleLidSwitchDocked = "ignore";
    };
    printing.enable = true; # If you use printing
    gvfs.enable = true;
    fstrim.enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true; # If you use NVIDIA, keep this and configure drivers
    permittedInsecurePackages = [
      "dotnet-sdk-6.0.428"
      "dotnet-sdk-7.0.410"
      "aspnetcore-runtime-6.0.36"
      "aspnetcore-runtime-7.0.20"
      "broadcom-sta-6.30.223.271-63-7.1.5"
      "broadcom-sta-6.30.223.271-63-7.1.8"

    ];
  };
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      builders-use-substitutes = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  networking.hostName = "nixos"; # Replace with your hostname
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Karachi";
  # Enable RAM compression for better multitasking
  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';
  zramSwap.enable = true;
  programs = {
    gamemode.enable = true;
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      fuse3
      icu
      ncurses
      openssl
      util-linux
      libuuid
      libunwind
      libusb1
      libnotify
      glib
    ];
  };
  systemd = {
    oomd = {
      enable = true;
      enableRootSlice = true;
      enableUserSlices = true;
    };
  };
}
