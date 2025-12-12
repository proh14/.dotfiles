local map = vim.keymap.set

-- Telescope keybindings
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = false })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = false })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = false })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = false })

-- NvimTree toggle
map("n", "<leader>nn", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = false })

-- Conform formatting
map("n", "<leader>fm", function()
  require("conform").format()
end, { noremap = true, silent = false })

-- LazyGit
map("n", "<leader>gs", "<cmd>LazyGit<cr>", { noremap = true, silent = false })

-- DAP keybindings
map("n", "<leader>dt", "<cmd>DapUiToggle<cr>", { noremap = true, silent = false })
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { noremap = true, silent = false })
map("n", "<leader>dt", '<cmd>lua require("dapui").open({reset = true})<cr>', { noremap = true, silent = false })
map("n", "<leader>dc", "<cmd>DapContinue<cr>", { noremap = true, silent = false })

-- Undotree toggle
map("n", "<leader>dc", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = false })

-- Trouble keybindings
map("n", "<leader>qf", '<cmd>require("trouble").open("quickfix")<cr>', { noremap = true, silent = false })
map("n", "<leader>qq", '<cmd>require("trouble").open "lsp_references"<cr>', { noremap = true, silent = false })

-- Zen Mode
map("n", "<leader>zz", "<cmd>ZenMode<cr>", { noremap = true, silent = false })

-- Oil file explorer
map("n", "-", "<cmd>Oil<cr>", { noremap = true, silent = false })
