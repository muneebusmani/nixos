{
  pkgs,
  inputs, # Add inputs here
  ...
}:
let
  inherit (inputs) nur; # Extract nur from inputs
in
{
  nixpkgs.overlays = [
    nur.overlays.default
  ];

  environment.systemPackages = [
    pkgs.nur.repos.ataraxiasjel.waydroid-script
  ];
}
