{ pkgs, inputs, ... }: {
  programs.spicetify = {
    enable = true;
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.system}.themes.catppuccin;
    colorScheme = "mocha";
    # enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
    # adblockify
    # keyboardShortcut
    # shuffle
    # webnowplaying
    # trashbin
    # powerBar
    # ];
  };
}
