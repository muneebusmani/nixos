{ pkgs, ... }:
{  
  environment.systemPackages = with pkgs; [ # GUI tools for configuration.nix
    vlc
    microsoft-edge
    google-chrome
    skypeforlinux
    telegram-desktop
    whatsapp-for-linux
    thunderbird
    qbittorrent
    ani-cli
    figma-linux
    gnome.dconf-editor
    gnome.gnome-tweaks
    dconf
    jetbrains.phpstorm
    libreoffice
    spotify
    discord
    kitty # If kitty is your main terminal and you use it graphically
  ];
}
