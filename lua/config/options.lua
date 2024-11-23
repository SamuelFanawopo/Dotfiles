local options = {
  -- General Settings
  number = true, -- Show line numbers
  relativenumber = true, -- Show relative line numbers
  tabstop = 2, -- Number of spaces that a <Tab> in the file counts for
  shiftwidth = 2, -- Number of spaces to use for each step of (auto)indent
  expandtab = true, -- Use spaces instead of tabs
  smartindent = true, -- Enable smart indentation
  wrap = false, -- Disable line wrapping
  cursorline = true, -- Highlight the current line
  clipboard = "unnamedplus", -- Use system clipboard
  mouse = "a", -- Enable mouse support
  ignorecase = true, -- Ignore case in search patterns
  smartcase = true, -- Override ignorecase if search pattern contains uppercase letters
  hidden = true, -- Allow buffer switching without saving
  splitbelow = true, -- New horizontal splits go below
  splitright = true, -- New vertical splits go to the right
  termguicolors = true, -- Enable 24-bit RGB colors
  scrolloff = 8, -- Number of screen lines to keep above and below the cursor
  sidescrolloff = 8, -- Number of screen columns to keep to the left and right of the cursor
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Leader key
vim.g.mapleader = " "

-- Additional Options
vim.o.updatetime = 300
vim.o.timeoutlen = 500
