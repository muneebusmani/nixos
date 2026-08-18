{ _, ... }: {
  environment = {
    sessionVariables = {
      # NH_FLAKE = "/home/$USER/dotfiles";
      NIXOS_OZONE_WL = "1";
      PATH = [
        "$HOME/.npm-global/bin"
        "$HOME/.local/bin"
      ];

    };
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      SUDO_EDITOR = "nvim";
      BROWSER = "firefox";
    };
  };

}
