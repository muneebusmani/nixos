{ _, ... }: {
  programs.nixvim.keymaps = [
    # Window navigation (LazyVim defaults)

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Go to left window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Go to lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Go to upper window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Go to right window";
    }

    # Buffer navigation
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next buffer";
    }

    # Yanking and deleting fixes
    {
      mode = "x";
      key = "p";
      action = "P";
      options = {
        desc = "Paste without overwriting clipboard";
      };
    }
    {
      mode = "x";
      key = "d";
      action = "\"_d";
      options = {
        desc = "Delete without copying to clipboard";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "dd";
      action = "\"_dd";
      options = {
        desc = "Delete line without copying to clipboard";
      };
    }

    # Custom deletes and copies
    {
      mode = "i";
      key = "<A-f>";
      action = "<C-c>\"_dd";
      options.desc = "Delete Current Line";
    }
    {
      mode = "n";
      key = "<A-f>";
      action = "\"_dd";
      options.desc = "Delete Current Line";
    }
    {
      mode = "v";
      key = "<A-f>";
      action = "\"_d";
      options.desc = "Delete selected lines";
    }
    {
      mode = [
        "n"
        "i"
      ];
      key = "<A-d>";
      action = "<cmd>t .<CR>";
      options.desc = "Copy Line Down";
    }
    {
      mode = "v";
      key = "<A-d>";
      action = ":t '><CR>";
      options.desc = "Copy selected lines down";
    }

    # Misc custom
    {
      mode = "n";
      key = "<leader>i";
      action = "gg=G";
      options.desc = "Indent Whole file";
    }
    {
      mode = "n";
      key = "<A-a>";
      action = "ggvG\"+y";
      options.desc = "Select All and copy";
    }
    {
      mode = "n";
      key = "<leader>h";
      action = "<cmd>nohlsearch<CR>";
      options.desc = "Clear search highlight";
    }
    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options.desc = "Join lines but keep cursor position";
    }
    {
      mode = "n";
      key = "<leader>fi";
      action = "gg=G<C-o>";
      options.desc = "Re-indent file and return";
    }

    # Quit bindings
    {
      mode = "n";
      key = "<leader>qp";
      action = "<cmd>q<cr>";
      options.desc = "Close current pane/window";
    }
    {
      mode = "n";
      key = "<leader>qW";
      action = "<cmd>wqa<CR>";
      options.desc = "Save and quit all";
    }
    {
      mode = "n";
      key = "<leader>qQ";
      action = "<cmd>qa!<CR>";
      options.desc = "Force quit all without saving";
    }

    # Path and plugin bindings
    {
      mode = "n";
      key = "<leader>yp";
      action.__raw = ''
        function()
          vim.fn.setreg("+", vim.fn.expand("%:."))
          print("Copied relative path: " .. vim.fn.expand("%:."))
        end
      '';
      options.desc = "Copy file relative path";
    }
    {
      mode = "n";
      key = "<leader>ll";
      action = "<cmd>Lazy<CR>";
      options.desc = "Open Lazy.nvim";
    }
    {
      mode = "n";
      key = "<leader>du";
      action = "<cmd>DotnetUI<cr>";
      options.desc = "open Dotnet UI";
    }

    # Octo PR bindings
    {
      mode = "n";
      key = "<leader>gpc";
      action = "<cmd>Octo pr create<cr>";
      options.desc = "Create Pull Request";
    }
    {
      mode = "n";
      key = "<leader>gpm";
      action = "<cmd>Octo pr merge<cr>";
      options.desc = "Merge Pull Request";
    }
    {
      mode = "n";
      key = "<leader>gpl";
      action = "<cmd>Octo pr list<cr>";
      options.desc = "List Pull Requests";
    }
    {
      mode = "n";
      key = "<leader>grb";
      action = "<cmd>Octo repo browser<cr>";
      options.desc = "Open repo in Browser";
    }
    {
      mode = "n";
      key = "<leader>gru";
      action = "<cmd>Octo repo url<cr>";
      options.desc = "Copy repo URL";
    }

    # Snacks Picker keymaps (LazyVim muscle memory)
    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>lua Snacks.picker.files()<cr>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>lua Snacks.picker.grep()<cr>";
      options.desc = "Grep";
    }
    {
      mode = "n";
      key = "<leader>:";
      action = "<cmd>lua Snacks.picker.command_history()<cr>";
      options.desc = "Command history";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>lua Snacks.picker.recent()<cr>";
      options.desc = "Recent files";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>lua Snacks.picker.buffers()<cr>";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>lua Snacks.picker.git_log()<cr>";
      options.desc = "Git commits";
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>lua Snacks.picker.git_status()<cr>";
      options.desc = "Git status";
    }

    # Snacks Explorer
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua Snacks.explorer()<cr>";
      options.desc = "File explorer";
    }
    # Kulala REST client
    {
      mode = "n";
      key = "<leader>Rr";
      action = "<cmd>lua require('kulala').run()<cr>";
      options.desc = "Run REST request";
    }
    {
      mode = "n";
      key = "<leader>Rc";
      action = "<cmd>lua require('kulala').copy()<cr>";
      options.desc = "Copy REST request";
    }
    {
      mode = "n";
      key = "<leader>Rs";
      action = "<cmd>lua require('kulala').scratchpad()<cr>";
      options.desc = "REST scratchpad";
    }

    # Markdown Preview
    {
      mode = "n";
      key = "<leader>cp";
      action = "<cmd>MarkdownPreviewToggle<cr>";
      options.desc = "Markdown preview";
    }

    # Database UI
    {
      mode = "n";
      key = "<leader>D";
      action = "<cmd>DBUIToggle<cr>";
      options.desc = "Toggle DBUI";
    }

    # Python Venv
    {
      mode = "n";
      key = "<leader>cv";
      action = "<cmd>VenvSelect<cr>";
      options.desc = "Select virtual env";
    }

    # Neogen Annotations
    {
      mode = "n";
      key = "<leader>cn";
      action = "<cmd>Neogen<cr>";
      options.desc = "Generate annotations";
    }

    # Grug Far (Search and Replace)
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>sr";
      action = "<cmd>GrugFar<cr>";
      options.desc = "Search and replace";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>terminal gitui<cr>";
      options.desc = "Open GitUI";
    }
  ];

}
