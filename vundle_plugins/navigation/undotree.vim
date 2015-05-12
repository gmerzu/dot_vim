" Display your undo history in a graph

if exists('g:vundle_installing_plugins')
	Plugin 'mbbill/undotree'
	finish
endif

nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
