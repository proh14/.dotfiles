return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable "lua_ls"
    vim.lsp.enable "clangd"
    vim.diagnostic.config({
      virtual_text = {
        true,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
