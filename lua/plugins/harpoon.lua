return {
  {
    "ThePrimeagen/harpoon",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Existing keybindings
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

      -- Keybindings for jumping to marked files 1 through 7
      for i = 1, 7 do
        vim.api.nvim_set_keymap(
          "n",
          "<leader>h" .. i,
          "<cmd>lua require('harpoon.ui').nav_file(" .. i .. ")<cr>",
          { noremap = true, silent = true }
        )
      end

      -- Add more keybindings as needed
    end,
  },
}
