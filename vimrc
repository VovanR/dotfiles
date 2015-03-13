" Inspired by:
" https://github.com/mathiasbynens/dotfiles
" https://github.com/mpyatishev
" https://github.com/mislav/vimfiles/blob/master/vimrc
" https://github.com/gmarik/vimfiles
" https://github.com/swaroopch/dotvim/blob/master/vimrc

"" Vim, not Vi.
" This must be first, because it changes other options as a side effect.
set nocompatible



" NeoBundle.vim
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!


"" Plugins begin

" Editing
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'vim-scripts/phpfolding.vim'
NeoBundle 'klen/python-mode'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'freitass/todo.txt-vim'

" View
" NeoBundle 'sjl/gundo.vim'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'majutsushi/tagbar'
" NeoBundle 'vim-php/tagbar-phpctags.vim'
NeoBundle 'bling/vim-airline'
" NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'mileszs/ack.vim'

" Formatting
NeoBundle 'csscomb/csscomb-for-vim'
" NeoBundle 'maksimr/vim-jsbeautify'

" Syntax
" CSS
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'wavded/vim-stylus'

" JavaScript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'SevInf/vim-bemhtml'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'alarie/requirejs.vim'
NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'heavenshell/vim-jsdoc'

" HTML
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'AndrewRadev/vim-eco'
NeoBundle 'mustache/vim-mustache-handlebars'

" PHP
NeoBundle 'shawncplus/phpcomplete.vim'

"" Plugins end


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck



"" General Settings begin


" Enable file type detection
syntax on

" Line endings should be Unix-style unless the file is from someone else.
" set fileformat=unix
" au BufNewFile * set fileformat=unix

" Automatically indent when adding a curly bracket, etc.
set autoindent
set smartindent

" Make tabs as wide as four spaces
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Allow backspace in insert mode
set backspace=indent,eol,start

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Disable swap files; systems don't crash that often these days
set updatecount=0

" Disable the F1 help key
map <F1> <Esc>
imap <F1> <Esc>

" Show special characters
" set listchars=tab:—\ ,trail:·,eol:¬,nbsp:_
if v:version >= 700
    set list listchars=tab:\ \ ,trail:·,extends:>,nbsp:_
else
    set list listchars=tab:\ \ ,trail:·,extends:>
endif

" Don't break up long lines, but visually wrap them.
set textwidth=0
set wrap

" Minimal number of screen lines to keep above and below the cursor.
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" This keeps the cursor always in the vertical middle of the screen.
" set scrolloff=999
"
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Status line
" Always show status line
set laststatus=2
" http://stackoverflow.com/a/10416234/1284255
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

" Show line number, cursor position.
set ruler

" Show the (partial) command as it’s being typed
set showcmd

" Search
" Search as you type.
set incsearch
" Ignore case while searching
set ignorecase
" Make /g flag default when doing :s
set gdefault
" Highlight searches
set hlsearch

" Show autocomplete menus
set wildmenu

