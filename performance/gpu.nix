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
      services.xserver.videoDrivers = [ "nvidia" ];
      #services.xserver.deviceSection = ''
      # Identifier     "Device-modesetting[0]"
      #  VendorName     "Intel Corporation"
      #  BoardName      "Intel Corporation 4th Gen Core Processor"
      #  BusID          "PCI:0:2:0"
      #'';
      #services.xserver.extraConfig = ''
      #  Section "Device"
      #    Identifier     "Device-nvidia[0]"
      #    Driver         "nvidia"
      #    VendorName     "NVIDIA Corporation"
      #    BoardName      "NVIDIA GeForce GT 740M"
      #    BusID          "PCI:1:0:0"
      #    Option         "Coolbits" "28"
      #  EndSection
      #'';
      #services.xserver.extraConfig = ''
      #  #Section "Device"
      #    Identifier     "Device-modesetting[0]"
      #    VendorName     "Intel Corporation"
      #    BoardName      "Intel Corporation 4th Gen Core Processor"
      #    BusID          "PCI:0:2:0"
      #  #EndSection
      #
      #
      #  Section "Device"
      #    Identifier     "Device-nvidia[0]"
      #    Driver         "nvidia"
      #    VendorName     "NVIDIA Corporation"
      #    BoardName      "NVIDIA GeForce GT 740M"
      #    BusID          "PCI:1:0:0"
      #    Option         "Coolbits" "28"
      #  EndSection
      #

      #  Section "Screen"
      #    Identifier     "Screen-nvidia[0]"
      #    Device         "Device-nvidia[0]"
      #    #Monitor        "Monitor0"
      #    DefaultDepth    24
      #    Option         "AllowEmptyInitialConfiguration" "True"
      #    #Option         "Coolbits" "28"
      #    SubSection     "Display"
      #        Depth       24
      #    EndSubSection
      #  EndSection
      #'';
      powerManagement.cpuFreqGovernor = lib.mkForce "performance";
      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
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

