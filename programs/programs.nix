{ config, pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    apacheHttpd
    apacheHttpdPackages.php
    php82Packages.composer
    (php.buildEnv {
      extensions = ({ enabled, all }: enabled ++ (with all; [
        xdebug
      ]));
      extraConfig = ''
        xdebug.mode=debug
      '';
    })
  ];
  services.httpd.phpPackage = pkgs.php.buildEnv {
    extensions = ({ enabled, all }: enabled ++ (with all; [
      xdebug
    ]));
    extraConfig = ''
      xdebug.mode=debug
    '';
  };
}
