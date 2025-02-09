{ config, pkgs, ...}:{
  services.ananicy = { # If you are using Ananicy, keep this. Otherwise remove it.
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };
  swapDevices = [
    {
      device = "/dev/disk/by-uuid/9911ed0a-b2bb-475f-804e-870ca772b16e";
    }
  ];
  # Important: Add the resume kernel parameter
  boot.kernelParams = [ "resume=UUID=9911ed0a-b2bb-475f-804e-870ca772b16e" ]; 

  zramSwap = {
    enable = true;
    memoryPercent = 100; # Use 50% of RAM for zram
    priority = 100; # Default priority
  };
  services.thermald.enable = true; # If you need thermald
  services.auto-cpufreq.enable = true; # If you need auto-cpufreq
  services.power-profiles-daemon.enable = false;
  powerManagement.cpuFreqGovernor = "performance";

}
