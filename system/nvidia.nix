{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my-gpu;
in
{
  options.my-gpu.mode = lib.mkOption {
    type = lib.types.enum [
      "intel"
      "offload"
      "sync"
    ];
    default = "intel";
  };

  config = lib.mkMerge [
    # 1. Base settings applied to all modes
    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          libvdpau-va-gl
        ];
      };
      services.tlp.enable = lib.mkForce false;
      powerManagement.cpuFreqGovernor = lib.mkForce "schedutil";

      specialisation = {
        offload.configuration = {
          my-gpu.mode = "offload";
        };
        sync.configuration = {
          my-gpu.mode = "sync";
        };
      };
    }

    # 2. Intel-Only Mode (Default)
    (lib.mkIf (cfg.mode == "intel") {
      system.nixos.tags = [ "nvidia-intel-only" ];
      hardware = {
        nvidia = {
          prime = {
            # Force disable prime features so they don't bleed in from root config
            offload.enable = lib.mkForce false;
            offload.enableOffloadCmd = lib.mkForce false;
            sync.enable = lib.mkForce false;
          };
        };
      };

      boot.blacklistedKernelModules = [
        "nouveau"
        "nvidia"
        "nvidia_drm"
        "nvidia_modeset"
      ];
      services.udev.extraRules = ''
        # Disable NVIDIA GPU
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{remove}="1"
      '';
    })

    # 3. Common NVIDIA Settings (Offload or Sync)
    (lib.mkIf (cfg.mode != "intel") {
      services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];
      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
        prime = {
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    })

    # 4. Specific NVIDIA Modes
    (lib.mkIf (cfg.mode == "offload") {
      system.nixos.tags = [ "nvidia-offload" ];
      hardware = {
        nvidia = {
          prime = {
            offload.enable = lib.mkForce true;
            offload.enableOffloadCmd = lib.mkForce true;
            sync.enable = lib.mkForce false;
          };
        };
      };
    })

    (lib.mkIf (cfg.mode == "sync") {
      system.nixos.tags = [ "nvidia-sync" ];
      hardware = {
        nvidia = {
          prime = {
            sync.enable = lib.mkForce true;
            offload.enable = lib.mkForce false;
            offload.enableOffloadCmd = lib.mkForce false;
          };
        };
      };
    })
  ];
}
