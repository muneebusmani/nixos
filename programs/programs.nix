{ config, pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.zsh.shellInit = "
        /home/muneeb/.nix-profile/bin/neofetch
        ";
}
