return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    -- telescope config
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Add buffer to harpoon" })
    vim.keymap.set("n", "<C-e>", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<C-j>", function()
      harpoon:list():select(1)
    end, { desc = "Select harpoon buffer 1" })
    vim.keymap.set("n", "<C-k>", function()
      harpoon:list():select(2)
    end, { desc = "Select harpoon buffer 2" })
    vim.keymap.set("n", "<C-l>", function()
      harpoon:list():select(3)
    end, { desc = "Select harpoon buffer 3" })
    vim.keymap.set("n", "<C-;>", function()
      harpoon:list():select(4)
    end, { desc = "Select harpoon buffer 4" })

    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Select previous buffer in harpoon list" })
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Select next buffer in harpoon list" })
  end,
}
