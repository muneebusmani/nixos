{ pkgs, inputs, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import inputs.nur { inherit pkgs; };
  };
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    # GUI tools for configuration.nix
    vlc
    gnome-tweaks
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
  ];
}
