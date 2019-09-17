set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" other unrequired plugins
Plugin 'tpope/vim-fugitive' " Git wrapper so awesome, it should be illegal
Plugin 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the 'gutter'
Plugin 'scrooloose/nerdcommenter' " Vim plugin for intensely orgasmic commenting
Plugin 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tmhedberg/SimpylFold'  
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'valloric/youcompleteme'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-signify'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree' " Very useful directory tree explorer inside vim
Plugin 'jistr/vim-nerdtree-tabs' 
Plugin 'davidhalter/jedi-vim' " Big python autocomplete library
Plugin 'sheerun/vim-polyglot' 
Plugin 'scrooloose/syntastic' " Checks for errors and warnings inside the code
Plugin 'tell-k/vim-autopep8' " Auto ident and pep8 for python files
Plugin 'skywind3000/asyncrun.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'cjrh/vim-conda' " Auto changes the conda env inside vim
Plugin 'heavenshell/vim-pydocstring'
Plugin 'jeetsukumaran/vim-pythonsense' 
Plugin 'tpope/vim-surround' " Plugin that facilitate the use of brackets in code
Plugin 'SirVer/ultisnips'   " Enable the use for prebuilt snippets in vim
Plugin 'honza/vim-snippets' " Package with some useful snippets
Plugin 'iamcco/markdown-preview.nvim'

Plugin 'joshdick/onedark.vim' " Colorscheme
Plugin 'biosyntax/biosyntax-vim' " Make it easier to read biological file formats


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" " Basic Setup
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Map leader to ,
let mapleader='\'

" Enable hidden buffers
set hidden

" Searching
set wrapscan   " search wrap around the end of the file
set ignorecase " ignore case search
set smartcase  " override 'ignorecase' if the search pattern contains upper case
set incsearch  " incremental search
set hlsearch   " highlight searched words
nohlsearch     " avoid highlighting when reloading vimrc

"" Directories for swp files
set nobackup
set noswapfile

set colorcolumn=80
" highlight ColorColumn ctermbg=6

" Visual config
set term=xterm-256color
set keywordprg=:Man
set laststatus=2
set nocompatible
set number
set showmatch
set splitright
set guicursor=

if (has("termguicolors"))
    set termguicolors
endif

set ruler
set mousemodel=popup
set guioptions=egmrti
set gfn=Monospace\ 10
colorscheme onedark
set background=dark
set t_Co=256
" set expandtab shiftwidth=4 smarttab softtabstop=4 tabstop=4 smartindent


au BufNewFile,BufRead *.fasta,*.fastq,*.clustal,*.bed,*.gtf,*.pdb,*.vcf,*.sam set colorcolumn=


" Enable folding
set foldmethod=indent
set foldlevel=99

let python_highlight_all=1
syntax on

" vim-airline
let g:airline_theme = 'onedark'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=docs --exclude=.venv'"
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let g:enable_bold_font = 1
let g:hybrid_transparent_background = 1


"" NERDTree settings
"" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set rtp+=~/.vim/bundle/nerdtree

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * wincmd w


"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 35
let g:NerdTreeMinimalUI = 1
let g:NERDTreeMirror = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"" NERD Commenter configuration
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


" syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['python3', 'flake8']
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
        \ formatoptions+=croq softtabstop=4
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" " vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" pythonsense
let g:is_pythonsense_suppress_motion_keymaps = 1

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

"" Shortcuts
" Remove highlight from 
nnoremap <silent> <leader><space> :noh<cr>

" Nerdtree
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" syntastic
nnoremap <silent> <leader><D> :lclose<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <silent> <S-w> :tabclose<CR>

" Enable folding with the spacebar
nnoremap <space> za

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<Down>'] " Remove <Tab> so Ultisnips could work properly
let g:ycm_key_list_stop_completion = ['<C-y>']
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Change conda env
autocmd Filetype python nnoremap <buffer> <F4> :CondaChangeEnv<CR>

" Quick run via <F5>
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:ter python3 "%"<CR>

" Quick run via <S-F5> with fixed arguments 
autocmd Filetype python nnoremap <silent> <S-F5> :w<CR>:ter python3 "%" data/references/hg19.fasta data/bedfiles/AmpliSeqExome.20131001.designed.bed<CR>

"" autopep8 shortcut
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>


"" enable PDF/Browser support when available
if $DISPLAY != ""
    let R_pdfviewer = 'zathura'
    let vimrplugin_openpdf = 1
    let vimrplugin_openhtml = 1
endif

syntax enable
