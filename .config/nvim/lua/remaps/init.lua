local map = vim.api.nvim_set_keymap

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = false })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = false })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = false })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = false })
map("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = false })
map("n", "<leader>fm", "<cmd>LspZeroFormat<cr>", { noremap = true, silent = false })
map("n", "<leader>gs", "<cmd>Neogit<cr>", { noremap = true, silent = false })
map("n", "<leader>dt", "<cmd>DapUiToggle<cr>", { noremap = true, silent = false })
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { noremap = true, silent = false })
map("n", "<leader>dt", '<cmd>lua require("dapui").open({reset = true})<cr>', { noremap = true, silent = false })
map("n", "<leader>dc", "<cmd>DapContinue<cr>", { noremap = true, silent = false })
map("n", "<leader>dc", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = false })
map("n", "<leader>qf", '<cmd>require("trouble").open("quickfix")<cr>', { noremap = true, silent = false })
map("n", "<leader>qq", '<cmd>require("trouble").open "lsp_references<cr>', { noremap = true, silent = false })
