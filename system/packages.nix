{ config, pkgs, ... }:
let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
  nurTarball =
    (builtins.fetchTarball { url = "https://github.com/nix-community/NUR/archive/master.tar.gz"; sha256 = "04387gzgl8y555b3lkz9aiw9xsldfg4zmzp930m62qw8zbrvrshd"; });
in
{
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
      nur = import nurTarball {
        inherit pkgs;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    # Misc.
    obs-studio
    tigervnc
    vlc
    zoom
    partition-manager
    power-profiles-daemon
    sddm-kcm
    #caffeine-ng
    preload
    neofetch
    cloudflare-warp
    motrix
    android-tools

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
    #nvtop
    #gwe
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
    catppuccin-sddm-corners
    sweet
    nerdfonts
    font-awesome
    font-awesome_5
    font-awesome_4
    gucharmap
    catppuccin-kvantum

    # internet
    discord
    microsoft-edge
    #google-chrome
    skypeforlinux
    telegram-desktop
    whatsapp-for-linux
    #firefox
    thunderbird
    qbittorrent

    # Graphics
    figma-linux
    inkscape

    # Kde related stuff
    libsForQt5.kpmcore
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.full
    libsForQt5.kdecoration
    libsForQt5.applet-window-appmenu
    libsForQt5.applet-window-buttons
    libsForQt5.kmail
    libsForQt5.kcalc
    libsForQt5.bismuth
    kde-rounded-corners




  xfce.xfce4-whiskermenu-plugin
  xfce.xfce4-volumed-pulse
  xfce.xfce4-weather-plugin
  xfce.xfce4-taskmanager
  xfce.xfce4-systemload-plugin
  xfce.xfce4-pulseaudio-plugin
  xfce.xfce4-notes-plugin
  xfce.xfce4-netload-plugin
  #xfce.xfce4-namebar-plugin
  xfce.xfce4-docklike-plugin
  xfce.xfce4-dockbarx-plugin
  redshift
  geoclue2
  ];
}
