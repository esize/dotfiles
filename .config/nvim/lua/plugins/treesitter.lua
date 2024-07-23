return  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return {
        ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc", "jsdoc" },

        highlight = {
          enable = true,
          use_languagetree = true,
        },

        indent = { enable = true },
      }
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
