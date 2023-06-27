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
  use({
    "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        files = {
          actions = {
            ["default"] = require("fzf-lua.actions").file_edit,
          },
        },
        grep = {
          actions = {
            ["default"] = require("fzf-lua.actions").file_edit,
          },
        },
        git = {
          status = {
            actions = {
              ["default"] = require("fzf-lua.actions").file_edit,
            },
          },
        },
      })
    end,
  })
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

  -- comp
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")

  -- lsp
  use("neovim/nvim-lspconfig")
  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local nvim_lsp = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp = require("cmp")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {},
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" },
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

      mason_lspconfig.setup_handlers({
        function(server_name)
          local opts = {
            capabilities = capabilities,
          }
          opts.on_attach = function(_, bufnr)
            local bufopts = { silent = true, buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set("n", "gn", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "ge", vim.diagnostic.open_float, bufopts)
            vim.keymap.set("n", "gf", vim.lsp.buf.format, bufopts)
            vim.keymap.set("n", "<Leader>gN", vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set("n", "<Leader>gn", vim.diagnostic.goto_next, bufopts)
          end
          nvim_lsp[server_name].setup(opts)
        end,
      })
    end,
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.beautysh,
        },
      })
    end,
  })
  use({
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        automatic_setup = true,
      })
    end,
  })

  -- terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })

  -- tab
  use({
    "akinsho/bufferline.nvim",
    tag = "*",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
        },
      })
    end,
  })

  -- other
  use({
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end,
  })
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })
  use({
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        groups = { -- table: default groups
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLineNr",
          "EndOfBuffer",
        },
        extra_groups = {},
        exclude_groups = {},
      })
    end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
