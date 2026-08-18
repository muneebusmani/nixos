{
  pkgs,
  inputs,
  ...
}:

let
  # 1. Call the python bindings or local dependencies first if needed
  hyprlandBindings = pkgs.callPackage ./pkgs/hyprland-python-bindings.nix { };

  # 2. Call your custom package manually by pointing to its nix expression
  myCustomHyprmod = pkgs.callPackage ./pkgs/hyprmod.nix {
    hyprmodSrc = inputs.hyprmod-src; # From flake inputs
    inherit hyprlandBindings;
  };
in
{
  environment.systemPackages = [
    myCustomHyprmod
  ];
}
