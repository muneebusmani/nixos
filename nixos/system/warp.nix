{ config, lib, pkgs, ...}:{
  systemd.packages = with pkgs; [ cloudflare-warp ];
  systemd.targets.multi-user.wants = [ "warp-svc.service" ];

}
