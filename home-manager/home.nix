{ config, pkgs, ... }:
{
  imports = [ <home-manager/nixos> ];
  home-manager.users.muneeb = { pkgs, ... }: {
    services.xcape.enable = true;
    imports = [
      ./themes/themes.nix
      ./programs/programs.nix
      ./packages.nix
    ];
    home.stateVersion = "23.11";
    home.homeDirectory = "/home/muneeb";
  };
}
