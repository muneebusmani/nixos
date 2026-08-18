{ _, ... }: {
  imports = [
    ./hardware.nix
    ./users.nix
    ./boot.nix
    ./desktop.nix
    ./dev.nix
    ./env.nix
    ./gaming.nix
    ./locale.nix
    ./misc.nix
    ./nvidia.nix
    ./packages.nix
    ./sound.nix
    ./tweaks.nix
    ./warp.nix
    ./wifi_bluetooth.nix
    ./nordvpn.nix
    ./theme.nix
    ./plymouth.nix
    ./kool
  ];
  system.stateVersion = "26.05";
}
