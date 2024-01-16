{ config, pkgs, ... }: {
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
}
