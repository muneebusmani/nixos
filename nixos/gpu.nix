{ config, lib, pkgs, ... }:
{
  specialisation = {
    nvidia.configuration = {
      system.nixos.tags = [ "nvidia" ];
      hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };
      powerManagement.cpuFreqGovernor = lib.mkForce "performance";
      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
        prime = {
          sync.enable = true;
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };
    powersave.configuration = {
      system.nixos.tags = [ "powersave" ];
      services.preload.enable = lib.mkForce false;
      hardware.nvidiaOptimus.disable = lib.mkForce true;
      hardware.bluetooth.enable = lib.mkForce false; # enables support for Bluetooth
      hardware.bluetooth.powerOnBoot = lib.mkForce false; # powers up the default Bluetooth controller on boot
      virtualisation.docker.enable = lib.mkForce false;
      users.users.muneeb.extraGroups = lib.mkForce [ "networkmanager" "audio" "wheel" ];
      powerManagement.cpuFreqGovernor = lib.mkForce "schedutil";
      zramSwap.enable = lib.mkForce false;
    };
  };
}
