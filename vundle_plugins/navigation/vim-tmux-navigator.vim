" Seamless navigation between tmux panes and vim splits

if exists('g:vundle_installing_plugins')
	Plugin 'christoomey/vim-tmux-navigator'
	finish
endif

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
