{ _, ... }: {
  imports = [
    ./home.nix
    ./spotify.nix
    ./theme.nix
    ./gtk.nix
    ./zsh.nix
    ./tmux.nix
    ./starship.nix
    ./git.nix
    ./kitty.nix
    ./packages.nix
    ./mcfly.nix
    ./ideavimrc.nix
    ./nvidia-offload.nix

  ];
}
