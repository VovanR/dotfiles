" Inspired by:
" https://github.com/mathiasbynens/dotfiles
" https://github.com/mpyatishev

" Make Vim more useful
set nocompatible

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

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader="\\"

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

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

" Highlight searches
set hlsearch

" Highlight dynamically as pattern is typed
set incsearch

" Ignore case of searches
set ignorecase

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

" vim-pathogen
call pathogen#infect()
call pathogen#helptags()

syntax enable

" Enable file type detection
filetype plugin indent on

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

" F4 - TagBar toggle
map <F4> :TagbarToggle<CR>

set background=dark
colorscheme solarized

" auto switch to folder where editing file
autocmd BufEnter * cd %:p:h

"from http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
:set completeopt=menuone,longest,preview

:nmap <Leader>sv :source ~/.vimrc<CR>
:nmap <Leader>v :e ~/.vimrc<CR>

" Don't stop visual mode after indenting
vnoremap < <gv
vnoremap > >gv

"NERDTree
let NERDTreeChDirMode=2
let NERDTreeDirArrows=0
""adds new keymaps for add and delete nodes
runtime! plugin/NERD_tree.vim
let opts = {'key': 'a', 'quickhelpText': 'add new node', 'callback': 'NERDTreeAddNode'}
call NERDTreeAddKeyMap(opts)
let opts = {'key': 'd', 'quickhelpText': 'delete node', 'callback': 'NERDTreeDeleteNode'}
call NERDTreeAddKeyMap(opts)

"toggles with Xorg key
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняю;abcdefghijklmnopqrstuvwxyz.

"toggles with Ctrl + ^
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

let g:tagbar_autoclose=1
let g:tagbar_compact=1
let g:tagbar_sort = 0

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
set updatetime=512

" To run NERDTreeTabs on console vim startup
let g:nerdtree_tabs_open_on_console_startup=1

" Не подсвечивать jsDoc
let g:javascript_ignore_javaScriptdoc=0
