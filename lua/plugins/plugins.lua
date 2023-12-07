return {
  {
    "ThePrimeagen/harpoon",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Optional: Set up custom configurations or keybindings for Harpoon
      vim.api.nvim_set_keymap(
        "n",
        "<leader>hm",
        "<cmd>lua require('harpoon.mark').add_file()<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>ht",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        { noremap = true, silent = true }
      )
      -- Add more keybindings as needed
    end,
  },
}
