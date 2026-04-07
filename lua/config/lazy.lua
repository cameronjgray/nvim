local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local is_light = os.getenv("NVIM_LIGHT") == "1"

require("lazy").setup({
  spec = is_light and {
    { import = "config.plugins.telescope" },
    { 'nvim-telescope/telescope-smart-history.nvim',
      dependencies = { 'kkharji/sqlite.lua' },
    },
    {
      'bluz71/vim-moonfly-colors',
      config = function()
        vim.cmd.colorscheme "moonfly"
      end
    },
    { 'tpope/vim-sleuth' },
  } or {
    { import = "config.plugins" },
  },
})
