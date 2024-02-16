{ config, pkgs, ... }: {
  services.power-profiles-daemon.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  services.thermald.enable = true;
}
