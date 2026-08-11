{ pkgs, ...}:{
  services.displayManager.gdm = {
    enable = true;
    # wayland = true;
  };
  services.desktopManager.gnome = {
    enable = true;
    extraGSettingsOverridePackages = [ pkgs.mutter ];
    extraGSettingsOverrides = ''
    [org.gnome.mutter]
    experimental-features=['scale-monitor-framebuffer']
    '';
  };
  services.xserver = { # ... X server settings ...
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  # Install the extensions
  environment.systemPackages = with pkgs.gnomeExtensions; [
    hibernate-status-button
    user-themes
    caffeine
    hide-top-bar
    dash-to-dock
    blur-my-shell
  ];

}
