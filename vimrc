"--------------------------------------------------------------------------
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'

call plug#end()
"--------------------------------------------------------------------------

"slow refresh on the markdown preview plugin by iamcco
let g:mkdp_refresh_slow=1

"use gui colors in the terminal
set termguicolors

"don't use swap files
set noswapfile

"set title at the top of the window 
set title

"reduce delay when pressing esc
set timeoutlen=1000
set ttimeoutlen=50

"reduce warning prompts
set shortmess=a

filetype off

"enable syntax highlighting
syntax on

"colorscheme
colo gruvbox
"colo PaperColor
"background
set background=dark

"make comments italic
hi Comment cterm=italic gui=italic

"highlight the line where the cursor is
set cursorline
hi CursorLine guibg=#282828
hi CursorLineNr guibg=#282828
"hi CursorLine ctermbg=none guibg=NONE


filetype plugin indent on

set modelines =0 

"lines wrap around the screen 
set wrap

"highlight current line
"set cursorline

set spelllang=en
"set spell

"set textwidth=110
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set smarttab

set backspace=indent,eol,start

set ttyfast

set laststatus=2

set showmode
set showcmd

set scrolloff=0

set matchpairs+=<:>

set statusline=%f\ %h%w%m%r\ [BUFFER=%n]\ %=%(%l,%c%V\ %=\ %P%)

set encoding=utf-8

"hihlight search
set hlsearch

"incremental search
set incsearch

"ignore case when searching
set ignorecase

"move on blank spaces horizontally
set virtualedit =all

"relative line number
set relativenumber

"both relative and absolute line number
set number

"search ignores case until the first Capital
set smartcase

"autocmd BufWinLeave ?*.* mkview 1
"autocmd BufWinEnter ?*.* silent loadview 1

"save and load folds
 "au BufWinLeave ?* mkview 1
 "au BufWinEnter ?* silent loadview 1

"cursor
hi Cursor ctermfg=DarkRed
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"set leader
let mapleader = "\<space>" 

"execute last : command
"function ExecuteLastCommand()
"    exec "normal! @:"
"endfunction
"nnoremap <leader>r :call ExecuteLastCommand()<cr>

"check what syntax highlight group the cursor is on
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"toggle paste mode
set pastetoggle=<F2>

"smooth scrolling
"function SmoothScroll(up)
"    if a:up
"        let scrollaction="\<C-y>"
"    else
"        let scrollaction="\<C-e>"
"    endif
"    exec "normal " . scrollaction
"    redraw
"    let counter=1
"    while counter<&scroll
"        let counter+=1
"        sleep 5m
"        redraw
"        exec "normal " . scrollaction
"    endwhile
"endfunction
"
"nnoremap <C-U> :call SmoothScroll(1)<Enter>
"nnoremap <C-D> :call SmoothScroll(0)<Enter>
"inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
"inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

"******************************************************************
"LATEX SHORTCUTS
"latex emphatic prefix
"function LatexEmph()
"    exec "normal lbi\\emph{"
"endfunction
"nnoremap <leader>le :call LatexEmph()<cr>
"
"latex bold prefix
"function LatexBold()
"    exec "normal lbi\\textbf{"
"endfunction
"nnoremap <leader>lb :call LatexBold()<cr>
"
""latex underline prefix
"function LatexUnderline()
"    exec "normal lbi\\underline{"
"endfunction
"nnoremap <leader>lu :call LatexUnderline()<cr>
"
""syntax highlight when editing .tex files
"let g:tex_flavor = "latex"
"******************************************************************

"automatically close brackets
""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

"------------------------------------------------------------------------------
"markdown mappings
"exponential 
inoremap ;e ^{}<left>
"index (pedice)
inoremap ;i _{}<left>
"fraction
inoremap ;f \frac{}{}<ESC>2F{a
"binomial
inoremap ;b \binom{}{}<ESC>2F{a
"sum from a value to another
inoremap ;s \sum_{i=}^{}<ESC>F=a
"product from a value to another
inoremap ;p \prod_{i=}^{}<ESC>F=a
"integral from a value to another
inoremap ;g \int_{}^{}<ESC>2F{a
"system of multiple equations
inoremap ;c \begin{cases}\\\end{cases}
"------------------------------------------------------------------------------
            
"remap the escape key to leave insert mode
:imap jk <Esc>
:imap kj <Esc>

"spell checking: highlight wrong words and use english dictionary
hi SpellBad ctermbg=Red guibg=Black
set spell spelllang=en_us
set nospell

"does something idk
set lazyredraw

"autocomplete in command mode by pressing TAB
set wildmenu
