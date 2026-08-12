{ config, pkgs, lib,inputs, ... }:
{  
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import inputs.nur { inherit pkgs; };
  };
  environment.systemPackages = with pkgs; [ # GUI tools for configuration.nix
    vlc
    # gnome-tweaks
    # dconf
    # dconf-editor
    # jetbrains.phpstorm
    # jetbrains.webstorm
    # jetbrains.rider
    libreoffice
    catppuccin
    catppuccin-kde
    # EasyEffects
    spotify
    discord
    kitty   
    bat
    # nur.repos.username.packageName
    ];
}
