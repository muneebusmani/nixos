{ _, ... }: {
  programs.nixvim.extraConfigLua = ''
    require("easy-dotnet").setup()
    require("dotnet").setup()
    require("mcphub").setup()
    require("window-picker").setup()
    require("sidekick").setup()

    -- Snacks override for easy-dotnet
    local Snacks = require("snacks")
    if Snacks and Snacks.config and Snacks.config.picker then
      Snacks.config.picker.sources.explorer.actions.explorer_add_dotnet = function(picker)
        local dir = picker:dir()
        require("easy-dotnet").create_item(dir)
      end
    end

    -- NLua adapter for DAP
    local dap = require('dap')
    dap.adapters.nlua = function(callback, config)
      callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
    end
    dap.configurations.lua = {
      {
        type = 'nlua',
        request = 'attach',
        name = "Attach to running Neovim instance",
      }
    }

    -- Add tsgolint manually via Lua
    local lint = require('lint')
    lint.linters.tsgolint = {
      name = "tsgolint",
      cmd = "tsgolint",
      stdin = true,
      args = { "--format", "json" },
      parser = function(output, bufnr)
        if output == "" then return {} end
        local items = vim.json.decode(output)
        local diagnostics = {}
        if items and items.diagnostics then
          for _, diag in ipairs(items.diagnostics) do
            table.insert(diagnostics, {
              lnum = (diag.range and diag.range.start and diag.range.start.line or 1) - 1,
              col = (diag.range and diag.range.start and diag.range.start.character or 1) - 1,
              end_lnum = (diag.range and diag.range["end"] and diag.range["end"].line or 1) - 1,
              end_col = (diag.range and diag.range["end"] and diag.range["end"].character or 1) - 1,
              severity = vim.diagnostic.severity.WARN,
              message = diag.message,
              source = "tsgolint",
            })
          end
        end
        return diagnostics
      end,
    }
    lint.linters_by_ft.typescript = { "oxlint", "tsgolint" }
    lint.linters_by_ft.typescriptreact = { "oxlint", "tsgolint" }
  '';

}
