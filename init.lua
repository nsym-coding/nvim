vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.guifont = "Jetbrains Mono"
vim.o.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.foldmethod = 'indent'

vim.cmd [[colorscheme catppuccin]]

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>e', ':<C-w>d')
vim.keymap.set('n', '<leader>cd', ':Explore<CR>')
vim.keymap.set('n', '<leader>nh', ':nohl<CR>')

vim.pack.add({
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{ src = "https://github.com/nvim-telescope/telescope.nvim" },
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
		{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
		{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

vim.lsp.enable({ "lua_ls", "gopls", "ts_ls", "pyright" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fs', ':Telescope grep_string<CR>')

-- Git Keymaps
vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>')


-- Status Line
local function git_branch()
    local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    if string.len(branch) > 0 then
        return branch
    else
        return ":"
    end
end

local function statusline()
    local set_color_1 = "%#PmenuSel#"
    local branch = git_branch()
    local set_color_2 = "%#LineNr#"
    local file_name = " %f"
    local modified = "%m"
    local align_right = "%="
    local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
    local fileformat = " [%{&fileformat}]"
    local filetype = " %y"
    local percentage = " %p%%"
    local linecol = " %l:%c"

    return string.format(
        "%s %s %s%s%s%s%s%s%s%s%s",
        set_color_1,
        branch,
        set_color_2,
        file_name,
        modified,
        align_right,
        filetype,
        fileencoding,
        fileformat,
        percentage,
        linecol
    )
end

vim.opt.statusline = statusline()

