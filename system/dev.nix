{ pkgs, ... }:
{
  # ---------------------------------------------------------------------------
  # Services & Databases (MERN, PERN, LNMP, Docker)
  # ---------------------------------------------------------------------------

  # Docker setup
  virtualisation.docker.enable = true;
  users.users.muneeb.extraGroups = [ "docker" ];
  programs.npm.enable = true;
  services = {

    # PostgreSQL (PERN)
    postgresql = {
      enable = true;
      ensureDatabases = [ "local_dev" ];
      authentication = pkgs.lib.mkOverride 10 ''
        local all all trust
        host all all 127.0.0.1/32 trust
      '';
    };

    # MongoDB (MERN)
    mongodb.enable = true;

    # MariaDB / MySQL (LNMP)
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    # Redis
    redis.servers."".enable = true;

    # Web Server (Nginx)
    nginx.enable = true;

    # PHP-FPM for LNMP
    phpfpm.pools.www = {
      user = "muneeb";
      group = "nginx";
      settings = {
        "pm" = "dynamic";
        "pm.max_children" = 5;
        "pm.start_servers" = 2;
        "pm.min_spare_servers" = 1;
        "pm.max_spare_servers" = 3;
        "pm.max_requests" = 500;
      };
    };
  };

  # environment.sessionVariables = {
  #   PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
  #   PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";
  #   PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
  #   PLAYWRIGHT_LAUNCH_OPTIONS_EXECUTABLE_PATH = "${pkgs.google-chrome}/bin/google-chrome-stable";
  #
  #   # --- Add these overrides for the FHS Sandbox Error ---
  #   # Forces the language server to use persistent un-isolated home directories
  #   XDG_CACHE_HOME = "$HOME/.cache";
  #   XDG_DATA_HOME = "$HOME/.local/share";
  #   XDG_STATE_HOME = "$HOME/.local/state";
  #   XDG_CONFIG_HOME = "$HOME/.config";
  #
  #   # Specific bypass for Antigravity's Go-based background language server
  #   ANTIGRAVITY_DATA_DIR = "$HOME/.config/antigravity";
  # };

  # ---------------------------------------------------------------------------
  # Development Packages (Runtimes, DevOps, DB Tools, LSPs)
  # ---------------------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    # --- Runtimes & SDKs ---
    (
      with dotnetCorePackages;
      combinePackages [
        aspnetcore_6_0
        aspnetcore_7_0
        aspnetcore_8_0
        aspnetcore_9_0
        aspnetcore_10_0
        # aspnetcore_11_0
        sdk_6_0
        sdk_7_0
        sdk_8_0
        sdk_9_0
        sdk_10_0
        # sdk_11_0
      ]
    )
    mono
    python314
    python314Packages.tkinter
    php85
    php85Packages.composer
    nodejs
    go
    rustc
    cargo
    ruby

    # Node Package Managers & CLI Tools
    # npm
    lazynpm
    yarn
    pnpm
    typescript
    nodemon
    prettier

    wget
    neovim-unwrapped
    wl-clipboard
    vim
    curl
    git
    gcc

    # --- Build Tools ---
    gcc
    gnumake
    ghostscript
    mermaid-cli
    texliveFull
    jdk
    lua5_1

    # --- Database & DevOps Tools ---
    # mongosh
    # dbeaver-bin
    postman
    docker-compose
    # awscli2
    # terraform
    gh

    # --- Editors & CLI Utilities ---
    # antigravity-hub
    # antigravity-acp
    codex
    antigravity-cli
    playwright-driver
    # antigravity-ide-fhs
    antigravity-ide
    claude-code
    google-chrome
    chromium
    # gemini-cli
    # ollama
    lmstudio
    vscode-fhs
    zed-editor-fhs
    # jetbrains.phpstorm
    # jetbrains.webstorm
    # jetbrains.rider
    git
    fzf
    ripgrep
    fd
    python314Packages.pynvim
    lazygit
    lazydocker
    sqlite

    # --- LSPs & Formatters ---
    tree-sitter
    lua-language-server
    luarocks
    stylua
    nil
    nixfmt
    statix
    rust-analyzer
  ];
}
