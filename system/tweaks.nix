{ pkgs, ... }: {
  swapDevices = [
    { device = "/dev/disk/by-uuid/6efbc3a7-ef84-4d45-ab54-246b426e851b"; }
  ];
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
  services = {
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    thermald.enable = true; # If you need thermald
    power-profiles-daemon.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "schedutil";
          turbo = "never";
        };
      };
    };
  };
}
