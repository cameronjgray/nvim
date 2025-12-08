return {
  {
    'sbdchd/neoformat',
    config = function()
      -- Enable the option to require a Prettier config file
      -- If no prettier config file is found, the formatter will not be used
      vim.g.lazyvim_prettier_needs_config = false
      vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        pattern = { '*.ts', '*.tsx' },
        callback = function()
          vim.cmd("Neoformat")
        end
      })
    end
  }
}
