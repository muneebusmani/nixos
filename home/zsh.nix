{ pkgs, ... }: {
  programs.zsh = {
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

}
