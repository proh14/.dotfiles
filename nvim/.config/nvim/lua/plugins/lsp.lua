return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.log.set_level "error"
    vim.lsp.enable "lua_ls"
    vim.lsp.enable "clangd"
    vim.lsp.enable "bashls"
    vim.lsp.enable "arduino_language_server"
    vim.diagnostic.config {
      virtual_text = {
        true,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }
  end,
}
