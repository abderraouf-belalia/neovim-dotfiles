vim.g.loaded_netrw = 1
vim.g.load_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>")
