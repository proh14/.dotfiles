return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},                                -- Loads default behaviour
                ["core.concealer"] = { config = { icon_preset = "diamond" } }, -- Adds pretty icons to your documents
                ["core.dirman"] = {                                    -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/norg/notes",
                            todo = "~/norg/todo",
                        },
                        default_workspace = notes,
                    },
                },
                ["core.export"] = {},
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
                ["core.journal"] = {
                    config = {
                        journal_folder = "journal",
                    },
                },
            },
        }
    end,
}
