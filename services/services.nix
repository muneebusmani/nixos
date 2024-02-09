{ config, pkgs, ... }: {
  imports =
    [
      ./sound.nix
      ./xserver.nix
      ./preload.nix
      ./warp.nix
      ./gvfs.nix
      ./xcape.nix
      #./picom.nix
      #./redshift.nix
      #./keyring.nix
      #./blueman.nix
      #./flatpak.nix
    ];
}
