" Inspired by:
" https://github.com/mathiasbynens/dotfiles
" https://github.com/mpyatishev
" https://github.com/mislav/vimfiles/blob/master/vimrc
" https://github.com/gmarik/vimfiles
" https://github.com/swaroopch/dotvim/blob/master/vimrc
" https://github.com/madundead/stuff/blob/master/dotfiles/vim/vimrc.symlink

"" Vim, not Vi.
" This must be first, because it changes other options as a side effect.
set nocompatible



" Dein.vim
if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundle')
    call dein#begin('~/.vim/bundle')

    call dein#add('Shougo/dein.vim')

    " My Bundles here:


    "" Plugins begin

    call dein#add('Shougo/vimproc.vim', {'build': 'make'})

    " Editing
    call dein#add('Raimondi/delimitMate')
    call dein#add('SirVer/ultisnips')
    call dein#add('editorconfig/editorconfig-vim')
    " call dein#add('klen/python-mode')
    call dein#add('mattn/emmet-vim')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('tpope/vim-surround')

    " View
    " Autocomplete
    call dein#add('neoclide/coc.nvim', {'branch': 'release'})
    " call dein#add('Shougo/deoplete.nvim', {'rev': '5.2'})

    call dein#add('Xuyuanp/nerdtree-git-plugin')
    " call dein#add('Yggdroot/indentLine')
    call dein#add('bling/vim-airline')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('chriskempson/base16-vim')
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('ervandew/supertab')
    call dein#add('gcavallanti/vim-noscrollbar')
    " call dein#add('haya14busa/incsearch.vim')
    call dein#add('jistr/vim-nerdtree-tabs')
    call dein#add('jlanzarotta/bufexplorer')
    call dein#add('low-ghost/nerdtree-fugitive')
    call dein#add('mhinz/vim-signify')
    " call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('mileszs/ack.vim')
    call dein#add('scrooloose/nerdtree')
    " call dein#add('scrooloose/syntastic')
    " call dein#add('sjl/gundo.vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('wesQ3/vim-windowswap')

    " Formatting
    " call dein#add('csscomb/vim-csscomb')
    " call dein#add('maksimr/vim-jsbeautify')

    " Syntax
    " call dein#add('sheerun/vim-polyglot')
    call dein#add('cespare/vim-toml')

    " CSS
    " call dein#add('groenewege/vim-less')
    " call dein#add('hail2u/vim-css3-syntax')
    " call dein#add('tpope/vim-haml')
    call dein#add('wavded/vim-stylus')

    " JavaScript
    " call dein#add('SevInf/vim-bemhtml')
    call dein#add('heavenshell/vim-jsdoc', {'build': 'make install'})
    " call dein#add('jason0x43/vim-js-indent')
    call dein#add('kchmck/vim-coffee-script')
    call dein#add('leafgarland/typescript-vim')
    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('mxw/vim-jsx')
    call dein#add('othree/javascript-libraries-syntax.vim')
    call dein#add('pangloss/vim-javascript')
    call dein#add('posva/vim-vue')
    call dein#add('evanleck/vim-svelte')
    call dein#add('jparise/vim-graphql')
    " call dein#add('ternjs/tern_for_vim')

    " HTML
    " call dein#add('AndrewRadev/vim-eco')
    " call dein#add('Glench/Vim-Jinja2-Syntax')
    call dein#add('digitaltoad/vim-pug')
    " call dein#add('evidens/vim-twig')
    " call dein#add('godlygeek/tabular')
    " call dein#add('gregsexton/MatchTag')
    " call dein#add('mustache/vim-mustache-handlebars')
    " call dein#add('othree/html5.vim')
    " call dein#add('plasticboy/vim-markdown')

    " Go
    call dein#add('fatih/vim-go')

    " Nginx
    call dein#add('chr4/nginx.vim')

    "" Plugins end


    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
if dein#check_install()
    call dein#install()
endif



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
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

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
set nowrap