" Ignore VCS files
set wildignore+=.git,.svn
" Ignore projects
set wildignore+=*.sublime-project,*.sublime-workspace
" Ignore archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bin files
set wildignore+=*.pyc
" Images
set wildignore+=*.psd,*.svg
" Ignore less cache
set wildignore+=*/LESS_CACHE/*,*/CACHE/*
" Ignore env
set wildignore+=*/env/*,*/node_modules/*,*/cache/*,*/built/*,*/bower_components/*,*/vendor/*,*/__pycache__/*

" Show the current mode
set showmode

" Show matching brackets
set showmatch
" Bracket blinking
set matchtime=2

" Error bells are displayed visually.
" set visualbell
" Disable error bells
set noerrorbells

" Automatically read files which have been changed outside of Vim, if we
" haven't changed it already.
set autoread

" F2 - save
map <F2> :w<CR>
" Shift + F2 - save all
map <S-F2> :wa<CR>






"" General Settings end






" set colorcolumn=+1
set colorcolumn=81

" don't try to highlight long lines
set synmaxcol=800



" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed,unnamedplus

" Allow cursor keys in insert mode
set esckeys

" Optimize for fast terminal connections
set ttyfast

" Change mapleader
let mapleader="\\"

" Don’t add empty newlines at the end of files
set binary
set noeol


" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" Highlight current line
set cursorline



" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=50



" Enable mouse in all modes
set mouse=a

" Don't reset cursor to start of line when moving around.
set nostartofline

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the filename in the window titlebar
set title

" Сворачивание кода
set foldmethod=syntax
set foldlevel=99
set foldlevelstart=99

" Shift + Tab - next tab
" map <S-Tab> :tabnext<CR>
map <Leader>n <esc>:tabprev<CR>
map <Leader>m <esc>:tabnext<CR>

" Go Insert mode, C-v and then S-F3 prints this code
if &term =~ '^screen'
  set <S-F3>=[1;2R
endif
if &term =~ '^xterm-256color'
  " set <S-F3>=O1;2R
  set <S-F3>=[1;2R
endif
if &term =~ '^screen-256color'
  set <S-F3>=[1;2R
  set <F3>=[13~
  set <F2>=[12~
endif

" Shift + F3 - open buffer
map <S-F3> :BufExplorer<CR>

" auto switch to folder where editing file
" autocmd BufEnter * cd %:p:h

"from http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
:set completeopt=menuone,longest,preview

:nmap <Leader>sv :source ~/.vimrc<CR>
:nmap <Leader>v :e ~/.vimrc<CR>

" Don't stop visual mode after indenting
vnoremap < <gv
vnoremap > >gv

"toggles with Xorg key
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняю;abcdefghijklmnopqrstuvwxyz.

"toggles with Ctrl + ^
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Обновлять состояние vim
set updatetime=2000

" Save on buffer switch
set autowrite


" Plugins " {{{


" Editing

" Plugin 'editorconfig/editorconfig-vim'
"

" Plugin 'scrooloose/nerdcommenter'
" Добавлять и удалять пробелы после символов комментирования
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
"


" Plugin 'Shougo/neosnippet.vim'
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"


" Plugin 'vim-scripts/phpfolding.vim'
"

" Plugin 'klen/python-mode'
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 0

let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
"

" Plugin 'mattn/emmet-vim'
"


" View

" Plugin 'sjl/gundo.vim'
"

" Plugin 'jlanzarotta/bufexplorer'
"

" Plugin 'kien/ctrlp.vim'
"

" Plugin 'vim-scripts/dbext.vim'
let g:dbext_default_SQLITE_bin = 'sqlite3'
"

" Plugin 'scrooloose/nerdtree'
" Автоматически открывать nerdtree
" autocmd vimenter * NERDTree
" F3 - open dir
" map <S-F3> :Sexplore!<CR>
" map <S-F3> :Texplore<CR>
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeDirArrows=0
" adds new keymaps for add and delete nodes
runtime! plugin/NERD_tree.vim
let opts = {'key': 'a', 'quickhelpText': 'add new node', 'callback': 'NERDTreeAddNode'}
call NERDTreeAddKeyMap(opts)
let opts = {'key': 'd', 'quickhelpText': 'delete node', 'callback': 'NERDTreeDeleteNode'}
call NERDTreeAddKeyMap(opts)
let NERDTreeWinSize=35
" Ignore files
let NERDTreeIgnore=['.sublime-project$[[file]]', '.sublime-workspace$[[file]]', '.pyc$[[file]]', '__pycache__$[[dir]]']
"

" Plugin 'jistr/vim-nerdtree-tabs'
" To run NERDTreeTabs on console vim startup
" let g:nerdtree_tabs_open_on_console_startup=1
"

" Plugin 'majutsushi/tagbar'
map <F4> :TagbarToggle<CR>
" Автоматически открывать tagbar
" autocmd VimEnter * nested :TagbarOpen
" Не закрывать тагбар после перехода к функции
let g:tagbar_autoclose=0
let g:tagbar_compact=1
let g:tagbar_iconchars=['+', '-']
let g:tagbar_width=30
" Не сортировать функции по имени
let g:tagbar_sort=0
"

" Plugin 'vim-php/tagbar-phpctags.vim'
" let g:tagbar_phpctags_bin='~/phpctags/phpctags'
"

" Plugin 'bling/vim-airline'
let g:airline_section_z='%l/%L:%03c'    " line number/total lines:column number

let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 0
"


" Plugin 'altercation/vim-colors-solarized'
" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized
"

" Plugin 'tomasr/molokai'
colorscheme molokai
"

" Plugin 'tpope/vim-fugitive'
"

" Plugin 'mhinz/vim-signify'
" Подсветка измененных строк
let g:signify_vcs_list = [ 'git' ]
" let g:signify_update_on_bufenter = 1
" let g:signify_update_on_focusgained = 1
" let g:signify_cursorhold_normal = 1
" let g:signify_cursorhold_insert = 1
"

" Plugin 'bronson/vim-trailing-whitespace'
"

" Plugin 'scrooloose/syntastic'
" let g:syntastic_javascript_checkers = ['jslint']
"

" Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"


" Formatting

" Plugin 'csscomb/csscomb-for-vim'
"

" Plugin 'maksimr/vim-jsbeautify'
"


" Syntax

" CSS
" Plugin 'hail2u/vim-css3-syntax'
"

" Plugin 'groenewege/vim-less'
"

" Plugin 'wavded/vim-stylus'
"


" JavaScript
" Plugin 'pangloss/vim-javascript'
"

" Plugin 'othree/javascript-libraries-syntax.vim'
"

" Plugin 'alarie/requirejs.vim'
"

" Plugin 'kchmck/vim-coffee-script'
"

" Plugin 'marijnh/tern_for_vim'
" let g:tern_map_keys=1
" let g:tern_show_argument_hints='on_hold'
"


" Plugin 'heavenshell/vim-jsdoc'
" Не подсвечивать jsDoc
let g:javascript_ignore_javaScriptdoc=0
"


" HTML
" Plugin 'digitaltoad/vim-jade'
"


" Plugin 'tpope/vim-markdown'
"


" PHP
" Plugin 'shawncplus/phpcomplete.vim'
"


" " }}}