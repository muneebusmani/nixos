{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  # Add other dependencies here
}:

rustPlatform.buildRustPackage rec {
  pname = "app-name";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "github-user";
    repo = "repo-name";
    rev = version;
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Put a fake hash first
  };

  cargoHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Put a fake hash first

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ ];

  meta = {
    description = "A short description";
    homepage = "https://github.com/github-user/repo-name";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.muneebusmani ];
  };
}
