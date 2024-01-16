{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    neovim
    picom
    vim
    # dunst
    wget
    xborders
    kitty
    gcc
    nodejs-18_x
    polybar
    power-profiles-daemon
    beauty-line-icon-theme
    catppuccin-sddm-corners
    libsForQt5.qt5.qtgraphicaleffects
    sweet
    ugrep
    killall
    feh
  ];
  environment.xfce.excludePackages = with pkgs ;[
    xfce.xfce4-terminal
    #xfce.xfce4-notifyd
  ];
}
