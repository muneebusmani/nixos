{ pkgs, ... }: {
  programs.kitty = {
    extraConfig = "
      hide_window_decorations yes
      x11_hide_window_decorations True
      shell /usr/bin/env zsh
      cursor_trail 3
      repaint_delay 0
      input_delay 0
      sync_to_monitor yes
      confirm_os_window_close 0
      remember_window_size  yes
      enable_audio_bell no
      single_window_padding_width 0
      ";

    enable = true;
    enableGitIntegration = true;
    autoThemeFiles = {
      dark = "Catppuccin-Mocha";
      light = "Catppuccin-Latte";
      noPreference = "Catppuccin-Mocha";
    };
    shellIntegration = {
      mode = "enabled";
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 16;
    };
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      window_padding_width = 5;
      # background_opacity = "0.75";
      # background_blur = "32";
    };
    themeFile = "Catppuccin-Mocha";
  };

}
