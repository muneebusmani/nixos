{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./hardware-configuration.nix # ABSOLUTELY CRITICAL: Verify this path!
      ./system/boot.nix
      ./system/locale.nix
      ./system/misc.nix
      ./system/packages.nix
      ./system/sound.nix
      ./system/warp.nix
      ./system/wifi_bluetooth.nix
      ./system/xserver.nix
      ./system/performance.nix
      # ./system/gpu.nix
    ];


  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
    luajitPackages.lua-lsp
  ];
  programs.zsh.enable = true;
  users.users.muneeb = { # Replace 'muneeb' with your username
    isNormalUser = true;
    description = "Muneeb Usmani";
    extraGroups = [ "networkmanager" "wheel" "www" "audio" "video"];
    shell = pkgs.zsh;
    # packages = with pkgs; [
    # ]; # Add user packages here
  };
  programs.firefox.enable = true;


  system.stateVersion = "24.11"; # Or your actual state version. VERY IMPORTANT!

  # ... (Add any other settings you might have had) ...

}
