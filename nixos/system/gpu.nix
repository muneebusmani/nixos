# gpu.nix
{ config, lib, pkgs, ... }:

let
  mkNvidiaConfig = mode:
    let
      commonSettings = {
        modesetting.enable = true;
        powerManagement.enable = false; # Experiment if you have suspend/resume issues
        powerManagement.finegrained = false; # Only for modern GPUs (Turing or newer)
        open = false; # Recommended to be false
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable; # Or specify a version
      };
      primeSettings = {
        intelBusId = "PCI:0:2:0"; # Replace with actual Intel/AMD Bus ID
        nvidiaBusId = "PCI:1:0:0"; # Replace with actual NVIDIA Bus ID
      };
    in
      lib.mkDefault (commonSettings // (
        if mode == "offload" then {
          prime = {
            offload = {
              enable = true;
              enableOffloadCmd = true;
            };
          } // primeSettings;
        } else if mode == "sync" then {
          prime = {
            sync.enable = true;
          } // primeSettings;
        } else if mode == "intel" then {
          {
            boot.kernelParams = [ "module_blacklist=nouveau,nvidia,nvidia_drm,nvidia_modeset" ];
            services.udev.extraRules = ''
              # Remove NVIDIA GPU when in Intel-only mode
              ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{remove}="1"
            '';
            boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
            hardware.nvidia.enable = false; # Fully disable NVIDIA module
          };
        } else {
          throw "Invalid NVIDIA mode: ${mode}. Must be 'offload', 'sync', or 'intel'.";
        }
      ));
in
{
  system.nixos.tags = [ "nvidia" ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  powerManagement.cpuFreqGovernor = lib.mkForce "performance"; # or "schedutil"

  hardware.nvidia = mkNvidiaConfig "intel"; # Default mode is now Intel-only

  specialisation = {
    offload.configuration = {
      system.nixos.tags = [ "nvidia-offload" ];
      hardware.nvidia = mkNvidiaConfig "offload";
    };
    sync.configuration = {
      system.nixos.tags = [ "nvidia-sync" ];
      hardware.nvidia = mkNvidiaConfig "sync";
    };
    intel-only.configuration = {
      system.nixos.tags = [ "nvidia-intel-only" ];
      hardware.nvidia = mkNvidiaConfig "intel";
    };
  };
}
