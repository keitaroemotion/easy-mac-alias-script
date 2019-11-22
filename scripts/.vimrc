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
"filetype plugin indent on

let g:w3m#command = '/usr/local/bin/w3m'
nnoremap <CR> i<Return><Esc>^k
nnoremap <Space> i<Space><Esc>
set number

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
"tnoremap <C-[> <C-w>N
nnoremap <C-\> :e .<CR>

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
let g:airline_theme='badwolf'
"let g:airline_theme='light'
"let g:airline_theme='cool'
"let g:airline_theme='papercolor'

" set ignorecase
let g:netrw_keepdir=0
let g:netrw_banner = 0

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:NERDTreeNodeDelimiter = "\u00a0"

set hlsearch
iabbrev teh the
iabbrev hte the
iabbrev trturn return
iabbrev rerurn return
iabbrev returen return
iabbrev taht that

set noautoindent
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
"filetype plugin indent on
NeoBundleCheck

Plugin 'maksimr/vim-jsbeautify'

".vimrc
map <c-q> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-q> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-q> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-q> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-q> :call HtmlBeautify()<cr>
autocmd FileType gsp  noremap <buffer> <c-q> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-q> :call CSSBeautify()<cr>

" Screen Capture
:command Screen :call Screen()
function! Screen()
    let result = system("screencapture ~/Desktop/pic.png")
endfunction

" Git reset hard
:command Grh :call GitResetHard()
function! GitResetHard()
    let result = system("git reset --hard")
endfunction

" Git clean -f
:command Gcf :call GitCleanF()
function! GitCleanF()
    let result = system("git clean -f")
    echo result
endfunction

" Git status
:command St :call GitStatus()
function! GitStatus()
    let result = system("git status")
    echo result
endfunction

" Git add
:command! -nargs=? Add :call Add(<f-args>)
function! Add(...)
    if a:0 >= 1
        let result = system("git add " . a:file)
    else
        let result = system("git add .")
    end
    echo result
endfunction

" Git reset
:command Reset :call Reset()
function! Reset()
    let result = system("git reset")
    echo result
endfunction

" Git commit
:command! -nargs=? Adp :call Adp(<f-args>)
function! Adp(...)
    if a:0 >= 1
        let result = system("git add .; git commit -m \"" . a:1 . "\"; git push origin HEAD")
        echo result
    else
        let result = system("git add .; git commit -m \"XXX\"; git push origin HEAD")
        echo result
    end
endfunction

" Git commit
:command! -nargs=? Commit :call Commit(<f-args>)
function! Commit(...)
    if a:0 >= 1
        let result = system("git commit -m \"" . a:1 . "\"")
        echo result
    else
        let result = system("git commit -m " . "XXX")
    end
endfunction

" Git log
:command! -nargs=? Log :call Log(<f-args>)
function! Log(...)
    if a:0 >= 1
        let result = system("git log " . a:1)
        echo result
    else
        let result = system("git log ")
        echo result
    end
endfunction

" Ls
:command Ls :call Ls()
function! Ls()
    let result = system("ls")
    echo "\n" . result
endfunction

" Tree
:command Tree :call Tree()
function! Tree()
    let result = system("tree")
    echo "\n" . result
endfunction

command! -nargs=1 Touch call Touch(<f-args>) 
function! Touch(file)
    let result = system("touch " . a:file)
endfunction

" Cat
:command! -nargs=1 Cat :call Cat(<f-args>)
function! Cat(file)
    let result = system("cat " . a:file)
    echo result
endfunction

" ps aux | grep ...
:command! -nargs=1 PsAuxGrep :call PsAuxGrep(<f-args>)
function! PsAuxGrep(procquery)
    let result = system("ps aux | grep " . a:procquery)
    echo result
endfunction

:command! -nargs=? Shebang :call Shebang(<f-args>)
function! Shebang(...)
    if a:0 >= 1
        let text = "#!/usr/bin/env " . a:1
        put =text
    else
    end
endfunction

command! PyEnc call PyEnc() 
function! PyEnc(...)
    let text = "# -*- coding: utf-8 -*-"
    put =text
endfunction

command! Cx call Cx() 
function! Cx()
    let file   = @%
    let result = system("chmod +x " . file)
    echo result
