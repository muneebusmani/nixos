{ pkgs, ... }:
let
  custom = name: pkgs.callPackage (./custom/packages + "/${name}/package.nix") { };
in
{
  services.flatpak.enable = true;
  services.upower.enable = true;

  environment.systemPackages =
    with pkgs;
    [
      vlc
      libreoffice
      # spotify
      # zapzap
      gnutls
      appimage-run
      webkitgtk_4_1
      gtk3
      libsoup_3
      libepoxy
      glib
      cairo
      pango
      harfbuzz
      at-spi2-core
      gdk-pixbuf
      fontconfig
      gcc.cc.lib
      libva
      libdrm
      zlib-ng
      gnutls
      # flutter
      fvm

      nvidia_oc
      discord
      kitty
      bat
      nvtopPackages.full
      pciutils
      stremio-linux-shell
      stremio-service
      gparted
      mpv
      # linux-wallpaperengine
      firefoxpwa
      tree
      catppuccin
      catppuccin-gtk
      catppuccin-discord
      # catppuccin-cursors
      mesa-demos
      fastfetch
      # lxappearance
      obs-studio
      spotify-player
      thunderbird
      # spicetify-cli
      # powertop

    ]
    ++ map custom [
      # "anymex"
      # just drop your custom folder names in this list
      # "cosmic-ext-applet-clipboard-manager"
      # "cosmic-ext-applet-emoji-selector"
    ];
  programs.firefox.nativeMessagingHosts.packages = with pkgs; [
    firefoxpwa
  ];
}
