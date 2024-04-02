{ config, pkgs, ... }: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Karachi";
  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  #qt = {
  #  enable = true;
  #  platformTheme = "gnome";
  #  style = "adwaita-dark";
  #};
}
