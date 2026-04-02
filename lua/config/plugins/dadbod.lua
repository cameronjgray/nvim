return {
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-completion" },
  {
    "kristijanhusak/vim-dadbod-ui",
    init = function()
      vim.g.vim_dadbod_completion_mark_as_keyword = 0
      vim.g.omni_sql_no_default_maps = 1
      vim.g.db_ui_auto_fold_results = 0
    end,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dbout",
        callback = function()
          vim.notify("dbout autocmd fired")
          vim.opt_local.foldenable = false
          vim.opt_local.foldmethod = "manual"
        end,
      })
    end,
  },
}

