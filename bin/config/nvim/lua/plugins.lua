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
  use("cocopon/iceberg.vim")
  use({ "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" } })
  use({
    "ojroques/nvim-hardline",
    config = function()
      require("hardline").setup({})
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  })
  use("lambdalisue/fern.vim")
  use("neovim/nvim-lspconfig")
  use({
    "williamboman/mason.nvim",
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local opt = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }
      require("mason-lspconfig").setup_handlers({
        function(server)
          require("lspconfig")[server].setup(opt)
        end,
      })
    end,
  })
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        experimental = {
          ghost_text = true,
        },
      })
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" },
        }, {
          { name = "buffer" },
        }),
      })
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  })
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/vim-vsnip")
  use("lambdalisue/fern-git-status.vim")
  use("lambdalisue/fern-renderer-devicons.vim")
  use("lambdalisue/fern-renderer-nerdfont.vim")
  use("ryanoasis/vim-devicons")
  use("lambdalisue/nerdfont.vim")
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    after = {
      "mason"
    },
    config = function()
      require("custom.plugins.null-ls")
    end
  })
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
