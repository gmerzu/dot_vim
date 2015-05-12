" Maintains a history of previous yanks, changes and deletes

if exists('g:vundle_installing_plugins')
	Plugin 'YankRing.vim'
	finish
endif

let g:yankring_history_dir = '~/.vim/.tmp'
let g:yankring_history_file = '.yankring_history'
