{ pkgs, ... }:
{
  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "pink";
    firefox.enable = true;
    bat.enable = true;
    btop.enable = true;
    cursors.enable = true;
    eza.enable = true;
    gtk.icon.enable = false;
    lazygit.enable = true;
    mpv.enable = true;
    obs.enable = true;
    spotify-player.enable = true;
    starship.enable = true;
    thunderbird.enable = true;
    tmux.enable = true;
    zsh-syntax-highlighting.enable = true;
  };
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
  programs = {
    home-manager.enable = true;
    # fzf = {
    #   enable = true;
    #   enableZshIntegration = true;
    # };

    mcfly = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      package = pkgs.zsh;
      enable = true;
      autocd = true;
      initContent = ''
        setopt nomatch
        setopt notify
        setopt extendedglob
        unsetopt beep
      '';
      shellAliases = {
        cat = "bat";
        cd = "z";
        "c." = "code .";
        update-sys = "sudo nixos-rebuild switch";
        update-home = "home-manager switch";
        op = "nvim ~/.config/home-manager/home.nix";
        dg = "dotnet aspnet-codegenerator";
        cls = "clear";
        q = "exit";
        tarnow = "tar - acf ";
        untar = "tar - zxvf ";
        wget = "wget - c ";
        dir = "dir - -color=auto";
        vdir = "vdir - -color=auto";
        hw = "hwinfo - -short"; # Hardware Info
        ip = "ip - color";
        please = "sudo";
        jctl = "journalctl -p 3 -xb";
        ngc = "ng g c";
        open = "xdg-open";
        ngs = "ng serve";
        ndir = "cd ~/.config/nvim/";
        cdir = "cd ~/coding/";
        edge = "microsoft-edge-stable";
        ts = "tmux";
        tad = "tmux attach";
        sc-restart = "sudo systemctl restart";
        sc-stop = "sudo systemctl stop";
        sc-start = "sudo systemctl start";
        sc-status = "sudo systemctl status";
        sc-hiber = "sudo systemctl hibernate";
        sc-sleep = "sudo systemctl hybrid-sleep";
        sc-poff = "sudo systemctl poweroff";
        sc-rbt = "sudo systemctl reboot";
        sc-srbt = "sudo systemctl soft-reboot";
        sc-spd = "sudo systemctl suspend";
        sc-shiber = "sudo systemctl suspend-then-hibernate";
        ".." = "cd ../";
        "..." = "cd .../";
        "...." = "cd ..../";
        "....." = "cd ...../";
        "......" = "cd ....../";
        ls = "exa -@lagbh --no-git --no-permissions --no-filesize --no-user  --changed --sort=type";
        lazyvim = "NVIM_APPNAME=lazyvim nvim";
      };
      autosuggestion.enable = true;
      sessionVariables = {
        DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
        PATH = "$PATH:/home/muneeb/.dotnet/tools";
        ZSH_TMUX_AUTOSTART = true;
        ZSH_TMUX_AUTOQUIT = false;
        VI_MODE_RESET_PROMPT_ON_MODE_CHANGE = true;
        VI_MODE_SET_CURSOR = true;
        VISUAL = "nvim";
        EDITOR = "nvim";
        SUDO_EDITOR = "nvim";
      };
      syntaxHighlighting = {
        enable = true;
        package = pkgs.zsh-syntax-highlighting;
      };
      plugins = [
        {
          name = "zsh-defer";
          src = "${pkgs.zsh-defer}/share/zsh-defer";
          file = "zsh-defer.plugin.zsh";
        }
        {
          name = "fzf-tab";
          src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];
      oh-my-zsh = {
        enable = true;
        package = pkgs.oh-my-zsh;
        # theme = "gozilla";
        plugins = [
          "git"
          "aliases"
          "tmux"
          "vi-mode"
          # "colored-man-pages"
          "zoxide"
          # "dotnet"
          # "composer"
          # "laravel"
          # "node"
          # "npm"
          # "docker"
          # "docker-compose"
          # "web-search"
          "vi-mode"
          "ssh"
          "rsync"
          # "redis-cli"
          # "python"
          # "postgres"
          # "pip"
          # "npm"
          # "ng"
          # "nestjs"
          # "mongocli"
          # "kitty"
          # "git-lfs"
          # "github"
          # "gitfast"
          # "gh"
          # "fzf"
          # "uv"
          # "flutter"
          "eza"
          "emoji"
          "emoji-clock"
          "aliases"
          "alias-finder"
        ];
      };
    };
    tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      plugins = with pkgs; [
        tmuxPlugins.catppuccin
        tmuxPlugins.yank
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.resurrect
        tmuxPlugins.continuum
      ];
      keyMode = "vi";
      baseIndex = 1;
      shortcut = "space";
      mouse = true;
      newSession = true;
      escapeTime = 10;
      customPaneNavigationAndResize = true;
      # terminal = "tmux-256color";
      # terminal = "xterm-kitty:RGB";
      extraConfig = ''
        # set-option -sa terminal-features "xterm-kitty:RGB"
        # set-option -g focus-events on
        # set -g mouse on
        # set-option -g history-limit 10000
        # set -g renumber-windows on
        # bind \` switch-client -t'{marked}'
        # bind-key "|" split-window -h -c "#{pane_current_path}"
        # bind-key "-" split-window -v -c "#{pane_current_path}"
        # bind-key "\\" split-window -fh -c "#{pane_current_path}"
        # bind-key "_" split-window -fv -c "#{pane_current_path}"
        # bind -r "<" swap-window -d -t -1
        # bind -r ">" swap-window -d -t +1
        # bind -n M-n new-window -c "#{pane_current_path}"
        # bind -n M-q killp
        # bind Space last-window
        # bind-key C-Space switch-client -l
        # set -g @yank_selection primary # or 'secondary' or 'clipboard'
        # set -g @continuum-restore 'on'
        # Basic
        # set -s default-terminal 'tmux-256color'
              set-option -a terminal-features 'alacritty:RGB'
        # set-option -sa terminal-features "tmux-256color,xterm-256color,xterm-kitty:RGB"
              set-option -sg escape-time 10
              set-option -g focus-events on
              set -g mouse on
              set-option -g history-limit 5000
              set -g base-index 1
              setw -g pane-base-index 1
              set -g renumber-windows on
              unbind C-a
              unbind C-b
              unbind C-Space
              set -g prefix C-Space
              bind C-Space send-prefix
              bind -n M-r source-file ~/.tmux.conf \; display "Reloaded!"
              bind \` switch-client -t'{marked}'
              bind-key "|" split-window -h -c "#{pane_current_path}"
              bind-key "-" split-window -v -c "#{pane_current_path}"
              bind-key "\\" split-window -fh -c "#{pane_current_path}"
              bind-key "_" split-window -fv -c "#{pane_current_path}"
              bind -n M-n new-window -c "#{pane_current_path}"
              bind -n M-q killp
              bind -n M-h previous-window
              bind -n M-l next-window
              bind -r "<" swap-window -d -t -1
              bind -r ">" swap-window -d -t +1
        # bind Space last-window
        # bind-key C-Space switch-client -l
        # Remap the keys for switching windows
        # set -g @plugin 'tmux-plugins/tmux-sensible'
        # set -g @plugin 'tmux-plugins/tpm'
        # set -g @plugin 'tmux-plugins/tmux-yank'
        # set -g @plugin 'christoomey/vim-tmux-navigator'
        # set -g @plugin 'catppuccin/tmux'
        # set -g @plugin 'tmux-plugins/tmux-resurrect'
        # set -g @plugin 'tmux-plugins/tmux-continuum'
        # set -g @plugin 'tmux-plugins/tmux-copycat'
        # set -g @plugin 'tmux-plugins/tmux-open'
        # set -g @plugin 'tmux-plugins/tmux-battery'
        # set -g @plugin 'wfxr/tmux-power'
        # set -g @plugin 'wfxr/tmux-net-speed'
        # set -g @plugin 'wfxr/tmux-web-reachable'
        # set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
        # set -g @plugin 'wfxr/tmux-fzf-url'
        # set -g @plugin 'erikw/tmux-powerline'
        # set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha
        # set -g @catppuccin_window_status_enable "yes"
        # set -g @catppuccin_window_status_icon_enable "yes"
        # set -g @catppuccin_status_default "yes"
        # set -g status-right '#{battery_status_bg} Batt: #{battery_icon} #{battery_percentage} #{battery_remain} | %a %h-%d %H:%M '
        # set -g @tmux_power_theme '#f2cdcd' # Catppuccin Flamingo
        # set -g @tmux_power_theme '#f38ba8' # Catppuccin Red
        # set -g @tmux_power_theme '#f5c2e7' # Catppuccin Red
        # set -g @tmux_power_date_format '%D'
        # set -g @tmux_power_time_format '%I:%M %p'
        # set -g @tmux_power_show_upload_speed true
        # set -g @tmux_power_show_download_speed true
        # set -g @tmux_power_prefix_highlight_pos 'LR'
        # set -g @tmux_power_show_web_reachable true
        # set -g @resurrect-strategy-nvim 'session'
        # set -g @resurrect-capture-pane-contents 'on'
        # set -g @continuum-restore 'on'
        # set -g @continuum-boot 'on'
        # set -g @yank_selection clipboard # or 'secondary' or 'primary'
        # set -g @open 'x'
        # set -g @open-editor 'C-x'
        # set -g @open-B 'https://www.bing.com/search?q='
        # set -g @open-S 'https://www.google.com/search?q='
        # set -g @fzf-url-bind 'x'
        # set -g @fzf-url-extra-filter 'grep -oE "\b[a-zA-Z]+\.txt\b"'
        # set -g @fzf-url-history-limit '2000'
        # set -g @fzf-url-open "microsoft-edge-stable"
        # set -g @tmux_power_show_upload_speed    true
        # set -g @tmux_power_show_download_speed  true
        # set -g @tmux_power_show_web_reachable   true
        # Vim Tmux Navigator
              is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
              | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
              bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
              bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
              bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
              bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
              tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
              if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
              if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
              bind-key -T copy-mode-vi 'C-h' select-pane -L
              bind-key -T copy-mode-vi 'C-j' select-pane -D
              bind-key -T copy-mode-vi 'C-k' select-pane -U
              bind-key -T copy-mode-vi 'C-l' select-pane -R
              bind-key -T copy-mode-vi 'C-\' select-pane -l
      '';
    };
    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
    delta.enable = true;
    # git = {
    #   enable = true;
    #   lfs.enable = true;
    #   settings = {
    #     user = {
    #       name = "Muneeb Usmani";
    #       email = "muneebusmani8355@gmail.com";
    #
    #     };
    #   };
    # };
    git = {
      enable = true;
      lfs.enable = true;
      settings = [
        {
          user = {
            name = "Muneeb Usmani";
            email = "muneebusmani8355@gmail.com";
          };
        }
        {
          credential."https://github.com" = {
            helper = [
              ""
              "!${pkgs.gh}/bin/gh auth git-credential"
            ];
          };
        }
        {
          credential."https://gist.github.com" = {
            helper = [
              ""
              "!${pkgs.gh}/bin/gh auth git-credential"
            ];
          };
        }
      ];
    };
    kitty = {
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
  };
  nixpkgs.config.allowUnfree = true;
  home = {
    packages = with pkgs; [
      # CLI tools for home.nix
      nixpkgs-fmt
      # power-profiles-daemon
      lazydocker
      # caffeine-ng
      fd
      ripgrep
      killall
      lshw
      xarchiver
      xcape
      xsel
      unzip
      git
      gcc
      wget
      ugrep
      cmake
      gnumake
      curl
      eza
      nix-init
      btop
      htop
      libinput
      zsh
      zsh-autocomplete
      zsh-autopair
      zsh-autosuggestions
      zsh-completions
      zsh-syntax-highlighting
      glib
      gh # Github CLI
      zoxide
      glab # Gitlab CLI
      mcfly
    ];
    username = "muneeb";
    stateVersion = "26.05";
    homeDirectory = "/home/muneeb";
    file = {
      ideavimrc = {
        text = ''
          set clipboard+=unnamedplus
          nnoremap d "_d
          vnoremap d "_d
          nnoremap D "_D
          vnoremap D "_D
          nnoremap c "_c
          vnoremap c "_c
          nnoremap C "_C
          vnoremap C "_C
          set easymotion
          xnoremap p P
          xnoremap d "_d
        '';
        enable = true;
        target = ".ideavimrc";
      };
      nvidia-offload = {
        source = ./nvidia-offload;
        target = ".nvidia-offload";
        enable = true;
      };
    };
  };
}
