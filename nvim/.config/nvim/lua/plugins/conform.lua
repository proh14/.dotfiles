return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      cpp = { "clang-format" },
      c = { "clang-format" },
      arduino = { "clang-format" },
    },
    format_on_save = true,
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
