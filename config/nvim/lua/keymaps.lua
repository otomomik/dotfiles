-- Global
vim.g.mapleader = ","

-- Buffer
vim.keymap.set("n", "<C-S-n>", "<Cmd>bprevious<CR>")
vim.keymap.set("n", "<C-n>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>BufferLinePick<CR>")
vim.keymap.set("n", "<C-q>", "<cmd>bd<CR>")

-- Fern
vim.keymap.set("n", "fo", "<cmd>Fern . -reveal=%<CR>")

-- Fzf
vim.keymap.set("n", "ff", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "fw", "<cmd>FzfLua live_grep<CR>")
vim.keymap.set("n", "fd", "<cmd>FzfLua diagnostics_document<CR>")
vim.keymap.set("n", "fs", "<cmd>FzfLua git_status<CR>")
vim.keymap.set("n", "fb", "<cmd>FzfLua buffers<CR>")

-- Memo
local fzfLua = require("fzf-lua")
vim.keymap.set("n", "mo", "<cmd>Fern ~/memo -reveal=%<CR>")
vim.keymap.set("n", "mf", "<cmd>lua require('fzf-lua').files({ cwd = \"~/memo\" })<CR>", { silent = true })
vim.keymap.set("n", "mg", "<cmd>lua require('fzf-lua').live_grep({ cwd = \"~/memo\" })<CR>", { silent = true })

-- Terminal
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})
function lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "tf", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("n", "tg", "<cmd>lua lazygit_toggle()<CR>", { noremap = true, silent = true })

-- Window Move
vim.keymap.set("n", "<Leader>h", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<Leader>j", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<Leader>k", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<Leader>l", "<cmd>wincmd l<CR>")

-- Hop
local hop = require("hop")

vim.keymap.set("n", "<Leader>/", hop.hint_patterns)

-- other
vim.keymap.set("v", "tj", "<cmd>:Translate ja<CR>")
vim.keymap.set("v", "te", "<cmd>:Translate en<CR>")
