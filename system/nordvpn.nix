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

}
