" A Vim plugin that runs the currently open file through autopep8

if exists('g:vundle_installing_plugins')
	Plugin 'tell-k/vim-autopep8'
	finish
endif

let g:no_autopep8_maps = 1
command! Autopep8 call Autopep8()
