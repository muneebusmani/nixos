{ pkgs, ... }:
let
  custom = name: pkgs.callPackage (./custom/packages + "/${name}/package.nix") { };
in
{
  services.flatpak.enable = true;
  environment.systemPackages =
    with pkgs;
    [
      vlc
      libreoffice
      # spotify
      discord
      kitty
      bat
      nvtopPackages.full
      pciutils
      stremio-linux-shell
      stremio-service
      mpv
      linux-wallpaperengine
      firefoxpwa
      tree
      catppuccin
      catppuccin-gtk
      catppuccin-discord
      catppuccin-cursors
      mesa-demos
      fastfetch
      lxappearance
      obs-studio
      spotify-player
      thunderbird
      # spicetify-cli
      powertop

    ]
    ++ map custom [
      # just drop your custom folder names in this list
      # "cosmic-ext-applet-clipboard-manager"
      # "cosmic-ext-applet-emoji-selector"
    ];
  programs.firefox.nativeMessagingHosts.packages = with pkgs; [
    firefoxpwa
  ];
}
