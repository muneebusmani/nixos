{ config, pkgs, ... }: {
  users.users.muneeb = {
    isNormalUser = true;
    description = "muneeb";
    extraGroups = [ "networkmanager" "audio" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

}
