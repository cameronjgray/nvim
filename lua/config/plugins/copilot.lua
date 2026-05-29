return {
  {
    'github/copilot.vim',
    cmd = 'Copilot',
    keys = {
      { '<C-[>', '<Plug>(copilot-dismiss)', mode = 'i' },
      { '<C-C>', '<Plug>(copilot-dismiss)<ESC>', mode = 'i' },
    },
    init = function()
      vim.g.copilot_enabled = 0
    end,
  }
}
