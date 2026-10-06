vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>e', ':<C-w>d')
vim.keymap.set('n', '<leader>cd', ':Explore<CR>')


vim.pack.add({
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{ src = "https://github.com/nvim-telescope/telescope.nvim" },
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

vim.lsp.enable({ "lua_ls", "gopls", "ts_ls" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)


vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fs', ':Telescope grep_string<CR>')