" Minimal number of screen lines to keep above and below the cursor.
" Start scrolling three lines before the horizontal window border
set scrolloff=0
" This keeps the cursor always in the vertical middle of the screen.
" set scrolloff=999
"
" Use UTF-8 without BOM
set fileencodings-=latin1
set fileencodings+=cp1251
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
" Case sensitive search if upper case char
set smartcase
" Make /g flag default when doing :s
set gdefault
" Highlight searches
set hlsearch
" do not redraw while running macros
set lazyredraw

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
set wildignore+=*.psd,*.svg,*.png,*.jpg,*.gif
" Ignore less cache
set wildignore+=*/LESS_CACHE/*,*/CACHE/*
" Ignore Sass cache
set wildignore+=*sass_cache*
" Ignore env
set wildignore+=*/env/*,*/node_modules/*,*/.nyc_output/*,*/cache/*,*/built/*,*/bower_components/*,*/vendor/*,*/__pycache__/*
set wildignore+=log/**,tmp/**

" Show the current mode
set showmode

" Show matching brackets
" ?
set showmatch
" DoMatchParen highlight matching bracket
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


" Spell
" See: http://www.opennet.ru/base/X/vim_orfo.txt.html
" set spell spelllang=en,ru


" Netrw
" let g:netrw_banner=0




"" General Settings end






" set colorcolumn=+1
" set colorcolumn=81

" don't try to highlight long lines
set synmaxcol=210



" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed,unnamedplus

" Optimize for fast terminal connections
set ttyfast

" Change mapleader
let mapleader="\\"


" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number
set relativenumber

" Highlight current line
set cursorline
set cursorcolumn



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
  set <F3>=OR
  set <F2>=OQ
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

:nmap <Leader>sv :source ~/.vim/vimrc<CR>
:nmap <Leader>v :e ~/.vim/vimrc<CR>

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

" Plugin 'scrooloose/nerdcommenter'
" Добавлять и удалять пробелы после символов комментирования
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
"


" Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEnableSnipMate = 0
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


" View

" Plugin 'neoclide/coc.nvim'
let g:coc_global_extensions = ['coc-tsserver']

" Plugin 'scrooloose/nerdtree'
" Open a NERDTree automatically when vim starts up if no files were specified
" autocmd vimenter * NERDTree
" F3 - open dir
" map <S-F3> :Sexplore!<CR>
" map <S-F3> :Texplore<CR>
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
" adds new keymaps for add and delete nodes
runtime! plugin/NERD_tree.vim
let opts = {'key': 'a', 'quickhelpText': 'add new node', 'callback': 'NERDTreeAddNode'}
call NERDTreeAddKeyMap(opts)
let opts = {'key': 'd', 'quickhelpText': 'delete node', 'callback': 'NERDTreeDeleteNode'}
call NERDTreeAddKeyMap(opts)
let NERDTreeWinSize=30
" Ignore files
let NERDTreeIgnore=['.sublime-project$[[file]]', '.sublime-workspace$[[file]]', '.pyc$[[file]]', '__pycache__$[[dir]]']

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('pug', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '−'
"

" Plugin 'bling/vim-airline'
" Hide git branch and show scrollbar
" line number/total lines:column number
let g:airline_section_b='%{noscrollbar#statusline(20, "—", "|")}%l/%L:%v'
" Hide right section
let g:airline_section_z=airline#section#create([''])

let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#hunks#enabled = 0
"


" Plugin 'chriskempson/base16-vim'
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-bespin
"

" Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "•",
    \ "Staged"    : "+",
    \ "Untracked" : "¤",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "×",
    \ "Dirty"     : "×",
    \ "Clean"     : "v",
    \ 'Ignored'   : '_',
    \ "Unknown"   : "?"
    \ }
"

" Plugin 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
"

" Plugin 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
"

" Plugin 'haya14busa/incsearch.vim'
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
"


" Formatting


" Syntax

" JavaScript
" Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
"

" vim-jsx
" Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 1
"

" Plugin 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,underscore,ramda,vue,react'
"

" Plugin 'ternjs/tern_for_vim'
let g:tern_show_argument_hints='no'
let g:tern_show_signature_in_pum=0
"


" Plugin 'heavenshell/vim-jsdoc'
nmap <silent> <C-l> <Plug>(jsdoc)
"

" " }}}
