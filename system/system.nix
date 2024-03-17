{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ./misc.nix
    ./locale.nix
    ./packages.nix
    ./sessionVariables.nix
    ./bootloader.nix
    ./swap.nix
    ./bluetooth.nix
    #./portals.nix
    #./sudoRules.nix
    #./brew.nix
  ];
}
