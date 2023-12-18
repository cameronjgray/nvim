local popup = require('plenary.popup');
local Win_id

function ShowMenu(opts, cb, title, width, height)
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

  Win_id = popup.create(opts, {
        title = title,
        highlight = title .. "Window",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
        callback = cb,
  })
end

function ShowSingleItem(opts, cb, title)
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
  local width = string.len(opts[1])
  local height = 1

  Win_id = popup.create(opts, {
        title = title,
        highlight = title .. "Window",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
        callback = cb,
  })
end

function CloseMenu()
  vim.api.nvim_win_close(Win_id, true)
end

function DisplayCurrentFile()
  local opts = {
    vim.api.nvim_buf_get_name(0),
  }
  local cb = function(_, selection)
  end
  ShowSingleItem(opts, cb, "CurrentFile")
end

function DisplayBindings()
  local path  = ENV_PATH .. ".config/nvim/lua/cam/popups/bindings/menu"
  local cb = function(_, selection)
    if selection ~= 'EXIT' then
        selection = selection:gsub("%s+", "")
        selection = selection:gsub("-", "")
        local displayPath = ENV_PATH .. ".config/nvim/lua/cam/popups/bindings/" .. selection
        local displayTitle = selection:gsub("^%l", string.upper)
        local displayFunc = function(_, s) end
        DisplayFile(displayPath, displayTitle, displayFunc)
    else
    end
  end

  DisplayFile(path, "Bindings", cb)
end

function DisplayFile(path, name, cb)
  local file = io.open(path, "r")
  local opts = {}
  if file then
      for line in file:lines() do
          table.insert(opts, line)
      end
  end
  ShowMenu(opts, cb, name, 60, 20)
end
