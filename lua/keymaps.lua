-- Windows
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>s", ":split<CR>")
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>")

-- Packer
vim.api.nvim_set_keymap("n", "<leader>ps", "<cmd>PackerSync<CR>", { noremap = true })

-- Commands
vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

-- Files
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>Oil<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>of", "<cmd>Oil --float<CR>", { noremap = true })

-- Cheatsheet
vim.api.nvim_set_keymap("n", "<leader>cs", "<cmd>Cheatsheet<CR>", { noremap = true })

-- LSP
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>Mason<CR>", { noremap = true })
