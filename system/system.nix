{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ./misc.nix
    ./locale.nix
    ./packages.nix
    ./bootloader.nix
  ];
}
