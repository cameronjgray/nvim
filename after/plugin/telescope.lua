require('telescope').setup{
    file_ignore_patterns = { "node_modules", "yarn.lock" },
    defaults = {
        file_ignore_patterns = {
            "node_modules"
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>nf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>nw', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
