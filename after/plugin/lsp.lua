local lsp = require('lsp-zero')

lsp.preset({
  float_border = 'rounded',
  call_servers = 'local',
  configure_diagnostics = false,
  setup_servers_on_start = true,
  set_lsp_keymaps = {
    preserve_mappings = false,
    omit = {},
  },
  manage_nvim_cmp = {
    set_sources = 'recommended',
    set_basic_mappings = true,
    set_extra_mappings = false,
    use_luasnip = true,
    set_format = true,
    documentation_window = true,
  },
})

lsp.ensure_installed({
  'eslint'
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = false,
        update_in_insert = false,
   }
)

lsp.setup()
