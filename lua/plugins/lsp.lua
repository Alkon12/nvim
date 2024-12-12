return {
  -- LSP Config + Mason
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/typescript.nvim",
      "aca/emmet-ls",
    },
    opts = {
      servers = {
        pyright = {},
        tsserver = {},

        intelephense = {
          settings = {
            intelephense = {
              files = { maxSize = 5000000 },
              associations = { "*.twig" },
            },
          },
        },

        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        html = function(_, opts)
          local lspconfig = require("lspconfig")
          lspconfig.emmet_ls.setup({
            filetypes = {
              "html",
              "css",
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "php",
              "blade",
              "xml",
              "jsx",
              "tsx",
            },
            init_options = {
              html = { options = { ["bem.enabled"] = true } },
            },
          })
          return false
        end,
      },
    },
  },

  -- Autocompletado
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      opts.snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(), -- Abrir menú de autocompletado
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }) -- Confirmar y expandir snippet
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- Navegar al siguiente elemento en el menú
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump() -- Expandir o saltar dentro del snippet
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- Navegar al elemento anterior en el menú
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1) -- Saltar hacia atrás en el snippet
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      opts.sources = {
        { name = "nvim_lsp" }, -- Fuente de LSP
        { name = "luasnip" }, -- Priorizar snippets
        { name = "buffer" }, -- Sugerencias del buffer actual
        { name = "path" }, -- Sugerencias de rutas de archivos
        { name = "emoji" }, -- Emojis
      }
      return opts
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function()
      -- Cargar snippets de friendly-snippets para múltiples lenguajes
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Asociar tipos de archivo adicionales con snippets HTML
      local filetypes = require("luasnip").filetype_extend
      filetypes("javascript", { "html" })
      filetypes("javascriptreact", { "html" })
      filetypes("typescript", { "html" })
      filetypes("typescriptreact", { "html" })
      filetypes("php", { "html" })
      filetypes("twig", { "html" })
    end,
  },

  -- Complementos de snippets predefinidos
  { "rafamadriz/friendly-snippets" },
}
