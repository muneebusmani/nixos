{ config, pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gedit # text editor
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
  environment.systemPackages = with pkgs; [
#libsForQt5.kpmcore
#libsForQt5.qt5.qtgraphicaleffects
#libsForQt5.full
#libsForQt5.kdecoration
#libsForQt5.applet-window-appmenu
#libsForQt5.applet-window-buttons
#libsForQt5.kmail
#libsForQt5.kcalc
#libsForQt5.bismuth
#kde-rounded-corners
#xorg.xf86inputevdev
#xorg.xinit
#libsForQt5.qtstyleplugin-kvantum
#google-chrome
#inkscape
#firefox
#adw-gtk3
#adwaita-qt
#gradience
#preload
#neofetch
#android-tools
#glib
#motrix
#sddm-kcm
#obs-studio
#zoom
#partition-manager
#tigervnc
#gucharmap
#catppuccin-sddm-corners
#catppuccin-kvantum

    vlc
    power-profiles-daemon
    caffeine-ng
    cloudflare-warp
    lazygit
    fd
    ripgrep
    killall
    lshw
    xarchiver
    xcape
    xsel
    unzip
    git
    gcc
    wget
    ugrep
    cmake
    gnumake
    curl
    eza
    nix-init
    btop
    htop
    libinput
    zsh
    zsh-autocomplete
    zsh-autopair
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    beauty-line-icon-theme
    sweet
    nerdfonts
    font-awesome
    font-awesome_5
    font-awesome_4
    discord
    microsoft-edge
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
    gnomeExtensions.hide-top-bar
    gnomeExtensions.hide-activities-button
  ];
}
