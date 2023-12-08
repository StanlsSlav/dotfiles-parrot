vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.wildmode = {'longest', 'list'}
vim.opt.updatetime = 1000
vim.opt.path:append('**')
vim.opt.termguicolors = true

-- Show trailing whitespaces
vim.opt.list = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

local home_env = os.getenv('Home')
if not home_env then
    home_env = os.getenv('UserProfile')
end
vim.opt.undodir = home_env .. '/.nvim/undodir'

vim.opt.colorcolumn = '124'

vim.g.mapleader = ' '