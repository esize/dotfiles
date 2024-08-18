return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>c", group = "code" },
        { "<leader>e", group = "explorer", icon = { icon = " ", color = "blue" } },
        { "<leader>f", group = "format", icon = { icon = " ", color = "yellow" } },
        { "<leader>p", group = "project", icon = { icon = " ", color = "orange" } },
        { "<leader>s", group = "splits", icon = { icon = " ", color = "red" } },
        { "<leader>t", group = "tabs", icon = { icon = "󰓩 ", color = "green" } },
        { "<leader>x", group = "diagnostics", icon = { icon = "󱖫 ", color = "green" } },
      },
    },
  },
}
