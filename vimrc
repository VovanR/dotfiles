" Inspired by:
" https://github.com/mathiasbynens/dotfiles
" https://github.com/mpyatishev
" https://github.com/mislav/vimfiles/blob/master/vimrc

" Make Vim more useful
set nocompatible

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" vim-pathogen
" let g:pathogen_disabled = []
let g:pathogen_disabled = ['gundo.vim', 'phpfolding.vim', 'vim-jsbeautify']
call pathogen#infect()
call pathogen#helptags()

" Enable file type detection
filetype plugin indent on

syntax enable

" Theme
set background=dark
colorscheme solarized

" set textwidth=80
" set colorcolumn=+1
set colorcolumn=81

" don't try to highlight long lines
set synmaxcol=800



" Auto-reload buffers when file changed on disk
set autoread

" Disable swap files; systems don't crash that often these days
set updatecount=0



" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Always show status line
set laststatus=2

" Строка статуса: имя файла, тип файла и режим в котором он открыт, подробное положение в файле и номер буфера
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Change mapleader
let mapleader="\\"

" Don’t add empty newlines at the end of files
set binary
set noeol



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
set wildignore+=*/env/*



" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

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

" Make tabs as wide as four spaces
set tabstop=4

" Show 'invisible' characters
" set listchars=tab:—\ ,trail:·,eol:¬,nbsp:_
set list listchars=tab:—\ ,trail:·



"" Searching

" Highlight searches
set hlsearch

" Highlight dynamically as pattern is typed
set incsearch

" Ignore case of searches
set ignorecase

" Add the g flag to search/replace by default
set gdefault



" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=50



" Enable mouse in all modes
set mouse=a

" Disable error bells
set noerrorbells

" Don't reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Сворачивание кода
set foldmethod=syntax
set foldlevel=20
set foldlevelstart=10

" Shift + Tab - next tab
" map <S-Tab> :tabnext<CR>
map <Leader>n <esc>:tabprev<CR>
map <Leader>m <esc>:tabnext<CR>

if &term =~ '^screen'
  set <S-F3>=[1;2R
endif
if &term =~ '^xterm-256color'
  set <S-F3>=O1;2R
endif

" F2 - save
map <F2> :w<CR>

" Shift + F2 - save all
map <S-F2> :wa<CR>

" Shift + F3 - open buffer
map <S-F3> :BufExplorer<CR>

" F3 - open dir
"map <S-F3> :Sexplore!<CR>
"map <S-F3> :Texplore<CR>
map <F3> :NERDTreeToggle<CR>

" auto switch to folder where editing file
autocmd BufEnter * cd %:p:h

"from http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
:set completeopt=menuone,longest,preview

:nmap <Leader>sv :source ~/.vimrc<CR>
:nmap <Leader>v :e ~/.vimrc<CR>

" Don't stop visual mode after indenting
vnoremap < <gv
vnoremap > >gv

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeDirArrows=0
" adds new keymaps for add and delete nodes
runtime! plugin/NERD_tree.vim
let opts = {'key': 'a', 'quickhelpText': 'add new node', 'callback': 'NERDTreeAddNode'}
call NERDTreeAddKeyMap(opts)
let opts = {'key': 'd', 'quickhelpText': 'delete node', 'callback': 'NERDTreeDeleteNode'}
call NERDTreeAddKeyMap(opts)

" Ширина левой панели
let NERDTreeWinSize=30

" Ignore files
let NERDTreeIgnore=['.sublime-project$[[file]]', '.sublime-workspace$[[file]]', '.pyc$[[file]]']


"toggles with Xorg key
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняю;abcdefghijklmnopqrstuvwxyz.

"toggles with Ctrl + ^
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan


" F4 - TagBar toggle
map <F4> :TagbarToggle<CR>

" Автоматически открывать tagbar
autocmd VimEnter * nested :TagbarOpen

" Не закрывать тагбар после перехода к функции
let g:tagbar_autoclose=0
let g:tagbar_compact=1

" Иконки свернуть развернуть список
let g:tagbar_iconchars=['+', '-']

" Ширина тагбара
let g:tagbar_width=30

" Не сортировать функции по имени
let g:tagbar_sort=0

let g:tagbar_phpctags_bin='~/phpctags/phpctags'


"let g:AutoPairsFlyMode=0

"python-mode
" Disable pylint checking every save
""let g:pymode_lint_write = 0
let g:pymode_lint_config = "$HOME/.pylintrc"

"отключение rope для работы jedi
let g:pymode_rope = 0

let g:jedi#use_tabs_not_buffers = 0
let g:jedi#completions_enable = 0

"PHP lint
au BufWritePost *.php !php -l %
"http://vim.wikia.com/wiki/Runtime_syntax_check_for_php
""if !exists('*PHPsynCHK')
""  function! PHPsynCHK()
""    ccl
""    let winnum = winnr() " get current window number
""    let linenum = line('.')
""    let colnum = col('.')
""    silent execute "%!php -l -f /dev/stdin | sed 's/\\/dev\\/stdin/".bufname("%")."/g' >.vimerr; cat"
""    silent cf .vimerr
""    cw " open the error window if it contains error
""    " return to the window with cursor set on
""    " the line of the first error (if any)
""    execute winnum . "wincmd w"
""    silent undo
""    silent cf
""    if 1 == len(getqflist())
""      w
""      call cursor(linenum, colnum)
""    endif
""  endfunction
""endif
""set errorformat=%m\ in\ %f\ on\ line\ %l
""au BufWriteCmd *.php call PHPsynCHK()

let g:dbext_default_SQLITE_bin = 'sqlite3'

" To stop vim-gitgutter running eagerly
" let g:gitgutter_eager = 0

" Подсветка измененных строк
let g:signify_vcs_list = [ 'git' ]
" let g:signify_update_on_bufenter = 1
" let g:signify_update_on_focusgained = 1
" let g:signify_cursorhold_normal = 1
" let g:signify_cursorhold_insert = 1

" Обновлять состояние vim
set updatetime=2000

" To run NERDTreeTabs on console vim startup
let g:nerdtree_tabs_open_on_console_startup=1

" Не подсвечивать jsDoc
let g:javascript_ignore_javaScriptdoc=0

" Добавлять и удалять пробелы после символов комментирования
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

set nowrap

" Airline
" Smarter tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#hunks#enabled = 0


" Syntastic
" let g:syntastic_javascript_checkers = ['jslint']

" Save on buffer switch
set autowrite

" neocomplete
let g:neocomplete#enable_at_startup = 1
" <TAB>: completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Tern
" let g:tern_map_keys=1
" let g:tern_show_argument_hints='on_hold'