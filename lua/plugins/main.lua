return {
  -- Import LazyVim and its default plugins
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },

  -- Git Integration: vim-fugitive
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "Gstatus", "Gblame" },
    keys = {
      { "n", "<Leader>gs", ":Gstatus<CR>", desc = "Git Status" },
      { "n", "<Leader>gc", ":Git commit<CR>", desc = "Git Commit" },
      -- Add more keybindings as desired
    },
    config = function()
      -- Optional: Add any plugin-specific configurations here
    end,
    lazy = true, -- Load on demand
  },

  -- File Navigation: Harpoon
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup({
        -- Harpoon-specific configurations
      })
    end,
    keys = {
      { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with Harpoon" },
      { "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Harpoon menu" },
      -- Add keybindings for navigating to harpoon marks
      { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to Harpoon mark 1" },
      { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to Harpoon mark 2" },
      { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to Harpoon mark 3" },
      { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Go to Harpoon mark 4" },
      -- Continue up to 7 if needed
    },
    lazy = true, -- Load when keybindings are used
  },

  -- Fuzzy Finding: Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        ";f",
        function()
          require("telescope.builtin").find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Find Files",
      },
      {
        ";r",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "\\\\",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "List Buffers",
      },
      {
        ";t",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Help Tags",
      },
      {
        "sf",
        function()
          require("telescope").extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = require("lazy.core.config").options.root,
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser",
      },
      -- Add more keybindings as needed
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      telescope.setup({
        defaults = {
          wrap_results = true,
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
          mappings = {
            n = {},
          },
        },
        pickers = {
          diagnostics = {
            theme = "ivy",
            initial_mode = "normal",
            layout_config = {
              preview_cutoff = 9999,
            },
          },
        },
        extensions = {
          file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
              n = {
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["/"] = function()
                  vim.cmd("startinsert")
                end,
                ["<C-u>"] = function(prompt_bufnr)
                  for _ = 1, 10 do
                    actions.move_selection_previous(prompt_bufnr)
                  end
                end,
                ["<C-d>"] = function(prompt_bufnr)
                  for _ = 1, 10 do
                    actions.move_selection_next(prompt_bufnr)
                  end
                end,
                ["<PageUp>"] = actions.preview_scrolling_up,
                ["<PageDown>"] = actions.preview_scrolling_down,
              },
            },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
    end,
    lazy = true, -- Load when keybindings are used
  },

  -- Undo History Visualization: Undotree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
      -- Add more plugin-specific configurations here if needed
    end,
    lazy = true, -- Load on demand
  },

  -- Status Line: lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "tokyonight",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
    lazy = true,
  },

  -- Syntax Highlighting: nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "typescript",
        "tsx",
        "vim",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    event = "BufRead",
    lazy = true,
  },

  -- Autocompletion: nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-emoji",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "emoji" },
        }),
      })
    end,
    lazy = true,
  },

  -- LSP Configuration: nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "golangci_lint_ls",
          "dockerls",
          "lua_ls",
          "eslint",
          "tailwindcss",
          "yamlls",
          "bashls",
          "taplo",
          "gopls",
          "jsonls",
          "cssmodules_ls",
          "pyright",
          "jdtls",
          "cssls",
          "ts_ls",
          "graphql",
        },
      })

      local lspconfig = require("lspconfig")
      local servers = {
        "html",
        "golangci_lint_ls",
        "dockerls",
        "lua_ls",
        "eslint",
        "tailwindcss",
        "yamlls",
        "bashls",
        "taplo",
        "gopls",
        "jsonls",
        "cssmodules_ls",
        "pyright",
        "jdtls",
        "cssls",
        "ts_ls",
        "graphql",
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
    lazy = true,
  },

  -- Color Scheme: tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
    lazy = false, -- Load immediately
  },

  -- Toggle Terminal: ToggleTerm.nvim
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<leader>t]],
        direction = "float",
        shade_terminals = true,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })
    end,
    lazy = true,
  },

  -- GitHub Copilot Integration
  {
    "github/copilot.vim",
    cmd = "Copilot",
    keys = {
      { "<leader>cp", "<cmd>lua ToggleCopilot()<CR>", desc = "Toggle Copilot" },
    },
    config = function()
      vim.g.copilot_no_tab_map = true -- Disable default <Tab> mapping
      -- Any other Copilot configurations
    end,
    lazy = true,
  },

  -- File Explorer: nvim-tree (if you still prefer it)
  -- If you don't want nvim-tree, you can skip this
  -- {
  --   "kyazdani42/nvim-tree.lua",
  --   dependencies = { "kyazdani42/nvim-web-devicons" },
  --   keys = {
  --     { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
  --   },
  --   config = function()
  --     require("nvim-tree").setup({
  --       -- nvim-tree configurations
  --       disable_netrw = true,
  --       hijack_netrw = true,
  --       view = {
  --         width = 30,
  --         side = "left",
  --       },
  --     })
  --   end,
  --   lazy = true,
  -- },
}
