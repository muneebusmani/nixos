{ _, ... }:
{
  programs.home-manager.enable = true;
  home = {
    username = "muneeb";
    stateVersion = "26.05";
    homeDirectory = "/home/muneeb";
  };
}
