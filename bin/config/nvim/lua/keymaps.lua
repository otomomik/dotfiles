-- Global
vim.g.mapleader = ","
-- Fern
vim.keymap.set("n", "<Leader>n", "<cmd>Fern . -drawer<CR>")

-- Fzf
vim.keymap.set("n", "ff", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "fw", "<cmd>FzfLua grep<CR>")
vim.keymap.set("n", "fs", "<cmd>FzfLua git_status<CR>")

-- Terminal
vim.keymap.set("n", "tf", "<cmd>ToggleTerm direction=float<CR>")

-- Window Move
vim.keymap.set("n", "<Leader>h", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<Leader>j", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<Leader>k", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<Leader>l", "<cmd>wincmd l<CR>")
