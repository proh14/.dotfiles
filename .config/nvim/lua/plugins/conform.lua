return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      cpp = { "clang_format" },
      c = { "clang_format" },
    },
    format_on_save = true,
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
