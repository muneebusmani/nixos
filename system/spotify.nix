{ pkgs, inputs, ... }:
# let
#   spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
# in
{
  # # 1. You must import the module first
  # imports = [
  #   inputs.spicetify-nix.nixosModules.default
  # ];
  #
  # # 2. Your program config
  # programs.spicetify = {
  #   enable = true;
  #
  #   theme = spicePkgs.themes.catppuccin;
  #   colorScheme = "mocha";
  #
  #   enabledExtensions = with spicePkgs.extensions; [
  #     fullAppDisplay
  #     shuffle
  #     hidePodcasts
  #     adblock
  #   ];
  #
  #   enabledCustomApps = with spicePkgs.apps; [
  #     marketplace
  #     lyricsPlus
  #   ];
  # };
}
