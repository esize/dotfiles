set nocompatible
set t_Co=256
colorscheme atom
syntax enable
set tabstop=4
set expandtab
set number
filetype indent on
set autoindent
set autoread
set hidden
set lazyredraw
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

"Line Highlighting
set cursorline
hi CursorLine cterm=NONE ctermbg=239 ctermfg=NONE

"Enable mouse mode
set mouse=a

"Always on Powerline
set laststatus=2

call plug#begin('~/.vim/plugged')
"Plugins

Plug 'easymotion/vim-easymotion'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
map <C-S-t> <C-[>:NERDTreeToggle<cr>

"Fix Copy and Paste
map <Leader>c "+y
map <Leader>y "+y
map <Leader>v "+p
map <Leader>p "+p


no <Up> :resize +2<CR>
no <Down> :resize -2<CR>
no <Right> :vertical resize +2<CR>
no <Left> :vertical resize -2<CR>

