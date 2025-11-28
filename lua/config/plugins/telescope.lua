return
{
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require 'telescope'
    local builtin = require('telescope.builtin')
    telescope.setup{
      file_ignore_patterns = { "node_modules", "yarn.lock" },
      defaults = {
        file_ignore_patterns = {
          "node_modules"
        }
      }
    }

    vim.keymap.set('n', '<leader>nf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>nw', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
  end
}
