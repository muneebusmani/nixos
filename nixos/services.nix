{ config, pkgs, ... }: {
  services = {
    gvfs.enable = true;
    #mysql.enable = true;
    #mysql.package = pkgs.mariadb;
    #preload.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    xserver = {
      excludePackages = with pkgs; [
        xterm
      ];
      enable = true;
      dpi = 100;
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
          wayland = false;
          autoSuspend = true;
          enable = true;
        };
      };
    };
  };
  security.pam.services.gdm.enableGnomeKeyring = true;
}
