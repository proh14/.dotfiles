local plugins = {
  {
    {
      "rcarriga/nvim-dap-ui",
      event = "VeryLazy",
      dependencies = "mfussenegger/nvim-dap",
      config = function()
        local dap = require "dap"
        local dapui = require "dapui"
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end,
    },
    {
      "christoomey/vim-tmux-navigator",
      lazy = false,
    },
    {
      "sopa0/telescope-makefile",
      dependencies = {
        "nvim-telescope/telescope.nvim",
        "akinsho/nvim-toggleterm.lua",
      },
      config = function()
        require("telescope").load_extension "make"
        require("telescope-makefile").setup {
          makefile_priority = { ".", "build/" },
          default_target = "[DEFAULT]",
          make_bin = "make",
        }
      end,
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      event = "VeryLazy",
      dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
      },
      opts = {
        handlers = {},
      },
    },
    {
      "mfussenegger/nvim-dap",
      config = function(_, _)
        require("core.utils").load_mappings "dap"
      end,
    },
    {
      "neovim/nvim-lspconfig",

      dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end,
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "lua-language-server",
        "stylua",
        "cpptools",
      },
    },
  },
}
return plugins
