-- Global
vim.g.mapleader = ","

-- Tab
vim.keymap.set("n", "<C-j>", "<Cmd>bprevious<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>BufferLinePick<CR>")
vim.keymap.set("n", "q", "<cmd>bd<CR>")

-- Fern
vim.keymap.set("n", "ft", "<cmd>Fern . -drawer -toggle<CR>")

-- Fzf
vim.keymap.set("n", "ff", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "fw", "<cmd>FzfLua grep<CR>")
vim.keymap.set("n", "fs", "<cmd>FzfLua git_status<CR>")

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
