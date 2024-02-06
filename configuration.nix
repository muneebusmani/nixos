# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }:

{
  imports =
    [
      ./system/system.nix
      ./performance/performance.nix
      ./programs/programs.nix
      ./services/services.nix
      ./garuda.nix
    ];
  system.stateVersion = "23.11"; # Did you read the comment?
}
