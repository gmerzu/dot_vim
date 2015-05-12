" Totalcommander-like two-panel tree file explorer for vim

if exists('g:vundle_installing_plugins')
	Plugin 'lpenz/vimcommander'
	finish
endif

nnoremap <silent> <F11> :cal VimCommanderToggle()<CR>
