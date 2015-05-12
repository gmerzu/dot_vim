" A fancy start screen for Vim

if exists('g:vundle_installing_plugins')
	Plugin 'mhinz/vim-startify'
	finish
endif

let g:startify_list_order = [
			\ ['   Sessions'],
			\ 'sessions',
			\ ['   Bookmarks'],
			\ 'bookmarks',
			\ ['   Last modified'],
			\ 'dir',
			\ ['   Recent'],
			\ 'files',
			\ ]
let g:startify_skiplist = [
			\ 'COMMIT_EDITMSG',
			\ $VIMRUNTIME .'/doc',
			\ 'bundle/.*/doc',
			\ ]
let g:startify_bookmarks = ['~/.vimrc']
let g:startify_files_number = 10
let g:startify_custom_indices = ['a', 'd', 'f', 'g', 'h']
let g:startify_change_to_dir = 0
let g:startify_session_dir = '~/.vim/.sessions'

highlight StartifyBracket ctermfg=240
highlight StartifyFooter  ctermfg=111
highlight StartifyHeader  ctermfg=203
highlight StartifyPath    ctermfg=245
highlight StartifySlash   ctermfg=240

" Show Startify and NERDTree on start
autocmd VimEnter *
			\ if !argc() |
			\   Startify |
			\   NERDTree |
			\   wincmd w |
			\ endif
" Keep NERDTree from opening a split when startify is open
autocmd FileType startify setlocal buftype=
