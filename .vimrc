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
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'junegunn/goyo.vim'
Plug 'rhysd/vim-grammarous'
Plug 'rafaqz/citation.vim'

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

"Enter Writing Mode
no <Leader>w :Goyo<CR>:set nonumber<CR>

"Writing Checks
no <Leader>g :GrammarousCheck<CR>


   let g:word_count="<unknown>"
   function WordCount()
       return g:word_count
   endfunction
   function UpdateWordCount()
       let lnum = 1
       let n = 0
       while lnum <= line('$')
           let n = n + len(split(getline(lnum)))
           let lnum = lnum + 1
       endwhile
       let g:word_count = n
   endfunction
   " Update the count when cursor is idle in command or insert mode.
   " Update when idle for 1000 msec (default is 4000 msec).
   set updatetime=1000
   augroup WordCounter
       au! CursorHold,CursorHoldI * call UpdateWordCount()
   augroup END
   " Set statusline, shown here a piece at a time
   highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
   set statusline=%1*            " Switch to User1 color highlight
   set statusline+=%<%F            " file name, cut if needed at start
   set statusline+=%M            " modified flag
   set statusline+=%y            " file type
   set statusline+=%=            " separator from left to right justified
   set statusline+=\ %{WordCount()}\ words,
   set statusline+=\ %l/%L\ lines,\ %P    " percentage through the file
