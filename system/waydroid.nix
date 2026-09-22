{ pkgs, ... }: {
  # 1. Enable Waydroid with the explicit modern nftables package override
  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables; # Forces modern network stack

  # 2. Keep your specialized Wireguard and Firewall configurations intact
  networking = {
    wireguard.enable = true;
    firewall = {
      checkReversePath = false;
      allowedTCPPorts = [ 443 ];
      allowedUDPPorts = [ 1194 ];

      # Tell the NixOS firewall to explicitly trust the interface Waydroid creates
      trustedInterfaces = [ "waydroid0" ];
    };
  };
  environment.systemPackages = with pkgs; [
    waydroid-helper
  ];

  # Packet routing prerequisites for Waydroid
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  boot.kernelModules = [
    "ip_tables"
    "iptable_filter"
    "iptable_nat"
  ];
}
