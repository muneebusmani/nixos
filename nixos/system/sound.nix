{ config, pkgs, ... }:{
  #nixpkgs.config.pulseaudio = true;
  #sound.enable = true;
  hardware.pulseaudio.enable = false;
  #hardware.pulseaudio.support32Bit = true; ## If compatibility with 32-bit applications is desired.

  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations
  # rtkit is optional but recommended
  security.rtkit.enable = true;
}
