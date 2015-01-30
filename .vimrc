filetype on
filetype plugin indent on " required for vundle
set nocompatible
set rtp+=~/.vim/vundle/
call vundle#rc()

" github bundles:
" Bundle 'sontek/minibufexpl.vim'
Bundle 'msanders/snipmate.vim'

"Git wrapper
Bundle 'tpope/vim-fugitive'

"automatic => alignment etc.
Bundle 'godlygeek/tabular'

"Salt formatting
Bundle 'saltstack/salt-vim'

"Visualize vim undo tree
Bundle 'sjl/gundo.vim'

"syntax feedback while editting files
Bundle 'scrooloose/syntastic'
" vim-scripts repo
Bundle 'altercation/vim-colors-solarized'
Bundle 'pep8'
" Bundle 'Puppet-Syntax-Highlighting'

" set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
    \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
    \ nmap <F8> :!rspec --color %<CR>

syntax on
set background=dark
" colorscheme solarized
set t_Co=256
set tabstop=2 " tab inserts 2 spaces
set shiftwidth=2 " indent level is 2 spaces wide
set softtabstop=2 " BS over an autoindent deletes both spaces
set expandtab
set smarttab
set autoindent
set cindent
set shiftround
set number " display line numbers
" set textwidth=80 " lines are wrapped after 80 columns
set wrap
" mapping for toggling line numbers
nmap <leader>n :set invnumber<CR>
set showmode
set ignorecase
set smartcase
" set nohlsearch
set nobackup
set noswapfile
" set cursorline " have a line indicate the cursor location
set ruler
set scrolloff=3 " keep 3 context lines above and below the cursor

" code folding
set foldmethod=indent
set foldlevel=99
" typing behavior
set backspace=indent,eol,start
set showmatch
" show invisibles
" toggle between showing and hiding invisible chars
nmap <leader>l :set list!<CR>
" customize the symbols used for invisible chars
set listchars=tab:▸\ ,trail:_,eol:¬,extends:>,precedes:<
" set list
" status line
set statusline=%F%m%r%h%w%=\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v]\ [%p%%]\ [len=%L]
set laststatus=2

" turn off auto adding comments on next line
" set fo=tcq
" set modeline

hi Search cterm=none ctermfg=black ctermbg=white
hi StatusLine cterm=none ctermfg=grey ctermbg=none

" style guide checker
let g:pep8_map='<leader>8'

function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction

" Toggle syntax setting
map <F6> :execute ToggleSyntax()<CR>

" sudo write
cmap w!! w !sudo tee % >/dev/null

" load Gundo
map <leader>g :GundoToggle<CR>
