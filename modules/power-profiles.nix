{
  config,
  pkgs,
  ...
}:
let
  nvidiaSmi = "${config.hardware.nvidia.package.bin}/bin/nvidia-smi";
in
{
  specialisation = {
    ultra-power-saver.configuration = {
      stdenv.hostPlatform.system.nixos.tags = [ "ultra-power-saver" ];

      # Kill NVIDIA completely
      boot.extraModprobeConfig = ''
        blacklist nouveau
        blacklist nvidia
        blacklist nvidia_drm
        blacklist nvidia_modeset
      '';
      hardware.nvidia.modesetting.enable = false;
      services.xserver.videoDrivers = [ "modesetting" ];

      # Aggressive CPU limits + undervolt
      services.undervolt = {
        enable = true;
        p1.limit = 15;
        p1.window = 28;
        p2.limit = 20;
        p2.window = 1;
        coreOffset = -75;
        gpuOffset = -50;
        useTimer = true;
      };

      # Max PowerTOP tweaks
      powerManagement.powertop.enable = true;
      systemd.services.powertop-auto-tune = {
        wantedBy = [ "multi-user.target" ];
        serviceConfig.ExecStart = "${pkgs.powertop}/bin/powertop --auto-tune";
      };
    };

    moderate-power-saver.configuration = {
      stdenv.hostPlatform.system.nixos.tags = [ "moderate-power-saver" ];

      # Balanced CPU limits + mild undervolt
      services.undervolt = {
        enable = true;
        p1.limit = 28;
        p1.window = 28;
        p2.limit = 35;
        p2.window = 2;
        coreOffset = -60;
        gpuOffset = -30;
        useTimer = true;
      };

      # Selective PowerTOP with USB safety fallback
      powerManagement.powertop.enable = true;
      systemd.services.powertop-selective = {
        wantedBy = [ "multi-user.target" ];
        serviceConfig.ExecStart = ''
          ${pkgs.powertop}/bin/powertop --auto-tune
          echo 'on' > /sys/bus/usb/devices/usb1/power/control || true
        '';
      };

      # Adaptive GPU power
      systemd.services.nvidia-powermizer = {
        wantedBy = [ "multi-user.target" ];
        serviceConfig.Type = "oneshot";
        serviceConfig.ExecStart = "${nvidiaSmi} -i 0 -pm 0";
      };
    };

    max-performance.configuration = {
      stdenv.hostPlatform.system.nixos.tags = [ "max-performance" ];

      # Full CPU power (no undervolt)
      services.undervolt = {
        enable = true;
        p1.limit = 45;
        p1.window = 28;
        p2.limit = 55;
        p2.window = 2;
        coreOffset = 0;
        gpuOffset = 0;
        useTimer = true;
      };

      # Disable PowerTOP
      powerManagement.powertop.enable = false;

      systemd.services = {
        # GPU Overclock (+135 core, +348 mem)
        nvidia-overclock = {
          wantedBy = [ "multi-user.target" ];
          serviceConfig.Type = "oneshot";
          serviceConfig.ExecStart = "${nvidiaSmi} -i 0 -gco 135 -mco 348";
        };

        # Max Performance PowerMizer (persistence mode)
        nvidia-powermizer = {
          wantedBy = [ "multi-user.target" ];
          serviceConfig.Type = "oneshot";
          serviceConfig.ExecStart = "${nvidiaSmi} -i 0 -pm 1";
        };
      };
    };
  };
}
