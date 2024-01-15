# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Karachi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  location.longitude = 67.001137;
  location.latitude = 24.860735;
  location.provider = "manual";

  services = {
    power-profiles-daemon.enable = true;
    picom = {
      enable = true;
      vSync = true;
      fade = true;
      shadow = true;
      backend = "xrender";
    };
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      displayManager = {
        sddm.enable = true;
      };
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
      };
    };
    geoclue2 = {
      enable = true;
    };
    redshift = {
      enable = true;
      brightness = {
        # Note the string values below.
        day = "1";
        night = "0.75";
      };
      temperature = {
        day = 5500;
        night = 3700;
      };
      provider = "manual";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.muneeb = {
    isNormalUser = true;
    description = "muneeb";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    neovim
    picom-allusive
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    xborders
    kitty
    gcc
    nodejs-18_x
    polybar
    power-profiles-daemon
    ugrep
    killall
    feh
  ];
  programs.dconf.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
  boot.kernelPackages = pkgs.linuxPackages_zen;
  users.users.muneeb.shell = pkgs.zsh;
  programs.zsh.enable = true;

  home-manager.users.muneeb = { pkgs, ... }: {
    services.xcape.enable = true;
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Macchiato-Compact-Pink-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "flamingo" ];
          size = "standard";
          tweaks = [ "black" "rimless" ];
          variant = "mocha";
        };
      };
    };

    programs.bash.enable = true;
    home.stateVersion = "23.11";
    home.homeDirectory = "/home/muneeb";

    programs = {
      home-manager.enable = true;
      kitty = {
        enable = true;
        shellIntegration.mode = "enabled";
        shellIntegration.enableZshIntegration = true;
        shellIntegration.enableBashIntegration = true;
        shellIntegration.enableFishIntegration = true;
        font.name = "ComicShannsMono Nerd Font";
        font.package = pkgs.nerdfonts;
        font.size = 16;
        settings = {
          scrollback_lines = 10000;
          enable_audio_bell = false;
          confirm_os_window_close = 0;
          window_padding_width = 5;
          background_opacity = "0.80";
          background_blur = 1;
        };
        theme = "Catppuccin-Mocha";
      };
      starship = {
        enable = false;
        settings = {
          add_newline = true;
          character = {
            success_symbol = "[➜](bold green)";
            error_symbol = "[➜](bold red)";
          };
        };
      };
      tmux = {
        enable = true;
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
        terminal = "tmux-256color";
        extraConfig = ''
          set-option -sa terminal-features "xterm-kitty:RGB"
          set-option -g focus-events on
          set -g mouse on
          set-option -g history-limit 10000
          set -g renumber-windows on
          bind \` switch-client -t'{marked}'
          bind-key "|" split-window -h -c "#{pane_current_path}"
          bind-key "-" split-window -v -c "#{pane_current_path}"
          bind-key "\\" split-window -fh -c "#{pane_current_path}"
          bind-key "_" split-window -fv -c "#{pane_current_path}"
          bind -r "<" swap-window -d -t -1
          bind -r ">" swap-window -d -t +1
          bind -n M-n new-window -c "#{pane_current_path}"
          bind -n M-q killp
          bind Space last-window
          bind-key C-Space switch-client -l
          set -g @yank_selection primary # or 'secondary' or 'clipboard'
          set -g @continuum-restore 'on'
        '';
      };
      zsh = {
        package = pkgs.zsh;
        enable = true;
        autocd = true;
        shellAliases = {
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
          grep = "ugrep - -color=auto";
          fgrep = "ugrep - F - -color=auto";
          egrep = "ugrep - E - -color=auto";
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
          ".." = "cd ../";
          "..." = "cd .../";
          "...." = "cd ..../";
          "....." = "cd ...../";
          "......" = "cd ....../";
          ls = "exa -@lagbh --no-git --no-permissions --no-filesize --no-user  --changed";
          lazy = "NVIM_APPNAME=lazy nvim";
          packer = "NVIM_APPNAME=packer nvim";
        };
        enableAutosuggestions = true;
        sessionVariables = {
          DOTNET_ROOT = "$(dirname $(which dotnet))";
          PATH = "$PATH:/home/muneeb/.dotnet/tools";
          ZSH_TMUX_AUTOSTART = true;
          ZSH_TMUX_AUTOQUIT = false;
          VI_MODE_RESET_PROMPT_ON_MODE_CHANGE = true;
          VI_MODE_SET_CURSOR = true;
        };
        sessionVariables = {
          VISUAL = "nvim";
          EDITOR = "nvim";
          SUDO_EDITOR = "nvim";
        };
        syntaxHighlighting = {
          enable = true;
          package = pkgs.zsh-syntax-highlighting;
        };
        oh-my-zsh = {
          enable = true;
          package = pkgs.oh-my-zsh;
          theme = "robbyrussell";
          plugins = [
            "git"
            "node"
            "npm"
            "ng"
            "web-search"
            "aliases"
            "dotnet"
            "tmux"
            "vi-mode"
          ];
        };
      };
    };
    home.packages = with pkgs ; [
      nerdfonts
      git
      microsoft-edge
      vim
      neovim
      nodejs-18_x
      gcc
      dotnet-sdk_8
      unzip
      curl
      wget
      dart
      btop
      nvtop
      htop
      docker
      docker-compose
      git
      gh
      github-desktop
      go
      fd
      php
      python3
      ripgrep
      ruby
      rustc
      cargo
      luarocks
      neovim
      lazygit
      zsh
      zsh-autocomplete
      zsh-autopair
      zsh-autosuggestions
      zsh-completions
      zsh-syntax-highlighting
      xclip
      tmux
      discord
      obs-studio
      qbittorrent
      skypeforlinux
      telegram-desktop
      tigervnc
      vlc
      vscode-fhs
      whatsapp-for-linux
      zoom
      android-studio
      php83Packages.composer
      partition-manager
      libsForQt5.kpmcore
      neofetch
      kitty
      libsForQt5.qtstyleplugin-kvantum
      eza
      nix-init
      figma-linux
      inkscape
      rofi
      dconf
      dconf2nix
      gnome.dconf-editor
      lxappearance
      catppuccin-kvantum
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-dropbox-plugin
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
      xcape
    ];
  };
  environment.xfce.excludePackages = [ pkgs.xfce.xfce4-terminal ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}
