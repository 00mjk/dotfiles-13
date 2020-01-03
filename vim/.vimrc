"Remember to do ':source %' after updating ~/.vimrc
runtime! archlinux.vim

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Allow copy and pasting automatically
set clipboard=unnamedplus

" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

" Declare the list of plugins
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-sensible'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
"Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'junegunn/seoul256.vim'

" autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
" List ends here. Plugins become visible to Vim after this call
call plug#end()

" Set nocompatible
    set nocompatible
" Set vim colorscheme 
" seoul256 (dark) 
" Range: 233 (darkest) ~ 239 (Lightest)
" Default: 237
    let g:seoul256_background=235
    set t_Co=256
    colorscheme seoul256
    set background=dark

" Some basics:
    set encoding=utf-8	
" Toggle line numbers
    set number
" Toggle relative line numbers
"   set relativenumber
" Indentation settings
    filetype plugin indent on
    set autoindent             " Indent according to previous line.
    set expandtab              " Use spaces instead of tabs.
    set softtabstop =4         " Tab key indents by 4 spaces.
    set shiftwidth  =4         " >> indents by 4 spaces.
    set shiftround             " >> indents to next multiple of 'shiftwidth'.
" Run xrdb wheneber Xdefaults or Xresources are updated:
    autocmd BufWritePost ~/.Xresouces, ~/.Xdefaults !xrdb %
" Enable syntax highlighting
    syntax on
" Enable mouse use for all modes
    set mouse=a
"
" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
    set shell=/bin/bash
endif
