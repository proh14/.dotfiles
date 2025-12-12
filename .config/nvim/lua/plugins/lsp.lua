return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable "lua_ls"
    vim.lsp.enable "clangd"
  end,
}
