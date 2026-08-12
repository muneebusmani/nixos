{ pkgs, config, ... }: {
  boot = {

    kernelModules = [
      "wl"
      "bluetooth"
    ];
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [ broadcom_sta ];
    # boot.extraModulePackages = with config.boot.kernelPackages; [ pkgs.linuxKernel.packages.linux_zen.broadcom_sta ];
    kernelParams = [ "mem_sleep_default=deep" ];
    blacklistedKernelModules = [
      "b43"
      "bcma"
      "snd_soc_avs"
    ];
  };
  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-63-7.1.5"
  ];
  hardware.firmware = [
    pkgs.broadcom-bt-firmware
  ];
}
