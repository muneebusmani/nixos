{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-pink-standard";
      package = pkgs.catppuccin-gtk.override {
        size = "standard";
        accents = [ "pink" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Tela-circle-dracula-dark";
      # package = pkgs.papirus-icon-theme;
    };
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    gtk4 = {
      theme = {
        name = "catppuccin-mocha-pink-standard";
        package = pkgs.catppuccin-gtk.override {
          size = "standard";
          accents = [ "pink" ];
          variant = "mocha";
        };
      };

      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };

}
