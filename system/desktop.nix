{ pkgs, ... }: {
  hardware.system76.power-daemon.enable = true;
  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
    system76-scheduler.enable = true;
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
    ];
  };

  programs.xwayland.enable = true;
}
