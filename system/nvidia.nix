{
  # config,
  pkgs,
  lib,
  # lib,
  ...
}:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  services.xserver.screenSection = ''
    Option "Coolbits" "28"
  '';
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";
  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false; # open-source kernel module doesn't support pre-Turing (960M) — must stay false
      branch = "legacy_580";
      prime = {
        # sync.enable = true; # syncs PRIME offload GPU with display GPU (e.g. tearing-free gaming)
        offload.enable = true;
        offload.enableOffloadCmd = true; # gives you `nvidia-offload <cmd>`

        intelBusId = "PCI:0:2:0"; # verify with `lspci | grep -E "VGA|3D"`
        nvidiaBusId = "PCI:1:0:0"; # verify with `lspci`
      };
    };
  };
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
  ];
}
