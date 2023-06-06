local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd.packadd("packer.nvim")
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- theme
  use("cocopon/iceberg.vim")

  -- file
  use({ "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" } })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  })
  use("lambdalisue/fern.vim")
  use("lambdalisue/fern-git-status.vim")
  use("lambdalisue/fern-renderer-devicons.vim")
  use("lambdalisue/fern-renderer-nerdfont.vim")
  use("ryanoasis/vim-devicons")
  use("lambdalisue/nerdfont.vim")

  -- lsp
  use("neovim/nvim-lspconfig")
  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local nvim_lsp = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup_handlers({ 
        function(server_name)
          local opts = {}
          opts.on_attach = function(_, bufnr)
            local bufopts = { silent = true, buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set("n", "gn", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "gf", vim.lsp.buf.format, bufopts)
          end
          nvim_lsp[server_name].setup(opts)
        end
      })
    end
  })

  -- terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  })

  -- other
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
