" Dean's generic no 3rd-party plugin .vimrc
" Generally use this to set up terminal-only machines

" Sets how many lines of history VIM remembers
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" auto read when file is changed externally
set autoread
au FocusGained,BufEnter * checktime

" set min number of lines above/below cursor on screen
set so=3

" allow tab completing menu
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.DS_Store

" always show current position
set ruler

" hide buffer when abandoned
set hid

" ignore case while searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" don't redraw when executing macros
set lazyredraw

" enable regular expressions
set magic

" show matching brackets
set showmatch
set mat=2

" remove annoying error sounds
set noerrorbells
set visualbell
set t_vb=

" enable syntax highlighting
syntax on

" turn on line numbering
set number

" tab preferences
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" set maximum line length before break
set lbr
set tw=160

" auto indentation
set autoindent
set smartindent
set wrap

" allow mouse scroll in normal mode
set mouse=n

" set colorscheme
colorscheme desert
