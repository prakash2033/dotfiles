"-------- Settings {{{
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set relativenumber
set ignorecase
set smartcase
set incsearch
set hlsearch
set ruler
set cursorline
set laststatus=2 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set clipboard^=unnamed,unnamedplus
set encoding=utf-8
set fileencoding=utf-8 
set shortmess+=I
set backspace=indent,eol,start
set hidden
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
" Show invisible characters
set list

" Define how they look
set listchars=tab:→\ ,space:·,trail:·
"}}}

" -------- Install vim plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif"}}}

"-------- Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/suan/vim-instant-markdown', {'for': 'markdown'} " Install nodejs mini server by running  npm -g install instant-markdown-d
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'ghifarit53/tokyonight-vim'
Plug 'https://github.com/tomasiser/vim-code-dark.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git'
Plug 'https://github.com/sirver/UltiSnips'               " snippet program only, no code snippet provided
Plug 'https://github.com/honza/vim-snippets'             " code snippet of many programming language
Plug 'https://github.com/tpope/vim-surround'             " Help surround with :h
Plug 'https://github.com/scrooloose/nerdtree'            " File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Git
Plug 'https://github.com/airblade/vim-gitgutter'         " Git gutter
Plug 'https://github.com/tpope/vim-fugitive'             " Git interface
Plug 'https://github.com/tpope/vim-rhubarb'              " Enable GBrowse from fugitive for GitHub
Plug 'https://github.com/junegunn/gv.vim'                " TIG like navigation for vim
Plug 'https://github.com/xuyuanp/nerdtree-git-plugin'    " Show status of files in NerdTree
Plug 'https://github.com/tveskag/nvim-blame-line'        " Add git blame on line
Plug 'https://github.com/jasonccox/vim-wayland-clipboard'" To enable yank to clipboard in ubuntu 24.04
call plug#end()
"}}}

"-------- Folding {{{
"------------------------------------------------------
" za - open and close fold, zR - open all, zM - close all, zF - create fold
" enable folding; http://vim.wikia.com/wiki/Folding
set foldmethod=marker

" fold color
hi Folded cterm=bold ctermfg=DarkBlue ctermbg=none
hi FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none

"refocus folds; close any other fold except the one that you are on
nnoremap ,z zMzvzz

"}}}

"-------- Keybindings {{{
" Default vim leader \
let mapleader=" "
let maplocalleader=" "

" Use a blinking bar cursor in insert mode and a blinking block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"  " blinking bar in insert mode
let &t_EI = "\e[1 q"  " blinking block in normal/other modes

" toggle relative numbering
nnoremap <C-n> :set rnu! <bar> set nu!<CR>

" Move thru word wrapped line 
nnoremap k gk
nnoremap j gj

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" " Remove newbie crutches in Insert Mode
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
" inoremap <Up> <Nop>
"
" " Remove newbie crutches in Normal Mode
" nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
" nnoremap <Up> <Nop>
"
" " Remove newbie crutches in Visual Mode
" vnoremap <Down> <Nop>
" vnoremap <Left> <Nop>
" vnoremap <Right> <Nop>
" vnoremap <Up> <Nop>

" NerdTree keybinding - I for showing dotfiles in nerd tree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" " Delete without yanking to clipboard
" nnoremap d "_d
" vnoremap d "_d
" nnoremap D "_D
" vnoremap D "_D
"
" " Change/Substitute without yanking to clipboard
" nnoremap c "_c
" vnoremap c "_c
" nnoremap s "_s
" vnoremap s "_s

" Optional: Keep 'x' (delete char) from affecting clipboard
nnoremap x "_x
vnoremap x "_x

nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Git<Cr>

"}}}

"-------- Vim Fzf{{{
let g:fzf_action = { 'enter': 'tab split' }
let g:fzf_layout = { 'down': '20%' }

"}}}

"-------- vimwiki - Personal Wiki for Vim (Markdown Supported) {{{
"------------------------------------------------------
" https://github.com/vimwiki/vimwiki
set nocompatible
filetype plugin on
syntax on

" enable markdown in vimwiki
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" helppage -> :h vimwiki-syntax
"}}}

"-------- vim-instant-markdown - Instant Markdown previews from Vim {{{
"------------------------------------------------------
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart

" start instant markdown preview manually
map <leader>md :InstantMarkdownPreview<CR>

"}}}

" -------- Gruvbox Theme {{{

syntax enable
set background=dark
let g:gruvbox_contrast_dark = 'medium'
" colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
"}}}

"-------- TokyoNight Theme {{{
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

"}}}

"-------- NerdTree {{{
" Exit Vim if NERDTree is the only window remaining in the only tab.
" Shift + I to show dotfiles
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"}}}

"-------- Auto Open at last position{{{
augroup restore_cursor
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif
augroup END
"}}}

"-------- Auto source vimrc {{{
"------------------------------------------------------
" watch for changes then auto source vimrc
" http://stackoverflow.com/a/2403926
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"}}}
