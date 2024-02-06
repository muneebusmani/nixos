{ config, pkgs, ... }: {
  services.xserver = {
    enable = true;
    dpi = 125;
    layout = "us";
    xkbVariant = "";
    desktopManager = {
      plasma5 = {
        enable = true;
      };
    };
    displayManager = {
      sddm = {
        enable = true;
        #theme = "catppuccin-sddm-corners";
      };
    };
  };

}
