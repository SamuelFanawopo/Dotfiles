local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- General Keymaps
keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", opts) -- Reload config

-- Buffer Navigation
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Window Management
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- Resize Window
keymap.set("n", "<C-w><left>", "<C-w><", opts)
keymap.set("n", "<C-w><right>", "<C-w>>", opts)
keymap.set("n", "<C-w><up>", "<C-w>+", opts)
keymap.set("n", "<C-w><down>", "<C-w>-", opts)

-- Quick Save
keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Toggle Terminal
keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", opts)

-- Telescope Keybindings
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap.set("n", "sf", "<cmd>Telescope file_browser<CR>", opts)

-- Harpoon Keybindings
keymap.set("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap.set("n", "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
-- Harpoon Navigation Keybindings (1-7)
for i = 1, 7 do
  keymap.set("n", "<leader>h" .. i, "<cmd>lua require('harpoon.ui').nav_file(" .. i .. ")<cr>", opts)
end

-- Undotree Keybinding
keymap.set("n", "<Leader>utt", "<cmd>UndotreeToggle<CR>", opts)

-- Fugitive Keybindings
keymap.set("n", "<leader>gs", ":Gstatus<CR>", opts)
keymap.set("n", "<leader>gc", ":Git commit<CR>", opts)

-- Increment/Decrement
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', opts)

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist Navigation
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New Tab
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "<tab>", ":tabnext<CR>", opts)
keymap.set("n", "<s-tab>", ":tabprev<CR>", opts)
