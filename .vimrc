set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'powerline/powerline'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on


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
