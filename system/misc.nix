{ config, pkgs, ...  }:{
  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true; # If you use NVIDIA, keep this and configure drivers
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  networking.hostName = "nixos"; # Replace with your hostname
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Karachi"; # Replace with your timezone
  services.printing.enable = true; # If you use printing
  services.gvfs.enable = true;
  nix.settings.substituters = [
    "https://nix-community.cachix.org"
  ];
  
  nix.settings.trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # stdenv.cc.cc
    # zlib
    # fuse3
    # icu
    # ncurses
    # openssl
    # util-linux
    # libuuid
    # libunwind
    # libusb1
    # libnotify
    # glib
    # xorg.libX11
    # xorg.libXcursor
    # xorg.libXrandr
    # xorg.libXinerama
    # xorg.libXi
    # xorg.libXext
    # xorg.libXfixes
    # xorg.libXrender
    # xorg.libXtst
    # libGL
    # libGLU
  ];
}
