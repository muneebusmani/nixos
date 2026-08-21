{ _, ... }:

{
  imports = [
    ./packages.nix
    ./main.nix
    ./keymaps.nix
    ./plugins.nix
    ./extra
  ];
}
