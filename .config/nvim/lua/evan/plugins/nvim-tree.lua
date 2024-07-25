local nvimTreeFocusOrToggle = function ()
	local nvimTree=require("nvim-tree.api")
	local currentBuf = vim.api.nvim_get_current_buf()
	local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
  local opts = {
    find_file = true,
    focus = true
  }
	if currentBufFt == "NvimTree" then
		nvimTree.tree.toggle(opts)
	else
		nvimTree.tree.focus(opts)
	end
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    {
      "<leader>ee",
      nvimTreeFocusOrToggle,
      desc = "Toggle or focus directory tree"
    },
    {
      "<leader>ef",
      function()
        local api = require("nvim-tree.api")
        api.tree.find_file({open = true, focus = true})
      end,
      desc = "Toggle or focus directory tree"
    },
    {
      "<leader>pv",
      Evan.full_screen_files,
      desc = "Show full screen file tree"
    },
  },
  init = function()
    -- Make :bd and :q behave as usual when tree is visible
    vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
      nested = false,
      callback = function(e)
        local tree = require('nvim-tree.api').tree

        -- Nothing to do if tree is not opened
        if not tree.is_visible() then
          return
        end

        -- How many focusable windows do we have? (excluding e.g. incline status window)
        local winCount = 0
        for _,winId in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_config(winId).focusable then
            winCount = winCount + 1
          end
        end

        -- We want to quit and only one window besides tree is left
        if e.event == 'QuitPre' and winCount == 2 then
          vim.api.nvim_cmd({cmd = 'qall'}, {})
        end

        -- :bd was probably issued an only tree window is left
        -- Behave as if tree was closed (see `:h :bd`)
        if e.event == 'BufEnter' and winCount == 1 then
          -- Required to avoid "Vim:E444: Cannot close last window"
          vim.defer_fn(function()
            -- close nvim-tree: will go to the last buffer used before closing
            tree.toggle({find_file = true, focus = true})
            -- re-open nivm-tree
            tree.toggle({find_file = true, focus = false})
          end, 10)
        end
      end
    })

    -- vim.api.nvim_create_autocmd("QuitPre", {
    --   callback = function()
    --     local tree_wins = {}
    --     local floating_wins = {}
    --     local wins = vim.api.nvim_list_wins()
    --     for _, w in ipairs(wins) do
    --       local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
    --       if bufname:match("NvimTree_") ~= nil then
    --         table.insert(tree_wins, w)
    --       end
    --       if vim.api.nvim_win_get_config(w).relative ~= '' then
    --         table.insert(floating_wins, w)
    --       end
    --     end
    --     if 1 == #wins - #floating_wins - #tree_wins then
    --       -- Should quit, so we close all invalid windows.
    --       for _, w in ipairs(tree_wins) do
    --         vim.api.nvim_win_close(w, true)
    --       end
    --     end
    --   end
    -- })
  end,
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      on_attach = function(bufnr)
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        local ok, api = pcall(require, "nvim-tree.api")
        assert(ok, "api module is not found")
        vim.keymap.set("n", "<CR>", api.node.open.tab_drop, opts("Tab drop"))



        local mappings = {
          -- BEGIN_DEFAULT_ON_ATTACH
          ["<C-]>"] = { api.tree.change_root_to_node, "CD" },
          ["<C-e>"] = { api.node.open.replace_tree_buffer, "Open: In Place" },
          ["<C-k>"] = { api.node.show_info_popup, "Info" },
          ["<C-r>"] = { api.fs.rename_sub, "Rename: Omit Filename" },
          ["<C-t>"] = { api.node.open.tab, "Open: New Tab" },
          ["<C-v>"] = { api.node.open.vertical, "Open: Vertical Split" },
          ["<C-x>"] = { api.node.open.horizontal, "Open: Horizontal Split" },
          ["<BS>"] = { api.node.navigate.parent_close, "Close Directory" },
          ["<CR>"] = { api.node.open.edit, "Open" },
          ["<Tab>"] = { api.node.open.preview, "Open Preview" },
          [">"] = { api.node.navigate.sibling.next, "Next Sibling" },
          ["<"] = { api.node.navigate.sibling.prev, "Previous Sibling" },
          ["."] = { api.node.run.cmd, "Run Command" },
          ["-"] = { api.tree.change_root_to_parent, "Up" },
          ["a"] = { api.fs.create, "Create" },
          ["bmv"] = { api.marks.bulk.move, "Move Bookmarked" },
          ["B"] = { api.tree.toggle_no_buffer_filter, "Toggle No Buffer" },
          ["c"] = { api.fs.copy.node, "Copy" },
          ["C"] = { api.tree.toggle_git_clean_filter, "Toggle Git Clean" },
          ["[c"] = { api.node.navigate.git.prev, "Prev Git" },
          ["]c"] = { api.node.navigate.git.next, "Next Git" },
          ["d"] = { api.fs.remove, "Delete" },
          ["D"] = { api.fs.trash, "Trash" },
          ["E"] = { api.tree.expand_all, "Expand All" },
          ["e"] = { api.fs.rename_basename, "Rename: Basename" },
          ["]e"] = { api.node.navigate.diagnostics.next, "Next Diagnostic" },
          ["[e"] = { api.node.navigate.diagnostics.prev, "Prev Diagnostic" },
          ["F"] = { api.live_filter.clear, "Clean Filter" },
          ["f"] = { api.live_filter.start, "Filter" },
          ["g?"] = { api.tree.toggle_help, "Help" },
          ["gy"] = { api.fs.copy.absolute_path, "Copy Absolute Path" },
          ["H"] = { api.tree.toggle_hidden_filter, "Toggle Dotfiles" },
          ["I"] = { api.tree.toggle_gitignore_filter, "Toggle Git Ignore" },
          ["J"] = { api.node.navigate.sibling.last, "Last Sibling" },
          ["K"] = { api.node.navigate.sibling.first, "First Sibling" },
          ["m"] = { api.marks.toggle, "Toggle Bookmark" },
          ["o"] = { api.node.open.edit, "Open" },
          ["O"] = { api.node.open.no_window_picker, "Open: No Window Picker" },
          ["p"] = { api.fs.paste, "Paste" },
          ["P"] = { api.node.navigate.parent, "Parent Directory" },
          ["q"] = { api.tree.close, "Close" },
          ["r"] = { api.fs.rename, "Rename" },
          ["R"] = { api.tree.reload, "Refresh" },
          ["s"] = { api.node.run.system, "Run System" },
          ["S"] = { api.tree.search_node, "Search" },
          ["U"] = { api.tree.toggle_custom_filter, "Toggle Hidden" },
          ["W"] = { api.tree.collapse_all, "Collapse" },
          ["x"] = { api.fs.cut, "Cut" },
          ["y"] = { api.fs.copy.filename, "Copy Name" },
          ["Y"] = { api.fs.copy.relative_path, "Copy Relative Path" },
          ["<2-LeftMouse>"] = { api.node.open.edit, "Open" },
          ["<2-RightMouse>"] = { api.tree.change_root_to_node, "CD" },
          -- END_DEFAULT_ON_ATTACH

          -- Mappings migrated from view.mappings.list
          ["l"] = { api.node.open.edit, "Open" },
          ["<CR>"] = { api.node.open.edit, "Open" },
          ["o"] = { api.node.open.edit, "Open" },
          ["h"] = { api.node.navigate.parent_close, "Close Directory" },
          ["v"] = { api.node.open.vertical, "Open: Vertical Split" },
          ["C"] = { api.tree.change_root_to_node, "CD" },
        }

        for keys, mapping in pairs(mappings) do
          vim.keymap.set("n", keys, mapping[1], opts(mapping[2]))
        end
      end,
      view = {
        width = 30,
      },
      -- disable window_picker so that explorer works well with splits
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          }
        }
      },
      filters = {
        custom = {"node_modules", ".git"},
      },
    })


    local api = require "nvim-tree.api"
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)
    api.events.subscribe(api.events.Event.TreeOpen, function()
      local tree_winid = api.tree.winid()

      if tree_winid ~= nil then
        vim.api.nvim_set_option_value('statusline', ' ', {win = tree_winid})
      end
    end)

    --m.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {desc = "Show current file in file tree"})
--    m.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", {desc = "Refresh file tree"})
  end
}
