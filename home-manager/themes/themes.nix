{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "flamingo" ];
        size = "standard";
        tweaks = [ "black" "rimless" ];
        variant = "mocha";
      };
    };
  };
}
