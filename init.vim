" +++ Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'JamshedVesuna/vim-markdown-preview' 
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'djoshea/vim-autoread'
Plug '907th/vim-auto-save'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
call plug#end()

" General Setting

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup      " Do not backup the file
set nowritebackup " Do not create a backup file when overriding
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50    " Set the no of commands stored in history
set ruler         " Show the cursor position all the time
set showcmd       " Display incomplete commands
set incsearch     " Do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set visualbell    " Set visualbell for errors
set noerrorbells  " No error bells

syntax on

filetype plugin indent on

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set encoding=utf-8
set autoread

" Display Settings
set t_Co=256
colorscheme vividchalk
set listchars=tab:\.\ ,trail:·
set list
set number
set showcmd
set showmode
set splitright
set splitbelow
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set lazyredraw

" Lines & Columns
set cursorline
set softtabstop=2
set autoindent
set smartindent

let g:auto_save = 1

" Global Keymaps"
map! jj <esc>

" Git vim-fugitive
map <leader>gst :Gstatus<cr>
map <leader>ga :Git add -A .<cr>
map <leader>gp :Gpush<cr>
map <leader>gca :Gcommit -a -v<cr>

" Markdown vim-markdown-preview 
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_hotkey='<C-M>'

source $HOME/.config/nvim/colors/vividchalk.vim

" Fuzzy File Finder CtrlP
let g:ctrlp_max_height = 10
let g:ctrlp_mruf_max = 500

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_cmd = 'CtrlP'

map <c-b> :CtrlPBuffer <cr>
map <c-d> :CtrlPBufTag <cr>

let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_max_depth = 40 
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
let g:ctrlp_use_caching = 0
let g:ctrlp_open_new_file = 'et'

map <leader>p :ClearCtrlPCache<cr>:CtrlP<enter>

" Autocomplete deoplete 
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['member', 'tag']
let g:deoplete#max_list = 30
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'var', 'type', 'const']

" use <tab> to select the autocomplete options 
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd CompleteDone * pclose!

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
  "
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  
  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR> :cw <CR>
