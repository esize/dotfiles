return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("catppuccin").setup({
        compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        flavour = "macchiato",
        transparent_background = true,
      })
      -- load the colorscheme here
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
