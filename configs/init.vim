" ================================= General Settings

set nocompatible
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set hidden
set signcolumn=yes
set relativenumber
set number
set spell
set title
set ignorecase
set smartcase

" See invisible characters
set list listchars=tab:>\ ,trail:·,eol:$

set mouse=a
set scrolloff=8
set splitright
set updatetime=1000
set path+=**
let g:netrw_liststyle=3
set hlsearch
set incsearch
set wildmode=longest,list

if (has(“termguicolors”))
	set termguicolors
endif
syntax on
syntax enable
colorscheme dracula

" Fix cursor replacement after closing nvim
set guicursor=

" ================================= Keymaps

" Shift+Tab does inverse tab
inoremap <S-Tab> <C-d>

" Wrap to next line when end of line is reached
set whichwrap+=<,>,[,]
