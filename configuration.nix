# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs,inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    	
      ./hardware-configuration.nix
      ./system/boot.nix
      ./system/locale.nix
      ./system/misc.nix
      ./system/packages.nix
      ./system/sound.nix
      ./system/gpu.nix
      # ./system/warp.nix
      ./system/wifi_bluetooth.nix
      ./system/desktop.nix
      ./system/performance.nix
      ./system/theme.nix
    ];

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."muneeb" = {
    isNormalUser = true;
    description = "muneeb";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
  # home-manager.users.muneeb = import ./home/home.nix;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.muneeb = import ./home/home.nix;
  };
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
	wget
	neovim-unwrapped
	vim
	curl
	git
	gcc
  ];
environment.variables = {
  EDITOR = "nvim";
VISUAL = "nvim";
SUDO_EDITOR = "nvim";  
BROWSER = "firefox";
};
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

