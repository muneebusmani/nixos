{ lib, ... }: {
  # swapDevices = [
  #   { device = "/dev/disk/by-uuid/6efbc3a7-ef84-4d45-ab54-246b426e851b"; }
  # ];
  # Important: Add the resume kernel parameter
  boot.kernelParams = [
    "resume=UUID=6efbc3a7-ef84-4d45-ab54-246b426e851b"
    "intel_pstate=passive"
  ];

  zramSwap = {
    enable = true;
    memoryPercent = 100; # Use 50% of RAM for zram
    priority = 100; # Default priority
  };
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  powerManagement = {
    # enable = true;
    cpuFreqGovernor = lib.mkForce "schedutil";
  };

  services = {
    thermald.enable = true;
    # power-profiles-daemon.enable = true;
    system76-scheduler.enable = true;
  };

  programs = {
    firefox = {
      enable = true;
      preferences = {
        "widget.gtk.libadwaita-colors.enabled" = false;
        "ui.systemUsesDarkTheme" = 1; # Enforces dark theme matching Catppuccin Dark/Mocha variants
      };
    };
  };
}
