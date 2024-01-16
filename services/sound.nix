{ config, pkgs, ... }: {

  nixpkgs.config.pulseaudio = true;
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true; ## If compatibility with 32-bit applications is desired.

}
