{ pkgs, lib, ... }: {
  services = {
    displayManager.sddm = {
      # displayManager.cosmic-greeter.enable = true;
      # theme = "${pkgs.catppuccin-sddm-corners}/share/sddm/themes/catppuccin-corners";
      enable = true;
      theme = lib.mkForce "catppuccin-sddm-corners";
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
        kdePackages.qt5compat
      ];
      settings = {
        General = {
          InputMethod = "";
        };
      };

    };
    desktopManager.cosmic.enable = true;
    tumbler.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
  environment = {
    systemPackages = with pkgs; [
      cosmic-ext-ctl
      cosmic-ext-tweaks
      cosmic-ext-calculator
      cosmic-ext-applet-minimon
      cosmic-ext-applet-sysinfo
      cosmic-ext-applet-weather
      cosmic-ext-applet-caffeine
      cosmic-ext-applet-privacy-indicator
      cosmic-ext-applet-external-monitor-brightness
      catppuccin-sddm-corners
    ];
  };

  programs.xwayland.enable = true;
}