endfunction

command! Blame call Blame() 
function! Blame()
    let file   = @%
    let result = system("git blame " . file)
    echo result
endfunction

command! Diff call Diff() 
function! Diff()
    let result = system("git diff ")
    echo result
endfunction

command! Cached call Cached() 
function! Cached()
    let result = system("git diff --cached ")
    echo result
endfunction

:command! -nargs=? Sed :call Sed(<f-args>)
function! Sed(...)
    if a:0 >= 1
        let result = system("ope -r " . a:1 )
        echo result
    else
    endif
endfunction

command! DockerBuild call DockerBuild() 
function! DockerBuild()
    let result = system("docker build .")
    echo result
endfunction

:command! -nargs=1 KillPort :call KillPort(<f-args>)
function! KillPort(port)
    let result = system("sudo lsof -n -i4TCP:" . a:port . " | grep LISTEN | awk '{print $2}' | sudo xargs kill -9;")
    echo result
    echo "Port removed"
endfunction

"
" Grails
"
:command! -nargs=? GrailsCreateApp :call GrailsCreateApp(<f-args>)
function! GrailsCreateApp(...)
    if a:0 >= 1
        let result = system("~/.vim/cmd/grails-create-app " . a:1 )
        echo result
    else
    endif
endfunction

"
" Grails Run App
"
:command! -nargs=? GrailsRunApp :call GrailsRunApp(<f-args>)
function! GrailsRunApp(...)
    echo "\ngrails run-app\n" 
endfunction

"
" Grails Make Anyway (Scaffolding)
"
:command! -nargs=? GrailsScaffold :call GrailsScaffold(<f-args>)
function! GrailsScaffold(...)
    if a:0 >= 1
        let result = system( "~/.vim/cmd/grails-make-anyway " . a:1)
        echo result
    else
    endif
endfunction

:command! -nargs=? Localhost :call Localhost(<f-args>)
function! Localhost(...)
    let alphaquery = ""
    if a:0 >= 1
        let alphaquery = ":" . a:1
    endif
    let result = system("open http://127.0.0.1" . alphaquery)
endfunction

:command! -nargs=? BrowseFree :call Look2(<f-args>)
function! Look2(...)
    let alphaquery = ""
    if a:0 >= 1
        let alphaquery = "+" . substitute(a:1, ' ', '+', "g")
    endif
    let result = system("open https://www.google.com/search?q=" . alphaquery)
endfunction

:command! -nargs=? Browse :call Look(<f-args>)
function! Look(...)
    let alphaquery = ""
    if a:0 >= 1
        let alphaquery = "+" . substitute(a:1, ' ', '+', "g")
    endif
    let result = system("open https://www.google.com/search?q=" . expand("<cword>") . alphaquery)
endfunction

:command! -nargs=? BrowseMore :call Xlook(<f-args>)
function! Xlook(...)
    let alphaquery = ""
    if a:0 >= 1
        let alphaquery = "+" . substitute(a:1, ' ', '+', "g")
    endif
    let result = system("open https://www.google.com/search?q=" . expand("<cWORD>") . alphaquery)
endfunction

command! Whatis call WhatIs() 
function! WhatIs()
    let result = system("open https://www.google.com/search?q=what+is+" . expand("<cword>"))
endfunction

command! Link call Link() 
function! Link()
    let result = system("open " . expand("<cWORD>"))
endfunction

:command! -nargs=? Dic :call Dic(<f-args>)
function! Dic(...)
    let alphaquery = ""
    if a:0 >= 1
        let alphaquery = "+" . substitute(a:1, ' ', '+', "g")
    endif
    let result = system("dict " . expand("<cword>") . alphaquery)
    echo result
endfunction

command! Wiki call Wiki() 
function! Wiki()
    let result = system("touch ~/sugadoc/" . expand("<cword>") . ".md")
    echo "Wiki created!"
endfunction

command! SugadocUpdate call SugadocUpdate() 
function! SugadocUpdate()
    let result = system("cd ~/sugadoc; git add .; git commit -m 'articles added'; git push origin HEAD")
    echo result
endfunction

