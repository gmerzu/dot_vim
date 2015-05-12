" Open files independent from vim (NERD tree extension)

if exists('g:vundle_installing_plugins')
	Plugin 'vim-nerdtree_plugin_open'
	finish
endif

let g:nerdtree_plugin_open_cmd = 'xdg-open'
