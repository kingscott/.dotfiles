vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.cmd([[
	autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd FileType css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd FileType typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd FileType go setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
	autocmd FileType rust setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
	autocmd FileType lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd FileType nix setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
]])
