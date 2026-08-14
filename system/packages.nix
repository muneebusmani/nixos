{ pkgs, ... }:
{
  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = import inputs.nur { inherit pkgs; };
  # };
  # nixpkgs.overlays = [
  #   inputs.nur.overlays.default
  # ];

  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    # GUI tools for configuration.nix
    vlc
    dconf
    dconf-editor
    libreoffice
    spotify
    discord
    kitty
    bat
    nvtopPackages.full # Works for NVIDIA, AMD, and Intel
    pciutils # Helps detect hardware
    themechanger
    adw-gtk3
    # notion-app-enhanced
    whatsie
    stremio-linux-shell
    stremio-service
    mpv
    linux-wallpaperengine
    firefoxpwa
    # inputs.nur.legacyPackages.${pkgs.system}.repos.wingej0.nordvpn
    # nur.repos.wingej0.nordvpn
    # notion-app
    # rewaita
  ];
  programs.firefox.nativeMessagingHosts.packages = with pkgs; [
    firefoxpwa
  ];
}
