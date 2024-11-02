---
title: basic setup vimrc and onedark
author: haimtran
date: 02/11/2024
---

## Setup 

Let create a vimrc file. 

```bash
cd ~ && mkdir .vim && touch vimrc 
```

Let update its content. 

```txt
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
```

Let install VimPlug. 


```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Let install onedark theme.

```bash
cd ~
https://github.com/joshdick/onedark.vim
cp -r onedark.vim/colors/ ~/.vim/colors/
cp -r autoload/onedark.vim ~/.vim/autoload
```

Let update vimrc with the newly installed onedark theme. 

```txt
colorscheme onedark
```
