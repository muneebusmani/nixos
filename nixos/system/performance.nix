{ config, pkgs, ...}:{
  services.ananicy = { # If you are using Ananicy, keep this. Otherwise remove it.
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };
  swapDevices = {
    enable = true;
    size = "16Gi"; # Adjust to your desired size (at least your RAM size, ideally a bit larger)
    # The path defaults to /swapfile, but you can specify it if you want:
    # path = "/my/custom/swapfile";
  };
  # Important: Add the resume kernel parameter
  boot.kernelParams = [ "resume=/swapfile" ]; 

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