command! Github call Github() 
function! Github()
    let result = system("open https://github.com/keitaroemotion?tab=repositories")
endfunction

command! Gmail call Gmail() 
function! Gmail()
    let result = system("open https://mail.google.com/mail/u/1/?pli=1#inbox")
endfunction

command! Twitter call Twitter() 
function! Twitter()
    let result = system("open https://twitter.com/keikunlab")
endfunction

command! Twitternew call Twitternew() 
function! Twitternew()
    let result = system("open https://twitter.com/compose/tweet")
endfunction

command! Ph call Ph() 
function! Ph()
    let result = system("git push origin HEAD")
    echo result
endfunction

command! SecurityNews call Securitynews()
function! Securitynews()
    let result = system("open https://www.scmagazine.com/home/security-news/")
endfunction

command! Hackernews call Hackernews()
function! Hackernews()
    let result = system("open https://news.ycombinator.com")
endfunction

command! AWSConsole call AWSConsole()
function! AWSConsole()
    let result = system("open https://ap-northeast-1.console.aws.amazon.com/console/home?nc2=h_ct&region=ap-northeast-1&src=header-signin#")
endfunction

command! AWSBlog call AWSBlog()
function! AWSBlog()
    let result = system("open https://aws.amazon.com/blogs/aws")
endfunction

command! AWSEC2 call AWSEC2()
function! AWSEC2()
    let result = system("open https://ap-northeast-1.console.aws.amazon.com/ec2/home?region=ap-northeast-1#Home:")
endfunction

command! Atmarkit call Atmarkit()
function! Atmarkit()
    let result = system("open https://www.atmarkit.co.jp/ait/subtop/features/special/")
endfunction

command! Task call Task()
function! Task()
    let result = system("open https://calendar.google.com/calendar/b/1/r")
endfunction

command! Menu call Menu() 
function! Menu()
    echo "\nScreen                     ... screencapture (mac only)"
    echo "Grh                        ... git reset --hard"
    echo "Gcf                        ... git clean -f"
    echo "Gmail                      ... open Gmail  account"
    echo "Github                     ... open Github account"
    echo "Wiki                       ... Touch current word (cursor) as new wiki page"
    echo "Sugadocupdate              ... update my wiki directory"
    echo "St                         ... git status"
    echo "Add                        ... git add"
    echo "Adp [message]              ... git add -> git commit -> git push orign HEAD"
    echo "Reset                      ... git reset"
    echo "Commit [message]           ... git commit"
    echo "Log                        ... git log"
    echo "Browse [opt: keywords]     ... Search the word currently pointer is on in web"
    echo "BrowseFree [opt: keywords] ... Search the web freely"
    echo "BrowseMore [opt: keywords] ... Browse but can include non \w"
    echo "Ls                         ... ls"
    echo "Search [opt: keywords]     ... Same as Look but includes non alphabet (-)"
    echo "Tree                       ... tree"
    echo "Touch     [file mame]      ... touch a file"
    echo "Cat       [file name]      ... cat some file"
    echo "PsAuxGrep [procquery]      ... ps aux | grep [something]"
    echo "Shebang   [Language name]  ... paste #!/usr/bin/env [something]"
    echo "Cx                         ... chmod +x to the current file"
    echo "Blame                      ... show git blame of current file"
    echo "Diff                       ... Show git diff"
    echo "Sed [from] [to]            ... Replace string [from] into string [to] accorss each file" 
    echo "<C-q>                      ... Format current file" 
    echo "<C-\>                      ... Show current directlry = :E" 
    echo "Securitynews               ... open Securitynews   "
    echo "Hackernews                 ... open Hackernews"
    echo "AWSBlog                    ... open AWSBlog"
    echo "AWSEC2                     ... open AWS Console (EC2) "
    echo "AWSConsole                 ... open AWSConsole "
    echo "Atmarkit                   ... open ITNews (Japanese)"
    echo "Task                       ... open Google Calendar and your tasks"
    echo "Menu                       ... " 
    echo "" 
endfunction
set hidden
hi CursorLine   cterm=NONE ctermbg=lightred ctermfg=black guibg=lightred guifg=black
"hi CursorColumn cterm=NONE ctermbg=lightred ctermfg=white guibg=lightred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
