-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

--[[ vim.keymap.set("n", "<leader>t", function()
  vim.cmd("cd %:p:h")
  vim.cmd("terminal")
end, { noremap = true, desc = "Open terminal in current file directory" })
]]

local copilot_enabled = true

function ToggleCopilot()
  copilot_enabled = not copilot_enabled
  if copilot_enabled then
    vim.cmd([[Copilot enable]])
  else
    vim.cmd([[Copilot disable]])
  end
end

vim.api.nvim_set_keymap("n", "<leader>cp", "<cmd>lua ToggleCopilot()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>t", function()
  if terminal_buffer ~= nil and vim.fn.bufexists(terminal_buffer) == 1 then
    if vim.fn.bufwinnr(terminal_buffer) ~= -1 then
      vim.cmd("hide")
    else
      vim.cmd("botright sbuffer " .. terminal_buffer)
    end
  else
    vim.cmd("cd %:p:h") -- Change directory to the current file's directory
    vim.cmd("botright split | terminal")
    terminal_buffer = vim.fn.bufnr("%")
  end
end, { noremap = true, desc = "Toggle terminal in a split in the current file directory" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
