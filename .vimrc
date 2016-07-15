let mapleader=","
set encoding=utf-8
" Vundle Config Setting
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'https://github.com/davidhalter/jedi-vim.git'
":help jedi-vimo

Plugin 'https://github.com/scrooloose/nerdtree.git'
":help NERD_tree.txt

Plugin 'majutsushi/tagbar'
":help tagbar
"

Plugin 'scrooloose/syntastic'

"Plugin 'https://github.com/evgenyzinoviev/vim-vendetta.git'
"Plugin 'https://github.com/Haron-Prime/Antares.git'
"Plugin 'https://github.com/brafales/vim-desert256.git'
"Plugin 'christophermca/meta5'

"Plugin 'https://github.com/klen/python-mode.git'

Plugin 'bling/vim-airline'

Plugin 'wesQ3/vim-windowswap'
" Swap windows with <leader>ww

Plugin 'elzr/vim-json'
" JSON Syntax hilighter

Plugin 'XadillaX/json-formatter.vim'
" JSON Formatter

Plugin 'nanotech/jellybeans.vim'
" Colorscheme


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
set background=dark
color jellybeans
"color desert256
"colorscheme solarized

" ===========================
" Folding Options
" ===========================
autocmd FileType xml set foldmethod=syntax 
autocmd FileType json set foldmethod=syntax 
set foldlevelstart=2
let json_syntax_folding=3     " XML
let xml_syntax_folding=1      " XML
let xsd_syntax_folding=1      " XSD
" These autocommands prevent the folding from happening when you open a file
autocmd Syntax c,cpp,vim,xml,html,xhtml,json setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,python,node,json normal zR

set tabstop=4
set et
set autoindent

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Enable Airline font symbols
let g:airline_powerline_fonts = 1

"Syntastic Syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

"
" Enable airline
set laststatus=2


" Tagbar mapping
nmap <F8> :TagbarToggle<CR>
autocmd FileType python call SetPythonOptions()
function! SetPythonOptions()
    :call tagbar#autoopen(0)
endfunction

" ======================================
"  Open TagfBar by default for js files
" ======================================
autocmd BufEnter *.js nested TagbarOpen



" NERDTree Key Mapping
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Color json
"au BufRead,BufNewFile *.json setf json
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
autocmd!   
autocmd FileType json set autoindent   
autocmd FileType json set formatoptions=tcq2l   
autocmd FileType json set textwidth=78 shiftwidth=2   
autocmd FileType json set softtabstop=2 tabstop=4   
autocmd FileType json set expandtab   
augroup END

function! FeedVisualCmd(cmdpat)
    let [qr, qt] = [getreg('"'), getregtype('"')]
    silent norm! gvy
    let cmd = printf(a:cmdpat, shellescape(@"))
    call setreg('"', qr, qt)
    echo system(cmd)
    if v:shell_error
        echohl ErrorMsg | echom 'Failed to run ' . cmd | echohl NONE
    endif
endfunction

" =====================================
"  80 Column and 120 Column Warnings
" =====================================
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")
"
" ========================================
"  Clean up trailing white spaces on save
" ========================================
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Automatically cleanup trailing white space on save
" Python and js only
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
