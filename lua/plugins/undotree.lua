-- lua/plugins/undotree.lua

return {
  -- Add the Undo Tree plugin
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "n", "<Leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undo Tree" } },
    config = function()
      vim.g.undotree_WindowLayout = 2 -- Example configuration, set as per your preference
      vim.g.undotree_SetFocusWhenToggle = 1 -- Focus on undotree when opened
      -- Add more plugin-specific configurations here if needed
    end,
  },
}
