set nocompatible
set t_Co=256
colorscheme atom
syntax enable
set tabstop=4
set expandtab
set number
filetype indent on
set autoindent
set cursorline
hi CursorLine cterm=NONE ctermbg=239 ctermfg=NONE

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on


let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

vno <C-c> "+y
map <C-v> "+p


vno <Up> <Nop>
no <Down> ddp
no <Left> <Nop>
no <Right> <Nop>
no <Up> ddkP
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>
ino <Up> <Nop>
vno <Down> <Nop>
vno <Left> <Nop>
vno <Right> <Nop>

map <C-t> <C-[>:NERDTreeToggle<cr>
