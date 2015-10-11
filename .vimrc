"""""""""""""""""""""""""""""""
" Init
"""""""""""""""""""""""""""""""
" Use Vim not Vi settings, has to be set at the beginning because of side effects
set nocompatible

set shell=/bin/zsh
set guifont=Menlo:h14
set encoding=utf-8
scriptencoding utf-8
let g:indentLine_char = '｜'

autocmd!
call pathogen#infect('bundle/{}')

" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

set ttyfast
set timeoutlen=500 " mapping delay
set ttimeoutlen=0  " key code delay

set autoread " If a file is changed outside of vim, automatically reload it without asking

set vb t_vb= " disable bell

set clipboard=unnamed " use clipboard as the default register

" changing the leader
" let mapleader = "\<Space>"
nmap <SPACE> <leader>

" remove js checker because it doesn't support es6 and es7 syntax
let g:syntastic_javascript_checkers = ['']

""""""""""""""""""""""""""""""""""""
" Basic Config
""""""""""""""""""""""""""""""""""""

"
" Syntax
"
syntax on
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized
filetype plugin indent on
set showmatch " move the cursor to the previous matching bracket for half a second, and quickly pressing a key will effectively cancel this animation

"
" Indention
"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"
" Search
"
set incsearch            " find the next match as we type the search
set hlsearch             " hilight searches by default
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters
set gdefault             " make g the default subsitution flag

"
" Lining
"
set number
set relativenumber
set cursorline
set scrolloff=9999     " vertical/horizontal scroll off settings to be in the middle
set sidescrolloff=7
set sidescroll=1
set wrap            " dont wrap lines
set linebreak       " wrap lines at convenient points

"
" History
"
" TODO unsure about hidden and my workflow
" maybe Im going to throw it out
set hidden        " allow unsaved background buffers and remember marks/undo for them
set history=10000
set modeline      " Modelines (comments that set vim options on a per-file basis)
set modelines=3
set nobackup      " Don't make backups at all
set noundofile    " lets you undo from before file was opend
set noswapfile    " because I am writing on all changes it is disabled
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"
" Status & Cmd's
"
set showcmd      " show incomplete cmds down the bottom
set showmode     " show current mode down the bottom
set laststatus=2 " always display status bar
set cmdheight=1  " Avoiding the 'Hit ENTER to continue' prompts

"
" Altered Format Behaviour of Cmd
"
set nojoinspaces
set formatoptions-=o                        " dont continue comments when pushing o/O
set backspace=indent,eol,start
set timeout timeoutlen=1000 ttimeoutlen=100 " Fix slow O inserts
" TODO: create only specific chars
" set digraph " Enables input of special characters by a combination of two characters. Example: Type 'a', erase it by typing CTRL-H - and then type ':'

"
" Command Line Completion
"
set wildmode=list:longest   " make cmdline tab completion similar to bash
set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing
set complete+=k             " add dictionary scanning
set omnifunc=syntaxcomplete#Complete

"
" Buffer
"
set switchbuf=useopen

"
" Folding
"
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""
" Disable arrow keys & hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>
imap <esc> <NOP>

" use ZZ instead, fewer keystrokes
cnoreabbrev wq <NOP>
cnoreabbrev x  <NOP>

" block visual mode
nmap v     <NOP>
nmap V     <NOP>
nmap <c-v> <NOP>

" TODO considering this
" nnoremap ' `
" nnoremap ` '

" Move around splits with <c-hjkl>
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

" Recover from accidental Ctrl-U/W
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" prevent esc from going back
inoremap <c-c> <c-c>`^

inoremap <c-d> <c-c> u

" This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

nnoremap <silent> <leader>s :set spell!<cr>

" open vimrc in split view
nnoremap <leader>r <C-w><C-v><C-l>:e $MYVIMRC<cr>

" remove all end white spaces and write
nnoremap <leader>w  mz :%s/\s\+$//e<cr> :noh<cr> :w<cr> `z

" compress multiple lines to one
nnoremap <leader>J :%s/^\_s\+\n/\r <cr> :noh<cr>

" open new tab and open file
nnoremap <leader>t :tabnew <cr>

" quickly fix spelling error
nnoremap <leader>f 1z=

" stop enteritg ex mode
" and map it to quit window
nnoremap Q :q <cr>

" commit all and push
nnoremap <leader>p :!git add --all && git commit && git push origin master<CR><CR>

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" EasyAlign mappings
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" nextval bindings
" nmap <silent> <unique> + <Plug>nextvalInc
" nmap <silent> <unique> - <Plug>nextvalDec

"""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
"""""""""""""""""""""""""""""""""""""""

" reload vimrc if written
autocmd bufwritepost .vimrc source $MYVIMRC

" autosaves buffer if changed occured
autocmd InsertLeave,TextChanged * if expand('%') != '' | update | endif

" THIS REMOVES ALL TRAILING WHITESPACES ON WRITEBUFFER/SAVE
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  autocmd FileType c,cpp,java,php,ruby,python,javascript,javascript.jsx autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()
map <leader>gst :call OpenChangedFiles() <cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FuzzySearch/ Selecta Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaFile(path)
  call SelectaCommand("find " . a:path . "/* -type f -not -path '~/Library/*' -not -path './node_modules/*' -not -path './lib/*' -not -path './public/assets/*'", "", ":e")
endfunction

nnoremap <leader>f :call SelectaFile(".")<cr>

" Fuzzy select
function! SelectaIdentifier()
  " Yank the word under the cursor into the z register
  normal "zyiw
  " Fuzzy match files in the current directory, starting with the word under
  " the cursor
  call SelectaCommand("find * -type f", "-s " . @z, ":e")
endfunction
nnoremap <c-g> :call SelectaIdentifier()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab teh the
