{ config, pkgs, ... }: {
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    desktopManager = {
      #xterm.enable = false;
      #xfce = {
      #  enable = true;
      #};
      plasma5 = {
        enable = true;
      };
      #mate = {
      #  enable = true;
      #};
      #gnome = {
      #  enable = true;
      #};
    };
    displayManager = {
      #gdm = {
      #  enable = true;
      #};
      sddm = {
        enable = true;
        #theme = "catppuccin-sddm-corners";
      };
      #lightdm = {
      #  enable = true;
      #  greeters.gtk = {
      #    enable = true;
      #    indicators = [
      #      "~host"
      #      "~spacer"
      #      "~clock"
      #      "~spacer"
      #      "~session"
      #      "~language"
      #      "~a11y"
      #      "~power"
      #    ];
      #  };
      #};
    };
    #windowManager = {
    #  i3 = {
    #    enable = true;
    #    package = pkgs.i3-gaps;
    #  };
    #};
    #excludePackages = [ pkgs.xterm ];
  };

}
