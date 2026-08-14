{ pkgs, ... }: {
  services = {
    displayManager.gdm.enable = true;
    tumbler.enable = true;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [ pkgs.mutter ];
      extraGSettingsOverrides = ''
        [org.gnome.mutter]
        experimental-features=['scale-monitor-framebuffer']
      '';
    };
    xserver = {
      # ... X server settings ...
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  environment = {
    systemPackages =
      with pkgs;
      [
        gnome-tweaks
      ]
      ++ (with gnomeExtensions; [
        hibernate-status-button
        just-perfection
        panel-corners
        user-themes
        # caffeine
        hide-top-bar
        dash-to-panel
        dash-to-dock
        blur-my-shell
        appindicator
        clipboard-indicator
      ]);

    gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
    ];
  };

  programs.xwayland.enable = true;
}
