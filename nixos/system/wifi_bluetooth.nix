{ pkgs, config, ... }:{
  
  boot.kernelModules = [ "wl" "bluetooth" ];
  boot.kernelPackages = pkgs.linuxKernel.kernels.linux_zen;
  boot.extraModulePackages = with config.boot.kernelPackages; [ pkgs.linuxKernel.packages.linux_zen.broadcom_sta ];
  boot.kernelParams = [ "mem_sleep_default=deep" ];
  boot.blacklistedKernelModules = [ "b43" "bcma" "snd_soc_avs" ];
  hardware.firmware = [
    pkgs.broadcom-bt-firmware
  ];
}
