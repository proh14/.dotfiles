local map = vim.api.nvim_set_keymap

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = false })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = false })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = false })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = false })
map("n", "<leader>nt", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = false })
map("n", "<leader>np", "<cmd>NvimTreeClose<cr>", { noremap = true, silent = false })
map("n", "<leader>fm", "<cmd>LspZeroFormat<cr>", { noremap = true, silent = false })
map("n", "<leader>gs", "<cmd>Neogit<cr>", { noremap = true, silent = false })
map("n", "<leader>dt", "<cmd>DapUiToggle<cr>", { noremap = true, silent = false })
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { noremap = true, silent = false })
map("n", "<leader>dt", '<cmd>lua require("dapui").open({reset = true})<cr>', { noremap = true, silent = false })
map("n", "<leader>dc", "<cmd>DapContinue<cr>", { noremap = true, silent = false })
map("n", "<leader>dc", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>xx", function()
    require("trouble").open()
end)
vim.keymap.set("n", "<leader>xw", function()
    require("trouble").open "workspace_diagnostics"
end)
vim.keymap.set("n", "<leader>xd", function()
    require("trouble").open "document_diagnostics"
end)
vim.keymap.set("n", "<leader>xq", function()
    require("trouble").open "quickfix"
end)
vim.keymap.set("n", "<leader>xl", function()
    require("trouble").open "loclist"
end)
vim.keymap.set("n", "gR", function()
    require("trouble").open "lsp_references"
end)
