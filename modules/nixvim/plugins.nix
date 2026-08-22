{ _, ... }: {
  programs.nixvim.plugins = {
    # UI
    bufferline.enable = true;
    lualine.enable = true;
    noice.enable = true;
    web-devicons.enable = true;

    # Snacks (Replaces Telescope, Nvim-tree, and dashboard)
    snacks = {
      enable = true;
      autoLoad = true;
      settings = {
        bigfile.enabled = true;
        dashboard.enabled = true;
        explorer.enabled = true;
        indent.enabled = true;
        input.enabled = true;
        picker.enabled = true;
        notifier.enabled = true;
        quickfile.enabled = true;
        scope.enabled = true;
        scroll.enabled = true;
        statuscolumn.enabled = true;
        words.enabled = true;
      };
    };

    # Treesitter
    treesitter = {
      enable = true;
      nixGrammars = false;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        ensure_installed = [
          "angular"
          "astro"
          "bash"
          "c"
          "c_sharp"
          "css"
          "dart"
          "diff"
          "dockerfile"
          "git_config"
          "git_rebase"
          "gitcommit"
          "gitignore"
          "go"
          "gomod"
          "html"
          "java"
          "javascript"
          "jsdoc"
          "json"
          "kotlin"
          "lua"
          "markdown"
          "markdown_inline"
          "nix"
          "php"
          "prisma"
          "python"
          "query"
          "regex"
          "rust"
          "sql"
          "svelte"
          "toml"
          "tsx"
          "twig"
          "typescript"
          "vim"
          "vimdoc"
          "xml"
          "yaml"
        ];
      };
    };
    treesitter-textobjects.enable = true;
    ts-autotag.enable = true;
    treesitter-context.enable = true;

    # Editor
    grug-far.enable = true;
    flash.enable = true;
    gitsigns.enable = true;
    trouble.enable = true;
    todo-comments.enable = true;
    indent-blankline.enable = true;

    # Coding
    mini = {
      enable = true;
      modules = {
        pairs = { };
        ai = { };
        icons = { };
        comment = { };
        surround = { };
        hipatterns = { };
      };
    };
    ts-comments.enable = true;
    lazydev.enable = true;
    neogen.enable = true;

    # Autocompletion
    blink-cmp.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
      ];
    };
    luasnip.enable = true;

    # AI
    copilot-lua.enable = true;

    # Debugging
    dap-ui.enable = true;
    dap-virtual-text.enable = true;
    # dap = {
    #   enable = true;
    #   extensions = {
    #   };
    # };

    # Editor Tools
    overseer.enable = true;
    refactoring.enable = true;

    # Languages (LSP)
    lsp = {
      enable = true;
      servers = {
        angularls.enable = true;
        oxfmt.enable = true;
        oxlint.enable = true;
        astro.enable = true;
        cssls.enable = true;
        dartls.enable = true;
        docker_compose_language_service.enable = true;
        dockerls.enable = true;
        gopls.enable = true;
        html.enable = true;
        # intelephense.enable = true;
        # phpactor.enable = true;
        phpantom_lsp.enable = true;
        jdtls.enable = true;
        jsonls.enable = true;
        kotlin_language_server.enable = true;
        marksman.enable = true;
        nixd.enable = true;
        omnisharp.enable = true;
        prismals.enable = true;
        pyright.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        sqls.enable = true;
        svelte.enable = true;
        tailwindcss.enable = true;
        taplo.enable = true;

        # Bleeding edge TS setup
        ts_ls.enable = false; # Disable old Node.js server
        tsgo.enable = true; # Enable new Go server
        yamlls.enable = true;
      };
    };

    # Formatting
    conform-nvim.settings = {
      formatters_by_ft = {
        javascript = [ "oxfmt" ];
        typescript = [ "oxfmt" ];
        javascriptreact = [ "oxfmt" ];
        typescriptreact = [ "oxfmt" ];

        go = [
          "goimports"
          "gofmt"
        ];
        rust = [ "rustfmt" ];
        python = [
          "ruff_format"
          "ruff_fix"
        ];
        json = [ "prettier" ];
        nix = [ "nixfmt" ];
      };
      formatters.oxfmt = {
        command = "oxfmt";
      };
    };

    # Linting
    lint = {
      enable = true;
      lintersByFt = {
        javascript = [ "oxlint" ];
        typescript = [ "oxlint" ];
        javascriptreact = [ "oxlint" ];
        typescriptreact = [ "oxlint" ];

        python = [ "ruff" ];
        go = [ "golangci_lint" ];
      };
    };

    # Utils
    # gitui.enable = true;
    octo.enable = true;
    project-nvim.enable = true;
    # rest-nvim.enable = true;
    persistence.enable = true;
    # plenary.enable = true;

    # Which-key with LazyVim groups
    which-key = {
      enable = true;
      settings = {
        spec = [
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>c";
            group = "code";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>d";
            group = "debug";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>f";
            group = "file/find";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>g";
            group = "git";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>gh";
            group = "hunks";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>q";
            group = "quit/session";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>s";
            group = "search";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>u";
            group = "ui";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>x";
            group = "diagnostics/quickfix";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>b";
            group = "buffer";
          }
          {
            mode = [
              "n"
              "x"
            ];
            key = "<leader>w";
            group = "windows";
          }
        ];
      };
    };
  };

  programs.nixvim.plugins = {
    # Snippets (Required for blink.cmp)
    friendly-snippets.enable = true;

    # DAP Language Adapters
    dap.enable = true; # nvim-dap
    dap-go.enable = true; # nvim-dap-go
    dap-python.enable = true; # nvim-dap-python

    # Java Support
    jdtls.enable = true; # nvim-jdtls

    # Rust Support
    # disabled as: `plugins.lsp.servers.rust_analyzer.enable = true;` is already set above
    # rustaceanvim.enable = true; # rustaceanvim (replaces rust-tools)
    crates.enable = true; # crates.nvim

    sidekick.enable = true; # sidekick.nvim
    # Markdown Support
    render-markdown.enable = true; # render-markdown.nvim
    markdown-preview.enable = true; # markdown-preview.nvim

    # REST Client (Replaces rest-nvim with kulala)
    kulala.enable = true; # kulala.nvim

    # Database Tools
    vim-dadbod.enable = true; # vim-dadbod
    vim-dadbod-ui.enable = true; # vim-dadbod-ui
    vim-dadbod-completion.enable = true; # vim-dadbod-completion

    # Python Virtual Environments
    venv-selector.enable = true; # venv-selector.nvim

    # JSON Schema Support
    schemastore.enable = true; # SchemaStore.nvim

    # Treesitter Context Comments
    ts-context-commentstring.enable = true;
    neotest = {
      enable = true; # nvim-ts-context-commentstring
      # Neotest Adapters (Test runners for your stack)
      adapters = {
        bash.enable = true;
        golang.enable = true;
        python.enable = true;
        dotnet.enable = true;
        dart.enable = true;
        phpunit.enable = true;
        pest.enable = true;
        jest.enable = true;
      };
    };
  };
}
