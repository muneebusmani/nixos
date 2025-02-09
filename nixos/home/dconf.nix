# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{

  dconf.settings = {
    "org/gnome/GWeather4" = {
      temperature-unit = "centigrade";
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-seconds = true;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-console" "gnome-power-panel" "org-gnome-settings" "org-gnome-characters" "firefox" "phpstorm" "ca-desrt-dconf-editor" ];
    };

    "org/gnome/desktop/notifications/application/ca-desrt-dconf-editor" = {
      application-id = "ca.desrt.dconf-editor.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-characters" = {
      application-id = "org.gnome.Characters.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/phpstorm" = {
      application-id = "phpstorm.desktop";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = [ "org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" "autoclose-xwayland" "xwayland-native-scaling" ];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-from = 0.0;
      night-light-schedule-to = 0.0;
      night-light-temperature = mkUint32 3700;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "Launch Kitty";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>e";
      command = "nautilus";
      name = "Launch Nautilus";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>b";
      command = "firefox";
      name = "Launch Firefox";
    };

    "org/gnome/shell" = {
      enabled-extensions = [  "hibernate-status@dromi" "user-theme@gnome-shell-extensions.gcampax.github.com" "caffeine@patapon.info" "hidetopbar@mathieu.bidon.ca" 
        # "blur-my-shell@aunetx" 
        "dash-to-dock@micxgx.gmail.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "thunderbird.desktop" "firefox.desktop" "phpstorm.desktop" "webstorm.desktop" "code.desktop" "kitty.desktop" "com.github.eneshecan.WhatsAppForLinux.desktop" "org.telegram.desktop.desktop" "skypeforlinux.desktop" "org.qbittorrent.qBittorrent.desktop" "writer.desktop" "calc.desktop" "vlc.desktop" ];
    };

    # "org/gnome/shell/extensions/blur-my-shell" = {
    #   hacks-level = 2;
    #   settings-version = 2;
    # };

    # "org/gnome/shell/extensions/blur-my-shell/applications" = {
    #   blur = true;
    #   dynamic-opacity = false;
    #   enable-all = true;
    # };

    # "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
    #   pipeline = "pipeline_default";
    # };

    # "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
    #   pipeline = "pipeline_default_rounded";
    # };
    #
    # "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
    #   pipeline = "pipeline_default";
    # };
    #
    # "org/gnome/shell/extensions/blur-my-shell/overview" = {
    #   pipeline = "pipeline_default";
    # };
    #
    # "org/gnome/shell/extensions/blur-my-shell/panel" = {
    #   pipeline = "pipeline_default";
    #   static-blur = true;
    # };
    #
    # "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
    #   pipeline = "pipeline_default";
    # };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = 5;
      toggle-state = false;
      user-enabled = false;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.8;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
      show-apps-at-top = true;
      show-mounts-network = true;
    };

    "org/gnome/shell/extensions/hidetopbar" = {
      keep-round-corners = true;
      mouse-sensitive = true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
      show-hidden = true;
    };

  };
}

