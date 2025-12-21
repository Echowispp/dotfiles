
" -------------------------------
" Plugin manager
" -------------------------------
call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn', { 'as': 'zenburn' }
Plug 'arcticicestudio/nord-vim', { 'as': 'nord' }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Language packs & syntax
Plug 'sheerun/vim-polyglot'

" Language-specific enhancements
Plug 'habamax/vim-godot'
Plug 'pangloss/vim-javascript'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

" -------------------------------
" Basic settings
" -------------------------------
syntax enable
set termguicolors
colorscheme onedark

set number
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
set linespace=4

