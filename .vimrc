let mapleader=","
" Vundle Config Setting
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'https://github.com/davidhalter/jedi-vim.git'
":help jedi-vimo

Plugin 'https://github.com/scrooloose/nerdtree.git'
":help NERD_tree.txt

Plugin 'majutsushi/tagbar'
":help tagbar

"Plugin 'https://github.com/evgenyzinoviev/vim-vendetta.git'
"Plugin 'https://github.com/Haron-Prime/Antares.git'
Plugin 'https://github.com/brafales/vim-desert256.git'
"Plugin 'christophermca/meta5'

"Plugin 'https://github.com/klen/python-mode.git'

Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ===========================
" Ryan Personal config option
" ===========================
syntax on
set ruler
set nohlsearch
color desert
set background=dark
"colorscheme solarized


" Automatic XML Folding
set foldmethod=syntax
set foldlevelstart=1
let xml_syntax_folding=1      " XML

set tabstop=4
set et
set autoindent

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Enable Airline font symbols
let g:airline_powerline_fonts = 1

"
" Enable airline
set laststatus=2


" Tagbar mapping
nmap <F8> :TagbarToggle<CR>

" NERDTree Key Mapping
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Color json
au BufRead,BufNewFile *.json setf json
