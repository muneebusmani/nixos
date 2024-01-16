{ config, pkgs, ... }: {
  users.users.muneeb = {
    isNormalUser = true;
    description = "muneeb";
    extraGroups = [ "networkmanager" "audio" "wheel" ];
    shell = pkgs.zsh;
  };

}
