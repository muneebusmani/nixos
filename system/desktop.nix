{ pkgs, lib, ... }: {
  services = {
    displayManager.sddm = {
      enable = true;
      theme = lib.mkForce "catppuccin-sddm-corners";
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
        kdePackages.qt5compat
      ];
      settings = {
        General = {
          InputMethod = "";
        };
      };
    };

    tumbler.enable = true;

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  # Enable Hyprland module
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Hint Electron apps to run on Wayland natively
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment = {
    systemPackages = with pkgs; [
      # SDDM Theme
      catppuccin-sddm-corners

      # Core Wayland & Hyprland UI
      waybar
      rofi
      awww # Wallpaper daemon

      # Screen & Session Management
      hypridle
      hyprlock
      wlogout
      grimblast # Screenshots
      slurp # Screen area selection

      # Clipboard (Replaces the broken COSMIC applet)
      wl-clipboard
      cliphist

      # Theming & Terminal
      nwg-look
      wallust

      # JaKooLit / LinuxBeginnings Script Dependencies
      jq
      polkit_gnome
      networkmanagerapplet
      pamixer
      playerctl
      brightnessctl
      blueman
    ];
  };

  programs.xwayland.enable = true;
}
