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

function Example()
  print()
  local opts = {
    "option",
  }
  local cb = function(_, selection)
    print("it works" .. selection)
  end
  ShowMenu(opts, cb, "Title", 60, 1)
end

function DisplayCurrentFile()
  print()
  local opts = {
    vim.api.nvim_buf_get_name(0),
  }
  local cb = function(_, selection)
  end
  ShowSingleItem(opts, cb, "CurrentFile")
end

