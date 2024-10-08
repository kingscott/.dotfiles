-- Needed?
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>sf", ":NvimTreeFindFile<CR>")
