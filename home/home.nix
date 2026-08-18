{ pkgs, ... }:
{
  programs = {
    home-manager.enable = true;
    mcfly = {
      enable = true;
      enableZshIntegration = true;
    };
    delta.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
  home = {
    packages = with pkgs; [
      nixpkgs-fmt
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
