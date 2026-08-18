{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot = {

    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usb_storage"
      "sd_mod"
      "rtsx_pci_sdmmc"
    ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
  fileSystems = {

    "/" = {
      device = "/dev/disk/by-uuid/dd12ee58-0979-4af8-a284-17492c68f44f";
      fsType = "btrfs";
    };

    "/home" = {
      device = "/dev/disk/by-uuid/dd12ee58-0979-4af8-a284-17492c68f44f";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/dd12ee58-0979-4af8-a284-17492c68f44f";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/96B8-3F05";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/8ad0ff21-968a-4862-95d2-a50cc09e5351"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
