{ config, pkgs, ...  }:{
  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true; # If you use NVIDIA, keep this and configure drivers
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  networking.hostName = "nixos"; # Replace with your hostname
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Karachi"; # Replace with your timezone
  services.printing.enable = true; # If you use printing
  services.gvfs.enable = true;
}
