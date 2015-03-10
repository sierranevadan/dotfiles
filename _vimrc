set nocompatible              " be iMproved, required
filetype off                  " required

let vundles_need_installed = 0
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let vundles_need_installed = 1
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"
" General vim plugins
"
Plugin 'tpope/vim-surround'  "surround text with things
Plugin 'tpope/vim-repeat'  "extends repeat functionality
Plugin 'ervandew/supertab'  "use tab for completion
Plugin 'bling/vim-airline'  "trendy status line
Plugin 'eapache/rainbow_parentheses.vim'  "color match parens
Plugin 'Raimondi/delimitMate'  "auto pair delimiters
Plugin 'jez/vim-superman'  "man pages in vim
"
" File navigation plugins
"
Plugin 'scrooloose/nerdtree'  "file browser window
Plugin 'kien/ctrlp.vim'  "fuzzy search filenames
Plugin 'mileszs/ack.vim'  "search in files (like grep)
"
" Git plugins
"
Plugin 'tpope/vim-fugitive'  "git commands in vim
Plugin 'tpope/vim-unimpaired'  "pairs of mappings e.g. in :Glog :cnext is ]q
Plugin 'airblade/vim-gitgutter'  "show git status in vim gutter
"
" Syntax checkers
Plugin 'scrooloose/syntastic'
"
" Go plugins
"
Plugin 'fatih/vim-go'
"
" HTML plugins
"
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'mustache/vim-mustache-handlebars' " support for .hbs templates
"
" Python plugins
"
Plugin 'klen/python-mode'
Plugin 'fs111/pydoc.vim'
"
" Ruby on rails plugin
"
Plugin 'tpope/vim-rails'  "rails shortcuts
"
" Clojure plugins
"
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Check if vundles need installed
if vundles_need_installed != 0
    echo "Installing plugins...."
    echo
    :PluginInstall
endif
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
" Put your non-Plugin stuff after this line

" change the leader to be a comma
let mapleader=","

" set ctrlp trigger to ",f"
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>:noh<CR>

" Use ,, to unhighlight search
nmap <silent> <leader>, :noh<CR>

" enable syntax highlighting
syntax on
set background=dark
" use 256 colors
set t_Co=256 " 256 colors
colorscheme gkelly
" shorten pause when leaving insert mode
set ttimeoutlen=50

" remember more commands and search history
set history=10000
" assume a fast terminal
set ttyfast
" Show matches to commands in status line
set wildmenu
set wildmode=longest:full,full
" Dont show listchars (newlines, tabs, etc.)
set nolist
" listchars toggle
nmap <leader>c :set list!<CR>
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59 ctermfg=236 ctermbg=NONE
highlight SpecialKey guifg=#4a4a59 ctermfg=236 ctermbg=NONE

" configure tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
" Allow vim options embedded in files
set modeline

" Always display a status line
set laststatus=2

" Set search options
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set wildignore=*.swp,*.bak,*.pyc,*.class
set switchbuf=useopen
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set showcmd
set showmode
set title " sends titlestring to terminal

" use ctrl+dir for window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" jk exits insert mode
inoremap jk <ESC>

" Make cursor stay put after yanking
 vmap y ygv<Esc>

" Configure backups
set backup
set backupdir=~/.vim_backups,~/.tmp,~/tmp,/var/tmp,/tmp
" Set swap file dir
set directory=/var/tmp,/tmp

" Folding. Also use `zR` and `zM`
nnoremap <space> za
vnoremap <space> zf
"set foldmethod=syntax
set foldlevel=99  " disables folding by default

" Don't separate words by a dash.
set iskeyword+=-

" enable auto imports in go
let g:go_fmt_command = "goimports"

"Pymode options
let g:pymod_run=1
let g:pymode_folding=1
let g:pymode_options=0
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_slow_sync=1
let g:pymode_trim_whitespaces=0
let g:pymode_lint=1
let g:pymode_doc=0
let g:pymode_rope=0
""If pymode_options is set to 1, pymode will enable the following options for python buffers:
"setlocal complete+=t
"setlocal formatoptions-=t
"setlocal nowrap
"setlocal textwidth=79
"setlocal commentstring=#%s
"setlocal define=^\s*\\(def\\\\|class\\)

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="gkelly" " requires file airline/themes/gkelly.vim
let g:airline_powerline_fonts = 1

"
" Buffer commands
"
" This allows buffers to be hidden if you've modified a buffer.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" paste from clipboard
nmap <leader>p "*p

" NERD Tree Toggle
nmap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']


" syntastic options
let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_flake8_args="--max-line-length=99 --max-complexity=8"
"let g:syntastic_python_pylint_args="--max-line-length=99"
let g:syntastic_javascript_checkers=['jshint']
"let g:syntastic_auto_loc_list=1
" symbols for Syntastic. These don't always seem to work...?
let g:syntastic_error_symbol = 'E▸'
let g:syntastic_warning_symbol = 'W▸'
let g:syntastic_style_error_symbol = 'e▸'
let g:syntastic_style_warning_symbol = 'w▸'


augroup vimrcEx
    au!
    " au BufWinLeave ?* mkview
    " au BufWinEnter ?* silent loadview
    " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal spell
augroup END

" customize delimitMate
augroup mydelimitMate
    au!
    let g:delimitMate_jump_expansion = 1
    au FileType * let b:delimitMate_expand_cr = 2
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
    au FileType vim let b:delimitMate_quotes = "'"
    au FileType eruby let b:delimitMate_matchpairs = '(:),[:],{:},<:>'
    au FileType eruby let b:delimitMate_quotes = "\" ' ` | %"
    au FileType eruby let b:delimitMate_expand_space = 1
augroup END

" treat json like javascript
au BufNewFile,BufRead *.json set ft=javascript

" treat templates like html
" au BufNewFile,BufRead *.hbs set filetype=html syntax=handlebars
" au BufNewFile,BufRead *.{mustache,handlebars,hbs}{,.erb} set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Rainbow Parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Auto open quickfix window after ANY grep command
autocmd QuickFixCmdPost *grep* cwindow

" Old status line for when airline isn't available
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

