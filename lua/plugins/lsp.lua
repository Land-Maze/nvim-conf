return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          expend = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert(require("plugins.config.lsp").cmp.get_mappings(cmp)),
        sources = cmp.config.sources(require("plugins.config.lsp").cmp.get_cmp_sources(cmp)),
      })

    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim"
    },
    config = function ()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_not_installed = "✗",
            package_pending = "…",
          }
        }
      })

      mason_lspconfig.setup({
        ensure_installed = require("plugins.config.lsp").mason.get_language_servers(),
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true }
    },
    config = function ()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      
      local on_attach = require("plugins.config.lsp").lspconfig.get_on_attach_set_mappings()
      local capabilities = cmp_nvim_lsp.default_capabilities()

      for type, icon in pairs(require("plugins.config.lsp").lspconfig.get_signs()) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      require("plugins.config.lsp").lspconfig.setup_lsp_servers(on_attach, capabilities)
    end,
  }
}
