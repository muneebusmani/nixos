{ pkgs, ... }:
{
  programs = {
    nixvim = {
      nixpkgs.pkgs = pkgs;
      enable = true;
      defaultEditor = true;
      globals.loaded_perl_provider = 0;
      colorschemes.catppuccin = {
        enable = true;
        settings = {
          transparent_background = true;
          flavour = "mocha";
        };
      };

    };
  };
}
