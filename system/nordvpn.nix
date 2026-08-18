{
  _,
  ...
}:
{
  # Enable the official NixOS service
  services.nordvpn.enable = true;

  users.users.muneeb = {
    extraGroups = [ "nordvpn" ];
  };

  networking = {
    wireguard.enable = true;
    firewall = {
      checkReversePath = false;
      allowedTCPPorts = [ 443 ];
      allowedUDPPorts = [ 1194 ];
    };
  };
}
