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


![vim-setup](/assets/fzf_vim.png)

## Simple .vimrc 

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

## Add Plugins

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
Plug 'psf/black', {'branch':'stable'}
Plug 'sbdchd/neoformat'
Plug 'navarasu/onedark.nvim'
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

## OneDark Theme 

First, install onedark theme using vimplug 

```bash 
" Using Vim-Plug
Plug 'navarasu/onedark.nvim'
```

Update the ~/.vimrc 

```txt
let g:onedark_config = {
  \ 'style': 'deep',
  \ 'toggle_style_key': '<leader>ts',
  \ 'ending_tildes': v:true,
  \ 'diagnostics': {
    \ 'darker': v:false,
    \ 'background': v:false,
  \ },
\ }
colorscheme onedark
```

Second copy the theme into vim manually 


```bash 
https://github.com/joshdick/onedark.vim
copy -r onedark.vim/colors/ ~/.vim/colors/ 
copy -r autoload/onedark.vim ~/.vim/autoload 
```

## Mount Volume EC2 

list device

```bash
lsblk
```

look at the volume of ec2 in aws console as below picture

![volume-on-ec2](/assets/volume.png)

run this command to check an file system already exist on the device and parition or not

```bash
sudo file -s /dev/sdf1
```

if an file system already exist, let create a new directory

```bash
sudo mkdir /data
```

then mount

```bash
sudo mount /dev/sdf1 /data
```

configure auto mount on startup

```bash
sudo cp /etc/fstab /etc/fstab.orig
```

check the UUID

```bash
sudo blkid
```

take note the UUID

```bash
f33e7d3b-6786-4f40-875a-90f0f7e6b9a8
```

update the /etc/fstab file by appending this line to the end

```bash
UUID=aebf131c-6957-451e-8d34-ec978d9581ae  /data  xfs  defaults,nofail  0  2
```

verify that mount working

```bash
sudo umount /data
sudo mount -a
```

## Modify Volume

- Grow parition  
- Extend file system 

First grow parition 

```bash 
sudo growpart /dev/nvme0n1 1
```

Then extend file system and the command depends on type of file system 

```bash 
sudo resize2fs /dev/nvme0n1p1
```

## Basic Command 

For web development, we can run a webserver (nextjs) on ec2 and use portforwarding so local machine can access i 

````bash 
ssh -L 3000:localhost:3000 ec2-user@cloud9
````

## Reference

- [amazon linux 2 repository](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/add-repositories.html)

- [amazon linux 2023 repository](https://docs.aws.amazon.com/linux/al2023/release-notes/all-packages-AL2023.1-2023.1.20230719.html)

- [netrw command](https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/)

- [onedark theme](https://github.com/joshdick/onedark.vim)

- [onedark theme](https://github.com/navarasu/onedark.nvim)

- [resize volumn and extend file system](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recognize-expanded-volume-linux.html)
