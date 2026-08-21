{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # System tools
    git
    ripgrep
    fd
    fzf
    gcc
    gnumake
    wget
    curl

    # Bleeding Edge TS Tooling
    oxc # Provides oxlint and oxfmt
    typescript-go # Provides tsgo LSP
    tsgolint # Provides tsgolint CLI

    # Core SDKs and Language Servers
    nodejs
    tailwindcss-language-server
    lua-language-server
    pyright
    gopls
    rust-analyzer
    dotnet-sdk_8
    nixd
    stylua
    shfmt
    ruff
    golangci-lint
    vscode-langservers-extracted # CSS, HTML, JSON LSPs
  ];
}
