set background=dark
set t_Co=256
colorscheme kellys
syntax on

set nocompatible
set rtp+=~/.vim/vundle/
call vundle#rc()

"github bundles:
"Bundle 'sontek/minibufexpl.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
"vim-scripts repo
Bundle 'pep8'
Bundle 'Puppet-Syntax-Highlighting'

filetype off                    "required for vundle
filetype plugin indent on       "required for vundle

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
"display line number and define a mapping for toggling
set number
nmap <leader>n :set invnumber<CR>
set showmode
set ignorecase
set smartcase
"set nohlsearch
set nobackup
set noswapfile

"code folding
set foldmethod=indent
set foldlevel=99
"formatting
"set textwidth=80
set nowrap
"typing behavior
set backspace=indent,eol,start
set showmatch
"show invisibles
"toggle between showing and hiding invisible chars
nmap <leader>l :set list!<CR>
"customize the symbols used for invisible chars
set listchars=tab:▸\ ,trail:_,eol:¬,extends:>,precedes:<
"status line
set statusline=%F%m%r%h%w%=\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v]\ [%p%%]\ [len=%L]
set laststatus=2


hi Search cterm=none ctermfg=black ctermbg=white
hi StatusLine cterm=none ctermfg=grey ctermbg=none

"style guide checker
let g:pep8_map='<leader>8'

function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction

"Toggle syntax setting
map <F6> :execute ToggleSyntax()<CR>
