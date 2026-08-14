{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./system/boot.nix
    ./system/desktop.nix
    ./system/dev.nix
    ./system/env.nix
    ./system/gaming.nix
    ./system/locale.nix
    ./system/misc.nix
    ./system/nvidia.nix
    ./system/packages.nix
    ./system/sound.nix
    ./system/tweaks.nix
    ./system/warp.nix
    ./system/wifi_bluetooth.nix
    ./system/nordvpn.nix
    ./system/theme.nix
  ];
  services.libinput.enable = true;
  users.users."muneeb" = {
    isNormalUser = true;
    description = "muneeb";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  # home-manager.users.muneeb = import ./home/home.nix;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    # useGlobalPkgs = true;
    useUserPackages = true;
    users.muneeb = import ./home/home.nix;

  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
