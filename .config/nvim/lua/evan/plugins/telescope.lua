local builtin = require("telescope.builtin")
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    {"nvim-tree/nvim-web-devicons"},
  },
  keys = {
    {"<leader>pf", builtin.find_files, desc = "Find files in project dir"},
    {"<leader>ps", builtin.live_grep, desc = "Find str in project dir"},
    {"<leader>pt", "<cmd>TodoTelescope<cr>", desc = "Search project TODOs" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = {"smart"},
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      }
    })
    telescope.load_extension("fzf")
  end,
}
