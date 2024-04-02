{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ./misc.nix
    ./locale.nix
    ./packages.nix
    ./bootloader.nix
    ./swap.nix
    ./bluetooth.nix
    ./sound.nix
    ./systemd.nix
    #./sessionVariables.nix
    #./portals.nix
    #./sudoRules.nix
    #./brew.nix
  ];
}
