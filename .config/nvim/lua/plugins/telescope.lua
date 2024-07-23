return {
  "telescope.nvim",
  priority = 1000,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    {
      "<leader>pf",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          no_ignore = false,
          hidden = true,
        })
      end,
      desc = "Lists files in the current project, respecting .gitignore",
    },
    {
      "<leader>ps",
      function()
        local builtin = require("telescope.builtin")
        builtin.live_grep()
      end,
      desc = "Searches for a string in the current project, respecting .gitignore",
    },
    {
      "<leader>pe",
      function()
        local builtin = require("telescope.builtin")
        builtin.diagnostics()
      end,
      desc = "Lists diagnostics",
    },
    {
      "<leader>ff",
      function()
        local builtin = require("telescope.builtin")
        builtin.treesitter()
      end,
      desc = "Lists function names and variables from Treesitter",
    },
    {
      "<leader>pv",
      function()
        local telescope = require("telescope")

        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end

        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "insert",
          layout_config = { height = 40 },
        })
      end,
      desc = "Opens file browser at the location of the active file.",
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      wrap_results = true,
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        n = {},
      },
    })
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 9999,
        },
      },
    }
    opts.extensions = {
      file_browser = {
        theme = "dropdown",

        -- disable netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          -- custom insert mode mappings
          ["n"] = {
            -- custom normal mode mappings
            ["N"] = fb_actions.create, -- create new file
            ["h"] = fb_actions.goto_parent_dir, -- go up a directory
            ["<C-u>"] = function(prompt_bufnr) -- scroll up
              for _i = 1, 10 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-d>"] = function(prompt_bufnr) -- scroll down
              for _i = 1, 10 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
          },
        },
      },
    }
    telescope.setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
  end,
}
