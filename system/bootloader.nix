{ config, pkgs, ... }: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;
      gfxmodeEfi = "1920x1080";
      gfxmodeBios = "1920x1080";
    };
  };

}
