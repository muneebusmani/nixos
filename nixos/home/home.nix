{  pkgs, ... }:
{
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  home = {
    packages = with pkgs; [ # CLI tools for home.nix
      vim
      nixpkgs-fmt
      power-profiles-daemon
      lazydocker
      caffeine-ng
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
      beauty-line-icon-theme
      sweet
      font-awesome
      font-awesome_5
      font-awesome_4
      vscode.fhs
      neovim-unwrapped
      dotnet-sdk_8
      nodePackages.nodejs
      nodePackages.ts-node
      typescript
      php84Packages.composer
      fzf
      bun
      luarocks
      python3
      stylua
      rustc
      cargo
      ruby
      mono
      glib
      go
      sass
      scss-lint
      tmux
      gh # Github CLI
      laravel
      zoxide
      glab # Gitlab CLI
    ];
    username = "muneeb";
    stateVersion = "24.11";
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

