set noswapfile

nnoremap s :w<CR>
nnoremap qq :q<CR>
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set statusline=\PATH:\ %r%F\ \ \ \ \LINE:\ %l/%L/%P\ TIME:\ %{strftime('%c')}

set tags=./tags;$HOME

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

let g:w3m#command = '/usr/local/bin/w3m'

nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>

set langmenu=en_US
let $LANG = 'en_US'
:command Docker :vert term ++close docui
:command Lgit   :vert term ++close lazygit 
:command Blame  :vert term ++close git blame %
:command Shell  :vert term
:command Curwin :term ++curwin

command CDC cd %:p:h
nnoremap <C-x>m :res +5<CR>
nnoremap <C-x>, :res -5<CR>
nnoremap <C-x>s :bot  term ++close ++rows=11<CR>
nnoremap <C-x>v :vert term ++close<CR>

nnoremap <C-x>n :NERDTreeToggle<CR>

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_theme='aurora'
"let g:airline_theme='light'
"let g:airline_theme='cool'
let g:airline_theme='papercolor'

set ignorecase
let g:netrw_keepdir=0

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:NERDTreeNodeDelimiter = "\u00a0"

set hlsearch
iabbrev teh the
iabbrev hte the
syntax keyword WordError teh

"when vimgrep/grep
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cN<CR>


" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'rking/ag.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Screen Capture
function! Screen()
    let result = system("screencapture ~/Desktop/pic.png")
endfunction

:command Screen :call Screen()
