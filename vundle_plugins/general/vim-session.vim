" Extended session management for Vim

if exists('g:vundle_installing_plugins')
	Plugin 'xolox/vim-session'
	finish
endif

let g:session_directory = '~/.vim/.sessions'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
nnoremap <silent> ZS :SaveSession<CR>
nnoremap <silent> ZO :OpenSession<CR>
nnoremap <silent> ZC :CloseSession<CR>
nnoremap <silent> ZD :DeleteSession<CR>
nnoremap <silent> ZV :ViewSession<CR>
