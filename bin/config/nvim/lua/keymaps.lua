-- Global
vim.g.mapleader = ","
-- Fern
vim.keymap.set("n", "<Leader>n", "<cmd>Fern . -drawer<CR>")

-- Fzf
vim.keymap.set("n", "ff", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "fg", "<cmd>FzfLua grep<CR>")

-- Lsp
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")

-- Window Move
vim.keymap.set("n", "<Leader>h", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<Leader>j", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<Leader>k", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<Leader>l", "<cmd>wincmd l<CR>")
