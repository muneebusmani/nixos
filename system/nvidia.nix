{
  config,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  # Use the proprietary driver, not nouveau
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true; # helps Optimus laptops sleep/resume cleanly
    powerManagement.finegrained = false; # 960M-era Optimus PRIME render offload can be flaky; leave off unless you've tuned it
    open = false; # open-source kernel module doesn't support pre-Turing (960M) — must stay false
    package = lib.mkForce config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  # Optimus: XPS 9550 has Intel HD 530 + 960M. Make CUDA apps actually target the NVIDIA GPU.
  hardware.nvidia.prime = {
    offload.enable = true;
    offload.enableOffloadCmd = true; # gives you `nvidia-offload <cmd>`
    intelBusId = "PCI:0:2:0"; # verify with `lspci | grep -E "VGA|3D"`
    nvidiaBusId = "PCI:1:0:0"; # verify with `lspci`
  };

  # CUDA toolkit only needed if you're compiling things yourself;
  # LM Studio bundles its own CUDA runtime, so this is optional.
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia # live VRAM/utilization monitor — genuinely useful for you
  ];
}
# {
#   config,
#   lib,
#   pkgs,
#   ...
# }:
#
# let
#   cfg = config.my-gpu;
# in
# {
#   options.my-gpu.mode = lib.mkOption {
#     type = lib.types.enum [
#       "intel"
#       "offload"
#       "sync"
#     ];
#     default = "intel";
#   };
#
#   config = lib.mkMerge [
#     # 1. Base settings applied to all modes
#     {
#       hardware.graphics = {
#         enable = true;
#         enable32Bit = true;
#         extraPackages = with pkgs; [
#           libvdpau-va-gl
#         ];
#       };
#       specialisation = {
#         offload.configuration = {
#           my-gpu.mode = "offload";
#         };
#         sync.configuration = {
#           my-gpu.mode = "sync";
#         };
#       };
#     }
#
#     # 2. Intel-Only Mode (Default)
#     (lib.mkIf (cfg.mode == "intel") {
#       system.nixos.tags = [ "nvidia-intel-only" ];
#       hardware = {
#         nvidia = {
#           prime = {
#             # Force disable prime features so they don't bleed in from root config
#             offload.enable = lib.mkForce false;
#             offload.enableOffloadCmd = lib.mkForce false;
#             sync.enable = lib.mkForce false;
#           };
#         };
#       };
#
#       boot.blacklistedKernelModules = [
#         "nouveau"
#         "nvidia"
#         "nvidia_drm"
#         "nvidia_modeset"
#       ];
#       services.udev.extraRules = ''
#         # Disable NVIDIA GPU
#         ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{remove}="1"
#       '';
#     })
#
#     # 3. Common NVIDIA Settings (Offload or Sync)
#     (lib.mkIf (cfg.mode != "intel") {
#       services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];
#       hardware.nvidia = {
#         modesetting.enable = true;
#         powerManagement.enable = false;
#         powerManagement.finegrained = false;
#         open = false;
#         nvidiaSettings = true;
#         package = lib.mkForce config.boot.kernelPackages.nvidiaPackages.legacy_580;
#         prime = {
#           intelBusId = "PCI:0:2:0";
#           nvidiaBusId = "PCI:1:0:0";
#         };
#       };
#     })
#
#     # 4. Specific NVIDIA Modes
#     (lib.mkIf (cfg.mode == "offload") {
#       system.nixos.tags = [ "nvidia-offload" ];
#       hardware = {
#         nvidia = {
#           prime = {
#             offload.enable = lib.mkForce true;
#             offload.enableOffloadCmd = lib.mkForce true;
#             sync.enable = lib.mkForce false;
#           };
#         };
#       };
#     })
#
#     (lib.mkIf (cfg.mode == "sync") {
#       system.nixos.tags = [ "nvidia-sync" ];
#       hardware = {
#         nvidia = {
#           prime = {
#             sync.enable = lib.mkForce true;
#             offload.enable = lib.mkForce false;
#             offload.enableOffloadCmd = lib.mkForce false;
#           };
#         };
#       };
#     })
#   ];
# }

# {
#   config,
#   lib,
#   pkgs,
#   ...
# }:
# {
#   hardware = {
#     # --- Shared base, applies in ALL modes (including default intel-only) ---
#     graphics = {
#       enable = true;
#       enable32Bit = true;
#       extraPackages = with pkgs; [
#         libvdpau-va-gl
#       ];
#     };
#
#     # Pinned once, shared by every mode that actually loads the driver.
#     # GTX 960M (Maxwell) is pre-Turing -> must use proprietary (open = false)
#     # and is EOL on latest stable -> must use a legacy branch.
#     nvidia = {
#       open = false;
#       package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
#     };
#
#     nvidia.prime = {
#       offload.enable = false;
#       offload.enableOffloadCmd = false;
#       sync.enable = false;
#     };
#   };
#
#   # --- Default boot entry: NVIDIA fully disabled ---
#   system.nixos.tags = [ "intel-only" ];
#
#   boot.blacklistedKernelModules = [
#     "nouveau"
#     "nvidia"
#     "nvidia_drm"
#     "nvidia_modeset"
#   ];
#
#   services.udev.extraRules = ''
#     # Disable NVIDIA GPU
#     ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{remove}="1"
#   '';
#
#   # --- Specialisation: nvidia-offload ---
#   specialisation.nvidia-offload.configuration = {
#     system.nixos.tags = [ "nvidia-offload" ];
#
#     boot.blacklistedKernelModules = lib.mkForce [ ];
#     services.udev.extraRules = lib.mkForce "";
#
#     services.xserver.videoDrivers = lib.mkForce [
#       "modesetting"
#       "nvidia"
#     ];
#
#     hardware.nvidia = {
#       modesetting.enable = true;
#       powerManagement.enable = false;
#       powerManagement.finegrained = false;
#       nvidiaSettings = true;
#
#       prime = {
#         offload.enable = lib.mkForce true;
#         offload.enableOffloadCmd = lib.mkForce true;
#         sync.enable = lib.mkForce false;
#         intelBusId = "PCI:0:2:0";
#         nvidiaBusId = "PCI:1:0:0";
#       };
#     };
#   };
#
#   # --- Specialisation: nvidia-sync ---
#   specialisation.nvidia-sync.configuration = {
#     system.nixos.tags = [ "nvidia-sync" ];
#
#     boot.blacklistedKernelModules = lib.mkForce [ ];
#     services.udev.extraRules = lib.mkForce "";
#
#     services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];
#
#     hardware.nvidia = {
#       modesetting.enable = true;
#       powerManagement.enable = false;
#       powerManagement.finegrained = false;
#       nvidiaSettings = true;
#
#       prime = {
#         sync.enable = lib.mkForce true;
#         offload.enable = lib.mkForce false;
#         offload.enableOffloadCmd = lib.mkForce false;
#         intelBusId = "PCI:0:2:0";
#         nvidiaBusId = "PCI:1:0:0";
#       };
#     };
#   };
# }
