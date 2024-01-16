{ config, pkgs, ... }: {
  services.picom = {
    enable = true;
    vSync = true;
    fade = false;
    # shadow = true;
    backend = "glx";
    settings = { };
  };
}
