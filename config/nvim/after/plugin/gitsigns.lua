require('gitsigns').setup()
vim.keymap.set("n", "<leader>gp", function() 
    vim.cmd.Gitsigns("preview_hunk")
end)
vim.keymap.set("n", "<leader>rh", function() 
    vim.cmd.Gitsigns("reset_hunk")
end)
vim.keymap.set("n", "<leader>glb", function() 
    vim.cmd.Gitsigns("toggle_current_line_blame")
end)
