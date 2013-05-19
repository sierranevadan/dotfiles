" This must be first, because it changes other options as side effect
set nocompatible
" change the leader to be a comma vs slash
let mapleader=","

" Use an interactive shell
"set shellcmdflag=-ic

" Load plugins from ~/.vim
" `filetype off` bug may be fixed.
"filetype off
execute pathogen#infect()
filetype plugin indent on

syntax on
set background=dark
set t_Co=256 " 256 colors
" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set modeline  " Allow vim options embedded in files
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set wildignore=*.swp,*.bak,*.pyc,*.class
set switchbuf=useopen
" allow unsaved background buffers
"set hidden
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set showcmd
set showmode
set title
" status line: %-<number> sets min width
" %f <filename> (filetype)
" %m <modified flag>
" %n <buffer number>
" fugitive#statusline displays any git info
" %= <left-right split>
" %B <hex value under cursor> 
" %l <line number>, %c <column number>, %V <virtual column number>
" %p <percentage through file (by lines)>
set statusline=%<%f\ (%{&ft})\ %-3(%m%)\ b#%n\ %{fugitive#statusline()}\ %=\ \ 0x%-8B\ %-10(%3l,%02c%03V%)\ [%p%%]

" I don't know if I like these
"set showtabline=2
"set cursorline
"set number
"set numberwidth=5
"set winwidth=79

" setup auto-backups
set backup
set backupdir=~/.vim_backups,~/.tmp,~/tmp,/var/tmp,/tmp
" Set swap file dir
set directory=/var/tmp,/tmp

" use ctrl+dir for window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Use jj to exit insert mode
inoremap jj <ESC>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>:noh<CR>

" Use ,, to unhighlight search
nmap <silent> <leader>, :noh<CR>

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Python lint and flakes
"
" Using just flake8
"autocmd BufWritePost *.py call Flake8()
"let g:flake8_max_line_length=99
" set max complexity: https://en.wikipedia.org/wiki/Cyclomatic_complexity
"let g:flake8_max_complexity=8

" Using syntastic
let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_python_flake8_args="--max-line-length=99 --max-complexity=8"
let g:syntastic_python_pylint_args="--max-line-length=99"
let g:syntastic_javascript_checkers=['jslint']
let g:syntastic_auto_loc_list=1

" Completion with SuperTab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
" Snippets
let g:snips_author="Grant Kelly"

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
"  
" Folding. Also use `zR` and `zM`
nnoremap <space> za
vnoremap <space> zf
set foldmethod=manual
set foldlevel=99  " disables folding by default
