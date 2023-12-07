-- lua/plugins/fugitive.lua

return {
  -- Add vim-fugitive
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "Gstatus", "Gblame" },
    keys = {
      { "n", "<Leader>gs", ":Gstatus<CR>", desc = "Git Status" },
      { "n", "<Leader>gc", ":Git commit<CR>", desc = "Git Commit" },
      -- Add more keybindings for other Git operations as desired
    },
    setup = function()
      -- You can add any plugin-specific setup code here
    end,
    config = function()
      -- Add any plugin-specific configuration here
    end,
  },
}
