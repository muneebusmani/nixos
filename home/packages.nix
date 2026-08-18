{ pkgs, ... }: {
  home.packages = with pkgs; [
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
    gh
    zoxide
    glab
    mcfly
  ];

}
