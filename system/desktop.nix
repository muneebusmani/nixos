{ pkgs, ... }: {
  # Keep Xserver enabled for Xwayland support
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable SDDM with Wayland
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Enable KDE Plasma 6
  services.desktopManager.plasma6.enable = true;

  # Install Kvantum for Qt6 and Plasma 6
  environment.systemPackages = with pkgs; [
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    themechanger
  ];
}
