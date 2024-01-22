{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ./misc.nix
    ./locale.nix
    ./packages.nix
    ./bluetooth.nix
    ./sessionVariables.nix
    ./bootloader.nix
    ./sudoRules.nix
  ];
}
