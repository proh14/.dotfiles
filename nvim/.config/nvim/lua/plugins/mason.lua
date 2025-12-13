return {{
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  }
},
{
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "pyright",
    },
  }
}
}
