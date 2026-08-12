{ pkgs, inputs, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import inputs.nur { inherit pkgs; };
  };
  services.flatpak.enable = true;
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "dotnet-sdk-7.0.410"
    "aspnetcore-runtime-6.0.36"
    "aspnetcore-runtime-7.0.20"
    "broadcom-sta-6.30.223.271-63-7.1.5"
  ];
  environment.systemPackages = with pkgs; [
    # GUI tools for configuration.nix
    (
      with dotnetCorePackages;
      combinePackages [
        aspnetcore_6_0
        aspnetcore_7_0
        aspnetcore_8_0
        aspnetcore_9_0
        aspnetcore_10_0
        aspnetcore_11_0
        sdk_6_0
        sdk_7_0
        sdk_8_0
        sdk_9_0
        sdk_10_0
        sdk_11_0
      ]
    )
    python314
    rustc
    cargo
    php85
    php85Packages.composer
    vlc
    # gnome-tweaks
    # dconf
    # dconf-editor
    # jetbrains.phpstorm
    # jetbrains.webstorm
    # jetbrains.rider
    libreoffice
    catppuccin
    catppuccin-gtk
    # EasyEffects
    spotify
    discord
    kitty
    bat
    nvtopPackages.full # Works for NVIDIA, AMD, and Intel
    mangohud # Good for checking framerates
    pciutils # Helps detect hardware
    themechanger
    adw-gtk3
    neovim
    go
    git
    gnumake
    gcc
    ripgrep
    fd
    unzip
    nodejs
    tree-sitter
    lua-language-server
    stylua
    nil # Nix LSP
    wgnord
    nixfmt
    statix
  ];
}
