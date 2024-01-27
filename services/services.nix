{ config, pkgs, ... }: {
  imports =
    [
      ./sound.nix
      ./xserver.nix
      ./preload.nix
      ./warp.nix
      ./gvfs.nix
      #./picom.nix
      #./redshift.nix
      #./xcape.nix
      #./keyring.nix
      #./blueman.nix
      #./flatpak.nix
    ];
}
