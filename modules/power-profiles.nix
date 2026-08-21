{
  config,
  inputs,
  lib,
  ...
}:
let
  nvidiaSmi = "${config.hardware.nvidia.package.bin}/bin/nvidia-smi";
  underwattCli = inputs.underwatt.packages.x86_64-linux.default;
in
{
  boot.kernelParams = [ "intel_pstate=active" ];
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  powerManagement.powertop.enable = false;
  environment.systemPackages = [
    underwattCli
  ];
  specialisation = {
    ultra-power.configuration = {
      system.nixos.tags = [ "ultra-power" ];
      systemd = {
        services = {
          cpu-epp-power = {
            wantedBy = [ "multi-user.target" ];
            serviceConfig.Type = "oneshot";
            script = ''
              for cpu in /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference; do
                echo "power" > "$cpu" || true
              done
            '';
          };
          # Power limits for Intel RAPL (Running Average Power Limit)
          rapl-power-limit = {
            wantedBy = [
              "multi-user.target"
              "sleep.target"
            ];
            after = [ "sleep.target" ];
            serviceConfig.Type = "oneshot";
            script = ''
              ${underwattCli}/bin/underwatt set --pl0 15 --pl1 20
            '';
          };

        };
      };

      # Kill NVIDIA completely
      boot.extraModprobeConfig = ''
        blacklist nouveau
        blacklist nvidia
        blacklist nvidia_drm
        blacklist nvidia_modeset
      '';
      hardware.nvidia.modesetting.enable = false;
      services.xserver.videoDrivers = [ "modesetting" ];
    };

    moderate-power.configuration = {
      system.nixos.tags = [ "moderate-power" ];
      systemd = {
        services = {
          # Intel RAPL Power Limits
          rapl-power-limit = {
            wantedBy = [
              "multi-user.target"
              "sleep.target"
            ];
            after = [ "sleep.target" ];
            serviceConfig.Type = "oneshot";
            script = ''
              ${underwattCli}/bin/underwatt set --pl0 28 --pl1 35
            '';
          };

          # Set EPP to balance_power (snappy but battery aware)
          cpu-epp-moderate = {
            wantedBy = [ "multi-user.target" ];
            serviceConfig.Type = "oneshot";
            script = ''
              for cpu in /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference; do
                echo "balance_power" > "$cpu" || true
              done
            '';
          };

          # Adaptive GPU power
          nvidia-powermizer = {
            wantedBy = [ "multi-user.target" ];
            serviceConfig.Type = "oneshot";
            serviceConfig.ExecStart = "${nvidiaSmi} -i 0 -pm 0";
          };
        };
      };
    };

    max-performance.configuration = {
      system.nixos.tags = [ "max-performance" ];
      systemd.services.rapl-power-limit = {
        wantedBy = [
          "multi-user.target"
          "sleep.target"
        ];
        after = [ "sleep.target" ];
        serviceConfig.Type = "oneshot";
        script = ''
          ${underwattCli}/bin/underwatt set --pl0 45 --pl1 55
        '';
      };
      powerManagement.cpuFreqGovernor = lib.mkForce "performance";
      systemd.services = {
        nvidia-overclock = {
          wantedBy = [ "multi-user.target" ];
          serviceConfig.Type = "oneshot";
          serviceConfig.ExecStart = "${nvidiaSmi} -i 0 -gco 135 -mco 348";
        };
        cpu-epp-moderate = {
          wantedBy = [ "multi-user.target" ];
          serviceConfig.Type = "oneshot";
          script = ''
            for cpu in /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference; do
              echo "performance" > "$cpu" || true
            done
          '';
        };

        nvidia-powermizer = {
          wantedBy = [ "multi-user.target" ];
          serviceConfig.Type = "oneshot";
          serviceConfig.ExecStart = "${nvidiaSmi} -i 0 -pm 1";
        };
      };
    };
  };
}
