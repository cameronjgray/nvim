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


vim.opt.cursorline = true

colorscheme = "moonfly"

vim.cmd('let g:netrw_banner=0')

vim.cmd('colorscheme ' .. colorscheme)

vim.cmd('command VS colorscheme vscode')
vim.cmd('command NVS colorscheme ' .. colorscheme)

vim.cmd('command CWT !yarn workspace backend db:dev')
vim.cmd('command CWD !yarn workspace backend db:test')


vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
