vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.mouse = ""

vim.opt.splitright = true

vim.cmd([[
    function! ReDir(args)
        execute "vnew | 0read ! " . a:args
    endfunction

    command! -nargs=* ReDir call ReDir(<q-args>)
]])

vim.cmd('colorscheme rose-pine')
