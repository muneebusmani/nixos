{ config, pkgs, ... }: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Karachi";
  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;
}
