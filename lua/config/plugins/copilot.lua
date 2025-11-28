return {
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '<C-[>', '<Plug>(copilot-dismiss)');
      vim.keymap.set('i', '<C-C>',  '<Plug>(copilot-dismiss)<ESC>');

      -- default to disabled
      vim.g.copilot_enabled = 0
    end
  }
}

