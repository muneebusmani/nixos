{ config, pkgs, ... }: {
  services.power-profiles-daemon.enable = true;
  powerManagement.cpuFreqGovernor = "schedutil";
  services.thermald.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  zramSwap.enable = true;
}
