local is_light = os.getenv("NVIM_LIGHT") == "1"

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    not is_light and { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" } or nil,
    { 'nvim-telescope/telescope-smart-history.nvim',
      dependencies = { 'kkharji/sqlite.lua' },
    },
  },
  config = function()
    local telescope = require 'telescope'
    local builtin = require('telescope.builtin')
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local make_entry = require "telescope.make_entry"
    local conf = require "telescope.config".values

    local extensions = {}
    if not is_light then
      extensions.fzf = {}
    end

    telescope.setup{
      file_ignore_patterns = { "node_modules", "yarn.lock" },
      pickers = {
        find_files = {
          hidden = true
        },
      },
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git/",
        },
        history = {
          path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
          limit = 100,
        },
        mappings = {
          i = {
            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
            ["<C-n>"] = require("telescope.actions").cycle_history_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
          },
        },
      },
      extensions = extensions,
    }

    if not is_light then
      telescope.load_extension('fzf')
    end
    telescope.load_extension('smart_history')

    local function live_multigrep()
      local opts = {}
      opts.cwd = vim.uv.cwd()
      local finder = finders.new_async_job {
        command_generator = function(prompt)
          if not prompt or prompt == "" then
            return nil
          end
          local pieces = vim.split(prompt, "  ")
          local args = { "rg" }
          if pieces[1] then
            table.insert(args, "-e")
            table.insert(args, pieces[1])
          end
          if pieces[2] then
            table.insert(args, "-g")
            table.insert(args, pieces[2])
          end
          ---@diagnostic disable-next-line: deprecated
          return vim.tbl_flatten {
            args,
            { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
          }
        end,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
      }
      pickers.new(opts, {
        debounce = 100,
        prompt_title = "Multi Grep",
        finder = finder,
        previewer = conf.grep_previewer(opts),
        sorter = require("telescope.sorters").empty(),
      }):find()
    end

    vim.keymap.set('n', '<leader>nf', builtin.find_files)
    vim.keymap.set('n', '<leader>nh', builtin.help_tags)
    vim.keymap.set('n', '<leader>nv', function()
      builtin.find_files { cwd = vim.fn.stdpath("config") }
    end)
    vim.keymap.set("n", "<leader>nw", live_multigrep)
  end
}
