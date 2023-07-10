local opts = { noremap = true, silent = true }

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

-- Lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)
vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)
vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)
vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts)
vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "ga", "<cmd>FzfLua lsp_code_actions<CR>", opts)
vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
vim.keymap.set("n", "<Leader>gN", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<Leader>gn", vim.diagnostic.goto_next, opts)

-- Memo
vim.keymap.set("n", "mo", "<cmd>Fern ~/memo -reveal=%<CR>")
vim.keymap.set("n", "mf", "<cmd>lua require('fzf-lua').files({ cwd = \"~/memo\" })<CR>", opts)
vim.keymap.set("n", "mg", "<cmd>lua require('fzf-lua').live_grep({ cwd = \"~/memo\" })<CR>", opts)

-- Terminal
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", opts)
  end,
})
function lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "tf", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("n", "tg", "<cmd>lua lazygit_toggle()<CR>", opts)

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
