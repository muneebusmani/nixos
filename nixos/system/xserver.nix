{ pkgs, ...}:{
  services.xserver = { # ... X server settings ...
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [ pkgs.mutter ];
      extraGSettingsOverrides = ''
      [org.gnome.mutter]
      experimental-features=['scale-monitor-framebuffer']
      '';
    };
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  # Install the extensions
  environment.systemPackages = with pkgs.gnomeExtensions; [
    hibernate-status
    user-theme
    caffeine
    hidetopbar
    dash-to-dock
    blur-my-shell (If you're using it)
  ];

}
