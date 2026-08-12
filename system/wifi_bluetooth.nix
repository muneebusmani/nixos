{ pkgs, config, ... }: {
  boot = {

    kernelModules = [
      "wl"
      "bluetooth"
    ];
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [ broadcom_sta ];
    kernelParams = [ "mem_sleep_default=deep" ];
    blacklistedKernelModules = [
      "b43"
      "bcma"
      "snd_soc_avs"
    ];
  };
  hardware.firmware = [
    pkgs.broadcom-bt-firmware
  ];
}
