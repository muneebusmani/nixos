{ config, pkgs, ... }: {
  security.sudo.configFile = ''
    muneeb nixos = (root) NOPASSWD: /run/current-system/sw/bin/warp-svc
  '';
}
