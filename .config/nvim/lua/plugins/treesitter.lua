return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "make" },
            sync_install = false,
            auto_install = true,
            -- disable = {"c"},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end,
    build = ":TSUpdate",
}
