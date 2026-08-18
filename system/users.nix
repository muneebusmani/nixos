{ _, ... }: {
  users.users."muneeb" = {
    isNormalUser = true;
    description = "muneeb";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "scanner"
      "lp"
      "video"
      "input"
      "audio"

    ];
  };

}
