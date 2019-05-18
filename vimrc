" vim: fdm=marker foldlevel=0 foldenable sw=4 ts=4 sts=4
filetype plugin indent on               "
set nocompatible

" {{{ Plugins installed

call plug#begin()
	"Plug 'vim-airline/vim-airline'			"Nice statusline at the bottom of each window
	"Plug 'vim-airline/vim-airline-themes'		"Themes for airline
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/fzf'
	"Plug 'valloric/youcompleteme'
	Plug 'davidhalter/jedi-vim'
	Plug 'itchyny/lightline.vim'
	Plug 'w0rp/ale'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'luochen1990/rainbow'			
	Plug 'airblade/vim-gitgutter'
	Plug 'yggdroot/indentline'
	Plug 'kshenoy/vim-signature'		"Place toggle and display marks
	Plug 'scrooloose/nerdtree'			"Vim nerdtree. File system explorer
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'	"Adds syntax for nerdtree 
	Plug 'ryanoasis/vim-devicons'			"Add icons to plugins
	"Plug 'jreybert/vimagit'			"Git workflow
	Plug 'severin-lemaignan/vim-minimap'		"Code minimap for vim
	Plug 'vimwiki/vimwiki'				"Personal wiki for vim
	"Plug 'tpope/vim-surround'			"Easy delete, change or add surroundings
	Plug 'flazz/vim-colorschemes'			"A variety of colorschemes for vim
call plug#end()

" }}}

"############################## {{{ Visual Helpers

" Lightline. Minimalist status bar (like airline)

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" A.L.E: Async linter
" Sets ALE to use only flake8 and eslint (not jshintj)
let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint', 'prettier'],
\   'js': ['eslint', 'prettier'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['isort'],
\}

" Rainbow Parentheses
let g:rainbow_active = 0
let g:rainbow_conf = {
\    'guifgs': ['#458588', '#b16286', '#cc241d', '#d65d0e', '#458588', '#b16286', '#cc241d', '#d65d0e', '#458588', '#b16286', '#cc241d', '#d65d0e', '#458588', '#b16286', '#cc241d', '#d65d0e'],
\    'ctermfgs': [ 'brown', 'blue', 'gray', 'green', 'cyan', 'red', 'magenta', 'brown', 'gray', 'black', 'magenta', 'blue', 'green', 'cyan', 'red'],
\    'operators': '_,_',
\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\    'separately': {
\        '*': {},
\        'tex': {
\            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\        },
\        'javascript': {
\            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'],
\        },
\        'vim': {
\            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\        },
\        'jinja': {
\            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\        },
\        'css': 0,
\    }
\}

" IndentLine : Adds marks for identation
"
let g:indentLine_char = '¦'
let g:indentLine_color_term = '236'
let g:indentLine_color_gui = '#363636'
let g:indentLine_noConcealCursor=1
" }}}

"############################## Autocomplete and Snippets {{{
if has('nvim')
" YouCompleteMe  Autocomplete for vim
"	let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"	let g:ycm_autoclose_preview_window_after_completion = 1
"	let g:ycm_seed_identifiers_with_syntax = 1
"	let g:ycm_collect_identifiers_from_tags_files = 1
"  	let g:ycm_key_invoke_completion = '<c-j>'
"  	let g:ycm_complete_in_strings = 1

" Jedi-Vim Autocomplete for python
  let g:jedi#completions_enabled = 0
  let g:jedi#show_call_signatures = 2
endif

" AutoPairs Automatically adds pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`', }

" }}}

"############################## Search {{{

" fzf Fuzzy search

" }}}

"############################## General {{{
"Surround Surrouding tags

" Commentary  Makes comments easy

"Nerdtree File system
map <C-n> :NERDTreeToggle<CR>
" }}}

" {{{ Leader shortcuts
let mapleader=","						"leader is comma

" }}}

" {{{ Colors setttings

colorscheme dracula			"Choose colorscheme
" set nocompatible			"
syntax enable				"Enable syntax processing		
"syntax on					"Turn on syntax highlighting

" }}}

" {{{ Space and tabs

set tabstop=4				"Number of visual spaces per tab
set softtabstop=4			"Number of spaces in tab when editing
set shiftwidth=4			"Next line after { will automatically be indented
set smarttab				"Be smart when using tabs. Use shiftwidth instead of tabstop

" }}}

" {{{ UI settings

set foldcolumn=1			"Add a bit extra margin to the left
set laststatus=2			"Always show the status line 
set visualbell				"Blink cursor on error instead of beeping
set ruler				"Show file stats
set cmdheight=2			"Height of command bar
set number					"show line numbers
set showcmd					"show inserted commands at bottom bar
set ruler
set cursorline				"highlight current line
" set showmode				"Show current mode down the botton *already on lightline
filetype indent on			"Turns on filetype detection
set showmatch				"Show matching [{()}] when text indicator is over then
set scrolloff=5				"Let 5 lines before scrolling

if !has('gui_running')
  set t_Co=256
endif

" }}}

" {{{ Searching

set ignorecase				"Ignore case when searching
set smartcase				"When searching try to be smart about cases
set hlsearch				"Highlight search results
set incsearch				"search as characteres are entered
"turn off search highlight using ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" }}}

" {{{ Folding

set foldcolumn=1
set foldenable				"enable folding
set foldlevelstart=10		"open most folds by default
set foldnestmax=10			"10 nested fold max
set foldmethod=indent		"fold bases on indent level
"space open/closes folds
nnoremap <space> za

" }}}

" {{{ Movement

" Disable arrow keys normal 
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"Disable arrow keys in Insert mode
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

"move vertically by visual line.
nnoremap j gj
nnoremap k gk

" gV highlights last inserted text in insert mode
nnoremap gV `[v`]
" jk is escape
inoremap jk  <esc>
",u toggle gundo
nnoremap <leader>u :GundoToggle<CR>
"open ag.vim Silver Searcher plugin
nnoremap <leader>a :Ag

" }}}

" {{{ Backups

" Move backups to /tmp folder
" set backup
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set backupskip=/tmp/*,/private/tmp/*
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set writebackup

" No backups
set nobackup
set nowritebackup

" }}}

" {{{ General

set encoding=utf8			"Set utf8 as standard encoding
set backspace=indent,eol,start		"Allow backspace in insert mode
set hidden				"Allow hidden buffers
" set magic				"For regular expressions turn magic on
set mat=2				"How many tenths of a second to blink when matching brackets
set history=500				"Sets how many lines of history VIM has to remember
set autoread				"Set to autoread when a file is changed from outside
" Toggle en spell
nnoremap <leader>en :setlocal spell! spelllang=en<CR>

" Toggle pt spell
nnoremap <leader>pt :setlocal spell! spelllang=pt<CR>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
" }}}
