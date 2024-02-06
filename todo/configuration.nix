{ ... }: {
  # Your hardware configuration
  imports = [ ./system/hardware-configuration.nix ];

  # Hostname
  networking.hostName = "nixos";

  garuda = {
    dr460nized.enable = true;
    gaming.enable = true;
    performance-tweaks = {
      cachyos-kernel = true;
      enable = true;
    };
  };
}

