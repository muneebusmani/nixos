{ config, pkgs, ... }: {
  location.longitude = 67.001137;
  location.latitude = 24.860735;
  location.provider = "geoclue2";
  services.redshift = {
    enable = true;
    brightness = {
      day = "1";
      night = "0.75";
    };
    temperature = {
      day = 5500;
      night = 3700;
    };
    provider = "geoclue2";
  };
  services.geoclue2 = {
    enable = true;
  };

}
