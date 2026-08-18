{ _, ... }: {
  imports = [
    ./boot.nix
    ./fonts.nix
    ./intel-drivers.nix
    ./local-hardware-clock.nix
    ./misc.nix
    ./packages.nix
    ./portals.nix
    ./quickshell.nix
    ./sys-pkgs.nix
    ./overlays.nix
    # ./hyprmod.nix
  ];

}
