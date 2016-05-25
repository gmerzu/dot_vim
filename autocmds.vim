" ----------------------------------------
" AUTO COMMANDS
" ----------------------------------------

augroup MyAutoCommands
	" Clear the auto command group so we don't define it multiple times
	" Idea from http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
	autocmd!

	" No formatting on o key newlines
	autocmd BufNewFile,BufEnter * set formatoptions-=o

	" No more complaining about untitled documents
	autocmd FocusLost silent! wall

	" Resize splits when the window is resized
	" from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
	autocmd VimResized * wincmd =

	" Highlight current line only in active window
	autocmd WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline

	" Automatically close preview window when not needed anymore
	autocmd InsertLeave * call AutoClosePreviewWindow()
	autocmd CursorMovedI * call AutoClosePreviewWindow()

	" Set tab space to 4 for python files
	autocmd Filetype python setlocal tabstop=4 shiftwidth=4

	" Set tab space to 2 and expandtab for ruby files
	autocmd Filetype ruby,eruby setlocal tabstop=2 shiftwidth=2 expandtab

	" Set tab space to 2 and expandtab for cucumber files
	autocmd Filetype cucumber setlocal tabstop=2 shiftwidth=2 expandtab

	" Set noexpandtab for C/C++ files
	autocmd Filetype c,cpp setlocal noexpandtab

	autocmd BufRead,BufNewFile *.html,*.htm,*.xml set matchpairs+=<:>

	" Enable spelling for some files
	autocmd BufRead,BufNewFile,BufWrite *.txt,*.tex,*.latex setlocal spell
	autocmd BufRead,BufNewFile,BufWrite ~/.vim/bundle/*/doc/*,/usr/share/vim/*/doc/*,~/.vim/doc/* setlocal nospell

	" autocmd Filetype *
	"	\if &omnifunc == "" |
	"	\setlocal omnifunc=syntaxcomplete#Complete |
	"	\endif

	" Exit from insert mode after inactive ...
	" autocmd cursorholdi * stopinsert
	" ... for 100 seconds
	" autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=100000
	" autocmd InsertLeave * let &updatetime=updaterestore
augroup END
