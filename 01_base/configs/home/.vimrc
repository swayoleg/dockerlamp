set nocompatible
filetype plugin indent on
if &t_Co > 2 || has("gui_running")
syntax on
set hlsearch
endif
set number
set backspace=indent,eol,start
set autowrite
set confirm
set wildchar=<Tab>
set wildmenu
set wildmode=longest:full,full
set ls=2            " allways show status line
set expandtab       " input spaces instead of real tabs
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set modeline
colorscheme desert
set list
set listchars=nbsp:¬,tab:»·,trail:·,extends:…
