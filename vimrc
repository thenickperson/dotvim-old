"""""""""""""""""""""""""""""""""
" # PATHOGEN
"""""""""""""""""""""""""""""""""

let g:pathogen_disabled = []

" disable command-t for non-os x systems for the time being
if !has('mac')
	let g:pathogen_disabled += ['command-t']
endif

" snipmate makes backspace do weird shit
" autoclose sucks and is broken, too
let g:pathogen_disabled += ['closepairs', 'delimitmate', 'snipmate', 'autoclose', 'closetag-vim', 'supertab']

" pathogen magic
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""
" # GENERAL
"""""""""""""""""""""""""""""""""

" Automatically load changed files
set autoread

" Auto-reload vimrc
autocmd! bufwritepost vimrc source ~/.vim/vimrc
" autocmd! bufwritepost gvimrc source ~/.vim/gvimrc

" reset leader (default \)
let mapleader=","

" Scrolling. Text selection.
set mouse=a

" We don't like vi
set nocompatible

" Set encoding
set encoding=utf-8

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backupf

"""""""""""""""""""""""""""""""""
" # UI
"""""""""""""""""""""""""""""""""

" Line numbers
set number

" Always show current position
set ruler

" Highlight current line
set cursorline

" Highlight search matches
set hlsearch
" Act like search in modern web browsers
set incsearch
" Ignore case when searching
set ignorecase
set smartcase

" Turn on magic for regexes
set magic

" Show matching braces when text indicator is over them
" set showmatch

" Be able to arrow key and backspace across newlines
set whichwrap=bs<>[]

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*.eot,*.svg,*.ttf,*.woff,*.jpg,*.png,*.gif,*.swp,*.psd

" Status bar
set laststatus=2

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" Remember last location in file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal g'\"" | endif
endi

" Show (partial) command in the status line
set showcmd

"""""""""""""""""""""""""""""""""
" # COLORS/FONTS
"""""""""""""""""""""""""""""""""

" Syntax highlighting!
syntax on
syntax enable

" Font
set gfn=Tamsyn\ 8

" Colorscheme
colorscheme molokai

"""""""""""""""""""""""""""""""""
" # TEXT, TABS, INDENTATION, ETC.
"""""""""""""""""""""""""""""""""

" Whitespace stuff
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab

" Custom options
	"set cpoptions+=n
	"set foldmethod=indent
	"set foldlevel=99

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" More auto indentation/tab magic
" set shiftround
" set copyindent
set smarttab
set autoindent
set smartindent

"""""""""""""""""""""""""""""""""
" # LANGUAGES/FILETYPES
"""""""""""""""""""""""""""""""""

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

if has("autocmd")
	" language-specific general settings

	" run file
	autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR>
	" check syntax
	autocmd FileType php noremap <C-L> :w!<CR>:!php -l %<CR>
endif

"""""""""""""""""""""""""""""""""
" # SHORTCUTS/MAPPINGS
"""""""""""""""""""""""""""""""""

" Enter vim commands without having to press shift
nnoremap ; :

" Typing ;; quickly exits insert mode
imap ;; <Esc>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" NERDCommenter
map <Leader>/ <plug>NERDCommenterToggle

" Remap help to clearing the search highlight
map <F1> :nohl<CR>
imap <F1> <ESC>:nohl<CR> i

" Delete line with CTRL-K
map  <C-K>      dd
imap <C-K>      <C-O>dd

" Format the current paragraph according to
" the current 'textwidth' with CTRL-J:
nmap <C-J>      gqap
vmap <C-J>      gq
imap <C-J>      <C-O>gqap

" Tabs
map <Leader>tp :tabp<CR>
map <Leader>tn :tabnext<CR>

" Bash-like home/end key mappings
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" gist-vim defaults
if has("mac")
	let g:gist_clip_command = 'pbcopy'
elseif has("unix")
	let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

"""""""""""""""""""""""""""""""""
" # GUI STUFF
"""""""""""""""""""""""""""""""""

" Use modeline overrides at the top of files if present
set modeline
" Only look at this number of lines for modeline
set modelines=10

set t_Co=256
if has("gui_running") || $TERM=="xterm-256color"
	set t_Co=256
	set guioptions-=T
else
	"Had to do this in order to continue to allow syntax highlighting on non-
	"xterm-256color and non-GUI vims. On OS X, the entire file flashes
	"if this is not set.
	set t_Co=256
endif

"""""""""""""""""""""""""""""""""
" # LOCAL VIM CONFIG
"""""""""""""""""""""""""""""""""

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
