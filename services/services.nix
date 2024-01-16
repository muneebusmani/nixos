{ config, pkgs, ... }: {
  imports =
    [
      ./picom.nix
      ./sound.nix
      ./xserver.nix
      ./redshift.nix
    ];
}
