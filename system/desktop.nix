{ pkgs, ... }: {
  services = {
    displayManager.gdm.enable = true;
    gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = true;
      games.enable = false;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
    };
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
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];
  programs.xwayland.enable = true;

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
