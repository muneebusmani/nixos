{
  lib,
  fetchFromGitHub,
  libcosmicAppHook,
  rustPlatform,
  just,
  stdenv,
  nix-update-script,
  pkg-config,
  dbus,
  glib,
}:

rustPlatform.buildRustPackage {
  pname = "cosmic-ext-applet-clipboard-manager";
  version = "feature-global-shortcut";

  src = fetchFromGitHub {
    owner = "luks-santos";
    repo = "clipboard-manager";
    rev = "feature/global-shortcut";
    hash = "sha256-fCiAez/NlmzMdjMgp5aiEP7Y05Myo5tdyiOUkqsr8XY=";
  };

  cargoHash = "sha256-D9w9dulW8hsNc4TDvF+RcyXtsUdtvaVEjnZ8eJKrWeA=";

  nativeBuildInputs = [
    libcosmicAppHook
    just
    pkg-config
  ];

  buildInputs = [
    dbus
    glib
  ];

  dontUseJustBuild = true;
  dontUseJustCheck = true;

  justFlags = [
    "--set"
    "prefix"
    (placeholder "out")
    "--set"
    "bin-src"
    "target/${stdenv.hostPlatform.rust.cargoShortTarget}/release/cosmic-ext-applet-clipboard-manager"
  ];

  postPatch = ''
    sed -i 's/`git rev-parse --short HEAD`/"master"/g' justfile
  '';

  preCheck = ''
    export XDG_RUNTIME_DIR="$TMP"
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    homepage = "https://github.com/cosmic-utils/clipboard-manager";
    description = "Clipboard manager for the COSMIC Desktop Environment";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [
      muneebusmani
    ];
    platforms = lib.platforms.linux;
    mainProgram = "cosmic-ext-applet-clipboard-manager";
  };
}
# {
#   lib,
#   fetchFromGitHub,
#   fetchpatch, # <--- Add this here
#   libcosmicAppHook,
#   rustPlatform,
#   just,
#   stdenv,
#   nix-update-script,
#   pkg-config,
#   dbus,
#   glib,
# }:
#
# rustPlatform.buildRustPackage {
#   pname = "cosmic-ext-applet-clipboard-manager";
#   version = "master";
#
#   src = fetchFromGitHub {
#     owner = "cosmic-utils";
#     repo = "clipboard-manager";
#     rev = "master";
#     hash = "sha256-XyJwW+yXhrTl6dYsIBBLE29J9ecmuhOBGYv6H+GVVtU=";
#   };
#
#   cargoHash = "sha256-ABo4fAtFCaIyNukOUZqHpBhR0fANkb/h7lz755LyRpA=";
#
#   # Add the patches block right here
#   patches = [
#     (fetchpatch {
#       url = "https://github.com/cosmic-utils/clipboard-manager/compare/master...luks-santos:clipboard-manager:feature/global-shortcut.patch";
#       hash = "sha256-CsiBu/eGzZwHhMyK4NiinkDgVfPYw6d07fJreDv0rDE=";
#     })
#   ];
#
#   nativeBuildInputs = [
#     libcosmicAppHook
#     just
#     pkg-config
#   ];
#
#   buildInputs = [
#     dbus
#     glib
#   ];
#
#   dontUseJustBuild = true;
#   dontUseJustCheck = true;
#
#   justFlags = [
#     "--set"
#     "prefix"
#     (placeholder "out")
#     "--set"
#     "bin-src"
#     "target/${stdenv.hostPlatform.rust.cargoShortTarget}/release/cosmic-ext-applet-clipboard-manager"
#   ];
#
#   postPatch = ''
#     sed -i 's/`git rev-parse --short HEAD`/"master"/g' justfile
#   '';
#
#   preCheck = ''
#     export XDG_RUNTIME_DIR="$TMP"
#   '';
#
#   passthru.updateScript = nix-update-script { };
#
#   meta = {
#     homepage = "https://github.com/cosmic-utils/clipboard-manager";
#     description = "Clipboard manager for the COSMIC Desktop Environment";
#     license = lib.licenses.gpl3Only;
#     maintainers = with lib.maintainers; [
#       muneebusmani
#     ];
#     platforms = lib.platforms.linux;
#     mainProgram = "cosmic-ext-applet-clipboard-manager";
#   };
# }
# {
#   lib,
#   fetchFromGitHub,
#   libcosmicAppHook,
#   rustPlatform,
#   just,
#   stdenv,
#   nix-update-script,
#   pkg-config,
#   dbus,
#   glib,
# }:
#
# rustPlatform.buildRustPackage {
#   pname = "cosmic-ext-applet-clipboard-manager";
#   version = "master";
#
#   src = fetchFromGitHub {
#     owner = "cosmic-utils";
#     repo = "clipboard-manager";
#     rev = "master";
#     hash = "sha256-XyJwW+yXhrTl6dYsIBBLE29J9ecmuhOBGYv6H+GVVtU=";
#   };
#
#   cargoHash = "sha256-ABo4fAtFCaIyNukOUZqHpBhR0fANkb/h7lz755LyRpA=";
#
#   nativeBuildInputs = [
#     libcosmicAppHook
#     just
#     pkg-config
#   ];
#
#   buildInputs = [
#     dbus
#     glib
#   ];
#
#   dontUseJustBuild = true;
#   dontUseJustCheck = true;
#
#   justFlags = [
#     "--set"
#     "prefix"
#     (placeholder "out")
#     "--set"
#     "bin-src"
#     "target/${stdenv.hostPlatform.rust.cargoShortTarget}/release/cosmic-ext-applet-clipboard-manager"
#   ];
#
#   postPatch = ''
#     sed -i 's/`git rev-parse --short HEAD`/"master"/g' justfile
#   '';
#
#   preCheck = ''
#     export XDG_RUNTIME_DIR="$TMP"
#   '';
#
#   passthru.updateScript = nix-update-script { };
#
#   meta = {
#     homepage = "https://github.com/cosmic-utils/clipboard-manager";
#     description = "Clipboard manager for the COSMIC Desktop Environment";
#     license = lib.licenses.gpl3Only;
#     maintainers = with lib.maintainers; [
#       muneebusmani
#     ];
#     platforms = lib.platforms.linux;
#     mainProgram = "cosmic-ext-applet-clipboard-manager";
#   };
# }
# {
#   lib,
#   fetchFromGitHub,
#   libcosmicAppHook,
#   rustPlatform,
#   just,
#   stdenv,
#   nix-update-script,
#   git,
# }:
#
# rustPlatform.buildRustPackage {
#
#   pname = "cosmic-ext-applet-clipboard-manager";
#   version = "master";
#   src = fetchFromGitHub {
#     owner = "cosmic-utils";
#     repo = "clipboard-manager";
#     rev = "master";
#     hash = "sha256-XyJwW+yXhrTl6dYsIBBLE29J9ecmuhOBGYv6H+GVVtU=";
#   };
#   cargoHash = "sha256-ABo4fAtFCaIyNukOUZqHpBhR0fANkb/h7lz755LyRpA=";
#   nativeBuildInputs = [
#     libcosmicAppHook
#     just
#     git
#   ];
#   dontUseJustBuild = true;
#   dontUseJustCheck = true;
#   # justFlags = [
#   #   "--set"
#   #   "prefix"
#   #   (placeholder "out")
#   #   "--set"
#   #   "env-dst"
#   #   "${placeholder "out"}/etc/profile.d/cosmic-ext-applet-clipboard-manager.sh"
#   #   "--set"
#   #   "bin-src"
#   #   "target/${stdenv.hostPlatform.rust.cargoShortTarget}/release/cosmic-ext-applet-clipboard-manager"
#   # ];
#   justFlags = [
#     "--set"
#     "prefix"
#     (placeholder "out")
#     "--set"
#     "bin-src"
#     "target/${stdenv.hostPlatform.rust.cargoShortTarget}/release/cosmic-ext-applet-clipboard-manager"
#   ];
#
#   preCheck = ''
#     export XDG_RUNTIME_DIR="$TMP"
#   '';
#   passthru.updateScript = nix-update-script { };
#   meta = {
#     homepage = "https://github.com/cosmic-utils/clipboard-manager";
#     description = "Clipboard manager for the COSMIC Desktop Environment";
#     license = lib.licenses.gpl3Only;
#     maintainers = with lib.maintainers; [
#       muneebusmani
#     ];
#     platforms = lib.platforms.linux;
#     mainProgram = "cosmic-ext-applet-clipboard-manager";
#
#   };
#
# }
