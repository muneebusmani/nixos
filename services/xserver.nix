{ config, pkgs, ... }: {
  services.xserver = {
    excludePackages = with pkgs; [
    	xterm
    ];
    enable = true;
    dpi = 125;
    exportConfiguration = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    desktopManager = {
      gnome.enable = true;
    };
    displayManager = {
      defaultSession = "gnome-xorg";
      gdm = {
      	wayland = true;
	autoSuspend = true;
        enable = true;
      };
    };
  };

}
