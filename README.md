---
title: Basic Vim
description: basic vim setup and amazon linux setup
author: haimtran
publishedDate: 30/09/2022
date: 30/09/2022
---

## Introduction

- basic vimrc without plugins
- setup vim plug
- setup lsp (coc-vim)
- amazon linux repository

## Basic Vim

basic setup

```vim
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
set signcolumn=yes
```

stop auto adding prefix from previous line

```vim
autocmd BufEnter * set formatoptions-=cro
autocmd BufEnter * setlocal formatoptions-=cro
```

highlight syntax on

```vim
set re=0
syntax on
```

delays and poor user experience.

```vim
set updatetime=300
```

## Basic Netrw

setup netrw size

```vim
let g:netrw_liststyle= 3
let g:netrw_winsize=30
```

explore

```vim
map <leader>sf : Lexplore<CR>
```

search files

```vim
search files
set nocompatible
set path+=**
set wildmenu
```

## Basic Map

basic map

```vim
let mapleader = ","
imap jj <ESC>A
inoremap ii <ESC>
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sv <C-w>v
nnoremap ss <C-w>s
nnoremap sc <C-w>c
```

copy clipboard

```vim
vnoremap <leader>y "+y
```

## Basic Plugins

first we need to install vim plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

use vimplug to install some plugins

```vim
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'rakr/vim-one'
call plug#end()

```

## Simple Theme

colorscheme and modification

```vim
let g:airline_theme='one'
colorscheme one
set background=dark
:highlight Normal ctermbg=236
:highlight clear LineNr
:highlight clear SignColumn
:highlight clear CursorLineNr
:highlight clear VertSplit
:highlight StatusLine cterm=reverse term=reverse ctermfg=59
```

paste from clipboard inside tmux

```vim
if &term =~ "screen"
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  exec "set t_PS=\e[200~"
  exec "set t_PE=\e[201~"
endif
```

modify cursorline

```vim
cursorline
set number
hi CursorLineNr cterm=None
set cursorline
hi CursorLine cterm=None ctermbg=238 guibg=Grey40
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeout
set ttimeoutlen=1
set ttyfast
```

## Coc-Vim

coc highlight

```vim
:highlight CocHighlightText  ctermfg='white'
:highlight CocFloating ctermbg='white' ctermfg='black'
:highlight CocMenuSel ctermbg=7
:highlight Visual ctermbg=59
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.5, 'yoffset': 1}}

```

coc install language server

```bash
:CocInstall coc-pyright
```

configure fix on save prettier

```bash
:CocConfig
```

and add to the coc-setting.json

```json
{
  "coc.preferences.formatOnSaveFiletypes": [
    "css",
    "markdown",
    "typescript",
    "javascript",
    "json",
    "python"
  ],
  "python.pythonPath": "/usr/bin/python3"
}
```

## Captures

Netrw and search files

<img width="1435" alt="Screen Shot 2022-09-30 at 16 30 42" src="https://user-images.githubusercontent.com/20411077/193240365-9c905c4a-4c5d-4d5a-a011-ed63987a6a9c.png">

## Tmux

hide and show status bar

```bash
:set -g status off
:set -g status on
```

new session

```bash
:new-session
```

kill session

```bash
:kill-session(#session number)
```

vim show path of an openning file

```bash
1 and ctr+g
```

## Basic Vim

1. Insert a new line after each command.

find and replace

```bash
:s/,/,\r/g

```

find and replace in entire file

```bash
:%s/foo/bar/g
```

search command

```bash
/[(,)]
```

then insert a new line after each command

```bash
:s//\r&/g
```

2. yank a range of line

```bash
:1,10yank
```

3. delete a range of line

```bash
:1,10d
```

4. delete blank lines

```bash
:g/^$s/d
```

or

```bash
:g/<pattern>/d
```

## Reference

- [amazon linux 2 repository](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/add-repositories.html)

- [amazon linux 2023 repository](https://docs.aws.amazon.com/linux/al2023/release-notes/all-packages-AL2023.1-2023.1.20230719.html)
