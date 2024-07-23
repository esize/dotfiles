return {
  -- autopairing of (){}[] etc
  {
    "windwp/nvim-autopairs",
    lazy = true,
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = {"InsertEnter", "CmdlineEnter" },
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          local ls = require("luasnip")
          ls.config.set_config(opts)
          require "configs.luasnip"
          ls.filetype_extend("javascript", { "jsdoc" })

          vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true})

          vim.keymap.set({"i", "s"}, "<C-s>;", function() ls.jump(1) end, {silent = true})
          vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true})

          vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end, {silent = true})
          -- vscode format
          require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
          require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

          -- snipmate format
          require("luasnip.loaders.from_snipmate").load()
          require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

          -- lua format
          require("luasnip.loaders.from_lua").load()
          require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

          vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
              if
                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                and not require("luasnip").session.jump_active
              then
                require("luasnip").unlink_current()
              end
            end,
          })
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
          "David-Kunz/cmp-npm",
          ft = "json",
          config = function()
            require('cmp-npm').setup({
              sources = {
                { name = "npm", keyword_length = 4 },
              },
            })
          end
        },
      },
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({

        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'treesitter' },
          { name = 'luasnip' },
          { name = 'path' },
        }, {
            {name = 'buffer'},
          }),
      })

      vim.diagnostic.config({
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",},})
    end
  }
}
