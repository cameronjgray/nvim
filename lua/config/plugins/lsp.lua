return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim'
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- h lspconfig-all
      vim.lsp.config('luals', {
        cmd = {'lua-language-server'},
        filetypes = {'lua'},
        root_markers = {'.luarc.json', '.luarc.jsonc'},
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })

      vim.cmd[[set completeopt+=menuone,noselect,popup]]
      vim.lsp.config('ts_ls', {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
      })

      local base_on_attach = vim.lsp.config.eslint.on_attach
      vim.lsp.config("eslint", {
        on_attach = function(client, bufnr)
          if not base_on_attach then return end

          base_on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "LspEslintFixAll",
          })
        end,
      })
      vim.lsp.enable({'luals','ts_ls', 'cssls', 'bashls', 'eslint', 'prettier'})
    end
  },
}
