# 💫 https://github.com/LinuxBeginnings 💫 #
# Packages for this host only
{ pkgs, ... }:
let
  python-packages = pkgs.python3.withPackages (
    ps: with ps; [
      requests
      pyquery # needed for hyprland-dots Weather script
    ]
  );
in
{
  environment.systemPackages =
    (with pkgs; [
      # System Packages
      fastfetch
    ])
    ++ [
      python-packages
    ];
  systemd.services.flatpak-repo = {
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

}
