" tab width
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set cindent
set autoindent
set smartindent
set mouse=a
set hlsearch
set showcmd
set title
set expandtab
set incsearch

" line number
set number
hi CursorLineNr cterm=None

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=23  guibg=Grey40

" change cursor between modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" netrw wsize
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_winsize=30
map <C-a> : Lexplore<CR>

" per default, netrw leaves unmodified buffers open.  This autocommand
" deletes netrw's buffer once it's hidden (using ':q;, for example)
autocmd FileType netrw setl bufhidden=delete  " or use :qa!

" these next three lines are for the fuzzy search:
set nocompatible      "Limit search to your project
set path+=**          "Search all subdirectories and recursively
set wildmenu          "Shows multiple matches on one line

" highlight syntax
set re=0
syntax on

" colorscheme 
colorscheme desert

