return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        lazy = false,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require "null-ls"
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            local formatting = null_ls.builtins.formatting
            local lint = null_ls.builtins.diagnostics
            local sources = {
                formatting.clang_format,
                formatting.stylua,
            }

            null_ls.setup {
                sources = sources,
                on_attach = function(client, bufnr)
                    if client.supports_method "textDocument/formatting" then
                        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format { async = false }
                            end,
                        })
                    end
                end,
            }
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup {
                ensure_installed = { "stylua", "clang_format", "cpplint" },
            }
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local lsp_zero = require "lsp-zero"
            lsp_zero.extend_cmp()
            local cmp = require "cmp"
            local cmp_action = lsp_zero.cmp_action()
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup {
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert {
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
                            else
                                cmp.confirm()
                            end
                        else
                            fallback()
                        end
                    end, { "i", "s", "c" }),
                },
                sources = cmp.config.sources {
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- snippets
                    { name = "buffer" }, -- text within current buffer
                    { name = "path" }, -- file system paths
                },
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            local lsp_zero = require "lsp-zero"
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps { buffer = bufnr }
            end)

            require("mason-lspconfig").setup {
                ensure_installed = { "clangd", "lua_ls" },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                },
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
        config = function()
            require("mason-nvim-dap").setup {
                ensure_installed = { "codelldb" },
            }
        end,
    },
}
