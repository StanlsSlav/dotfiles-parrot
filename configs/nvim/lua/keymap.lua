vim.g.mapleader = ' '

-- Move and respect the indent
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Append line below and keep cursor at the same position
vim.keymap.set('n', 'J', 'mzJ`z')

-- Jump in file with cursor being in the middle of the screen
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Same as before, but for matches/findings
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Yank to system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Jump between errors
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Zen
vim.keymap.set('n', '<C-w>z', '<cmd>ZenMode<CR>')

-- The usual search and replace, but pre-builded and with a little bit of spice
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
