{ config,pkgs,... }:{
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false; # Likely using PipeWire
  services.pipewire = { # ... PipeWire settings ...
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

}
