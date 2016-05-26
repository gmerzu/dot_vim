" ---------------------------------------------
" REGULAR VIM CONFIGURATION (NO PLUGINS NEEDED)
" ---------------------------------------------

" ---------------
" Color
" ---------------
" set background=light
set background=dark
colorscheme desert
" Force 256 color mode
if !has('gui_running')
	set t_Co=256
endif

" -----------------------------
" File Locations
" -----------------------------
set backupdir=~/.vim/.backup
set directory=~/.vim/.swp,.,~/tmp,/var/tmp,/tmp
set viewdir=~/.vim/.view
set viminfo+=n~/.vim/.viminfo
" set spellfile=~/.vim/spell/custom.en.utf-8.add
" Persistent Undo
if has('persistent_undo')
	set undofile
	set undodir=~/.vim/.undo
endif
set tags=./.tags,.tags
" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
	let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" ---------------
" UI
" ---------------
language message en_US.UTF-8     " Use this language for messages
" set ruler                      " Show the line and column number of the cursor position
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set number                       " Line numbers on
set relativenumber               " Show the line number relative to the line with the cursor
set cursorline                   " Highlight the screen line of the cursor
" set cursorcolumn               " Highlight the screen column of the cursor
set wrap                         " Line wrapping on
set laststatus=2                 " Always show the statusline
set cmdheight=2                  " Make the command area two lines high
set encoding=utf-8               " Default encoding
set fileformats=unix,dos,mac     " Order of file formats to use
set fileformat=unix              " Set the initial buffer to unix line endings
set fileencodings=utf8,koi8-r,cp1251,cp866,ucs-2
set noshowmode                   " Don't show the mode since Airline shows it
set showcmd                      " Display incomplete commands
set title                        " Set the title of the window in the terminal to the file
set shortmess+=filmnrxoOtT       " Abbrev. of messages (avoids 'hit enter')
set tabpagemax=99                " Maximum number of tabs

set linebreak                    " Wrap long lines at a character in 'breakat'
set showbreak=\ >                " String to put at the start of lines that have been wrapped
" Break symbol is green
highlight NonText guifg=#0030ff ctermfg=green

" Detect lines with length > 100
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
" autocmd BufEnter * match OverLength /\%>100v.\+/
" or
set colorcolumn=101              " Color the 101th column differently as a wrapping guide
" execute "set colorcolumn=" . join(range(101,335), ',')
" Color for the 101th column
highlight ColorColumn ctermbg=yellow guibg=yellow

" Status line content
" set statusline=%n:\ %F\ [%{&ff}]%y%m%h%w%r\ %=char=0x%B\ \ \ x=%v\ y=%l/%L\ -\ %p%%\ 
" set statusline=%n:\ %F\ [%{&ff}]%y%m%h%w%r\ %=[char:\ 0x%B]\ \[column:\ %v]\ [line:\ %l\ of\ %L\ \(%p%%\)]\ 

" Always show the last line on the screen, even when it's too long (gets rid of the annoying @@@@@ crap)
set display+=lastline

" ---------------
" Behaviors
" ---------------
syntax enable                    " Switch syntax highlighting on
set nobackup                     " Turn off backups
set nowritebackup                " No backups
set noautoread                   " Don't automatically reload changes if detected
set hidden                       " Change buffer - without saving
set history=1000                 " Number of things to remember in history
set cf                           " Enable error files & error jumping
set clipboard+=unnamed           " Yanks go on clipboard instead
set autowrite                    " Writes on make/shell commands
" set timeoutlen=450             " Time to wait for a command (after leader for example)
set ttimeout
set ttimeoutlen=100              " Time to wait for a command (after leader for example)
set foldenable                   " Auto folding
set foldcolumn=2                 " Column with size 2 on the left to show fold level
set foldlevel=1                  " 0 — all folds closed, 1 — first level opened, etc
set formatoptions=crql
set iskeyword+=\$,-              " Add extra characters that are valid parts of variables
set nostartofline                " Don't go to the start of the line after some commands
set scrolljump=5                 " Lines to scroll when cursor leaves screen
set scrolloff=3                  " Minimum lines to keep above and below cursor
set gdefault                     " this makes search/replace global by default
set switchbuf=useopen            " Switch to an existing buffer if one exists
set confirm                      " Use dialogs on errors
set virtualedit=onemore          " Allow for cursor beyond last character

set wildmenu                     " Turn on WiLd menu
set wildcharm=<TAB>              " WiLd menu with autocompletion
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,*.class,*.scssc,*.cssc
" First tab completes as much as possible and shows the list if there is
" more than one matching item. Next tabs iterate through the list
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]    " Backspace and cursor keys wrap too

set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

set sessionoptions+=blank,buffers,curdir,folds,help,options,tabpages,winsize

" Do not display "Pattern not found" messages during YouCompleteMe completion
" Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
try
	set shortmess+=c
catch /E539: Illegal character/
endtry

" ---------------
" Spell checking
" ---------------
set spell spelllang=ru,en        " Languages to spell-check
set nospell                      " By default spelling is off

" ---------------
" Text Format
" ---------------
set backspace=indent,eol,start   " Delete everything with backspace
set smarttab                     " Be smart when using tabs
set pastetoggle=<F12>            " F12 for paste toggle

set cindent                      " Get the amount of indent according the C rules
set autoindent                   " Indent at the same level of the previous line
set shiftround                   " Round indent to multiple of 'shiftwidth'
set shiftwidth=4                 " Use indents of 4 spaces
set tabstop=4                    " An indentation every four columns
set softtabstop=4                " Let backspace delete indent
set noexpandtab                  " Tabs are tabs, no spaces
set nojoinspaces                 " Prevents inserting two spaces after punctuation on a join (J)
set splitright                   " Puts new vsplit windows to the right of the current
set splitbelow                   " Puts new split windows to the bottom of the current

" ---------------
" Searching
" ---------------
set ignorecase                   " Case insensitive search
set smartcase                    " Non-case sensitive search
set incsearch                    " Incremental search
set hlsearch                     " Highlight search results

" ---------------
" Visual
" ---------------
set showmatch                    " Show matching brackets
set matchtime=1                  " How many tenths of a second to blink
set nolist                       " Hide invisible characters

" Show trailing spaces as dots and carrots for extended lines
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:▸▸
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<
" EOF
set listchars+=eol:¶

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide                    " Hide mouse after chars typed
set mouse=""                     " No mouse at all
set mousemodel=popup             " Right mouse button pops up a menu in the GUI

set complete=.,w,b,u,U           " Better complete options to speed it up

" Source a local configuration file if available
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
