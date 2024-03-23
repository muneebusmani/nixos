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
    # Misc.
    vlc
    power-profiles-daemon
    caffeine-ng
    preload
    neofetch
    cloudflare-warp
    android-tools
    glib
    #motrix
    #sddm-kcm
    #obs-studio
    #zoom
    #partition-manager
    #tigervnc

    # System Tools
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


    # zsh
    zsh
    zsh-autocomplete
    zsh-autopair
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting

    # Theming
    beauty-line-icon-theme
    sweet
    nerdfonts
    font-awesome
    font-awesome_5
    font-awesome_4
    #gucharmap
    #catppuccin-sddm-corners
    #catppuccin-kvantum

    # internet
    discord
    microsoft-edge
    skypeforlinux
    telegram-desktop
    whatsapp-for-linux
    thunderbird
    qbittorrent
    ani-cli
    #google-chrome
    #firefox

    # Graphics
    figma-linux
    #inkscape

    # Kde related stuff
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

    gnome.dconf-editor
    gnome.gnome-tweaks
    gradience
    adw-gtk3
    dconf
    gnomeExtensions.hide-top-bar
    gnomeExtensions.hide-activities-button
    gnomeExtensions.hide-top-bar
    adwaita-qt
  ];
}
