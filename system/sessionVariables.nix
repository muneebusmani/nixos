{ config, pkgs, ... }: {
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
    PATH = "$PATH:/home/muneeb/.dotnet/tools";
    # XDG_DATA_DIRS = "$XDG_DATA_DIRS:'/var/lib/flatpak/exports/share':'/home/muneeb/.local/share/flatpak/exports/share'";
  };
}
