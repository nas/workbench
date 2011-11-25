" set this first (avoid use of -N for vi compatibility)
set nocompatible

" use pathogen
call pathogen#infect()

" load the matchit plugin.
runtime macros/matchit.vim

" user comma for map leader
let mapleader = ","
let g:mapleader = ","

" textwidth and format options
set textwidth=72
set fo-=t

" 256 color scheme
set t_Co=256
if &t_Co >= 256 || has("gui_running")
  set background=dark
  colorscheme ir_black
endif

syntax on                         " turn on syntax highlighting.
filetype plugin indent on         " turn on file type detection.

set showcmd                       " display incomplete commands.
set showmode                      " display the mode you're in.

set backspace=indent,eol,start    " intuitive backspacing.

set hidden                        " handle multiple buffers better.

set wildmenu                      " enhanced command line completion.
set wildmode=list:longest         " complete files like a shell.

set ignorecase                    " case-insensitive searching.
set smartcase                     " but case-sensitive if expression contains a capital letter.

set number                        " show line numbers.
set ruler                         " show cursor position.

set incsearch                     " highlight matches as you type.
set hlsearch                      " highlight matches.

set autoindent                    " always set autoindenting on
set copyindent                    " copy the previous indentation on autoindenting

set nowrap                        " turn on line wrapping.
set scrolloff=3                   " show 3 lines of context around the cursor.

set title                         " set the terminal's title
set visualbell                    " no beeping.

set nobackup                      " don't make a backup before overwriting a file.
set nowritebackup                 " and again.
set directory=$HOME/.vim/tmp//,.  " keep swap files in one location

set softtabstop=2                 " soft tabs, ie. number of spaces for tab
set tabstop=2                     " global tab width.
set shiftwidth=2                  " and again, related.
set expandtab                     " use spaces instead of tabs
set smarttab                      " insert tabs on the start of a line according to shiftwidth, not
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'

"set synmaxcol=72                 " for speed, only syntax highlight the first 72 chars (ruby style guide)
set ttyfast                       " for speed and better rendering

" status line colors
hi User1 ctermbg=black ctermfg=green guibg=black guifg=green
hi User2 ctermbg=black ctermfg=red guibg=black guifg=red
hi User3 ctermbg=black ctermfg=yellow guibg=black  guifg=yellow

" status line
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline+=%1*
set statusline+=%3*
set statusline+=\ %{fugitive#statusline()} " Git info in red
set statusline+=\[%{&fo}] " Git info in red
set statusline+=%*

" folding
set foldmethod=syntax
set foldcolumn=4
set nofoldenable

" custom mappings
" Ctrl+t opens commandT
" F6 flushes commandT
" Ctrl+c toggles commenting
" Ctrl+f opens Ack
" F5 formats/tidies
nmap <silent> <C-t> :CommandT<CR>
nmap <silent> <F6> :CommandTFlush<CR>
map <C-c> <leader>c<Space>
map <C-F> :Ack
map <silent> <F5> mmgg=G'm
imap <silent> <F5> <Esc> mmgg=G'm

" commandT config
let g:CommandTMaxFiles=25000
let g:CommandTMaxDepth=15
let g:CommandTCancelMap='<C-x>'
set wildignore+=*.o,*.obj,.git,.svn,**/vendor/apache-ant-1.8.2/**,**/vendor/rails/**,**/vendor/bundle/**,**/tmp/cache/**

" fast saving
nmap <leader>w :w!<cr>

" fast edit and source vimrc
map <leader>v :sp ~/.vimrc<cr>       " \v opens ~/.vimrc in a split
map <leader>u :source ~/.vimrc<cr>   " \u sources ~/.vimrc

" fugitive git bindings
map <leader>gs :Gstatus<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiff<cr>
map <leader>gg :Ggrep<Space>
map <leader>ge :Gedit<cr>
map <leader>gl :Glog -250<cr><cr>:copen<cr><cr>
map <leader>gL :Glog -250 --<cr><cr>:copen<cr><cr>
map <leader>gc :Gcommit

" ruby
" runner (saves first)
map <leader>rr :w ! ruby<CR>
" rspec
map <leader>rs :<C-U>!spec <c-r>=expand("%:p") <CR> -c -l <c-r>=line(".") <CR> <CR>

" buffers
nnoremap <tab> :bn<cr>
nnoremap <S-tab> :bp<cr>
nmap <leader>d :bd<cr>
nmap <leader>D :bufdo bd<cr>

" turn OFF arrow keys altogther
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>
nnoremap <Left>  <nop>
nnoremap <Right> <nop>

" custom syntax highlighting
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.as    set filetype=actionscript
au BufRead,BufNewFile *.mxml  set filetype=mxml

" auto strip whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

