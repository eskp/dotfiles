syntax on

filetype plugin indent on

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set nowrap
set autoindent
"set nu
set showmode
set showmatch
set ignorecase
set smartcase
set nohlsearch
"set incsearch
set nobackup
set noswapfile

"allow backspace over everything in insert mode
set backspace=indent,eol,start

set list listchars=tab:>_,trail:_,extends:>

hi Comment      cterm=none      ctermfg=darkgreen
hi Search       cterm=none      ctermfg=black ctermbg=white
hi StatusLine   cterm=none      ctermfg=grey ctermbg=none
hi SpecialKey   cterm=none      ctermfg=grey  ctermbg=none

set statusline=%F%m%r%h%w%=\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v]\ [%p%%]\ [len=%L]
set laststatus=2

"re-source .vimrc
map <F5> :source $HOME/.vimrc<CR>

function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction

"Toggle syntax setting
map <F6> :execute ToggleSyntax()<CR>
