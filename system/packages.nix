{ pkgs, ... }:
{  
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
    # spotify
    # discord
    kitty   
    ];
}
