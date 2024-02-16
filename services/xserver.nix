{ config, pkgs, ... }: {
  services.xserver = {
    enable = true;
    dpi = 125;
    exportConfiguration = true;
    layout = "us";
    xkbVariant = "";
    desktopManager = {
      plasma5.enable = true;
      xfce.enable = true;
    };
    displayManager = {
      sddm = {
        enable = true;
        #theme = "catppuccin-sddm-corners";
      };
    };
  };

}
