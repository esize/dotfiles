local M = {}

function M.create_file()
  local api = require("nvim-tree.api")
  local Event = api.events.Event
  api.tree.open({ current_window = true })

  local runOnce = false

  api.events.subscribe(Event.TreeRendered, function(data)
    if not runOnce then
      runOnce = true
      local winnr = data.winnr
      local all_wins = vim.api.nvim_list_wins()
      for _, value in pairs(all_wins) do
        if value ~= winnr then
          vim.api.nvim_win_close(value, false)
        end
      end
      api.fs.create()
    end
  end)
end

function M.full_screen_files()
  local api = require("nvim-tree.api")
  local Event = api.events.Event
  api.tree.open({ current_window = true })

  local runOnce = false

  api.events.subscribe(Event.TreeRendered, function(data)
    if not runOnce then
      runOnce = true
      local winnr = data.winnr
      local all_wins = vim.api.nvim_list_wins()
      for _, value in pairs(all_wins) do
        if value ~= winnr then
          vim.api.nvim_win_close(value, false)
        end
      end
      api.tree.expand_all()
    end
  end)
end

return M
