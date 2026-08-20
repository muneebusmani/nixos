{
  # config,
  pkgs,
  # lib,
  ...
}:
{
  services.xserver.config = ''
    Section "Device"
      Identifier "nvidia-headless"
      Driver "nvidia"
      BusID "PCI:1:0:0"
      Option "Coolbits" "12"
      Option "AllowEmptyInitialConfiguration" "true"
    EndSection
    Section "Screen"
      Identifier "nvidia-headless-screen"
      Device "nvidia-headless"
    EndSection
  '';
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true; # helps Optimus laptops sleep/resume cleanly
      powerManagement.finegrained = false; # 960M-era Optimus PRIME render offload can be flaky; leave off unless you've tuned it
      open = false; # open-source kernel module doesn't support pre-Turing (960M) — must stay false
      branch = "legacy_580";
      # package = lib.mkForce config.boot.kernelPackages.nvidiaPackages.legacy_580;
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true; # gives you `nvidia-offload <cmd>`
        intelBusId = "PCI:0:2:0"; # verify with `lspci | grep -E "VGA|3D"`
        nvidiaBusId = "PCI:1:0:0"; # verify with `lspci`
      };
    };
  };
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia # live VRAM/utilization monitor — genuinely useful for you
  ];
}
