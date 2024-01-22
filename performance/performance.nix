{ config, pkgs, ... }: {
  imports = [
    ./zram.nix
    ./cpuPower.nix
    ./zenKernel.nix
    ./gpu.nix
  ];
}
