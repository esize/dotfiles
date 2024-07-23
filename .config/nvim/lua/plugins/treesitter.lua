return {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    opts = {
      ensure_installed = {
        "javascript",
        "jsdoc",
        "typescript",
        "css",
        "gitignore",
        "http",
        "json",
        "scss",
        "sql",
        "vim",
        "vimdoc",
        "lua",
        "luadoc",
        "printf",
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },
}
