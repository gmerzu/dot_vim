" An extensible & universal comment plugin that also handles embedded filetypes

if exists('g:vundle_installing_plugins')
	Plugin 'tomtom/tcomment_vim'
	finish
endif

let g:tcomment_maps = 0
nnoremap <silent> <leader>cc :TComment<CR>
vnoremap <silent> <leader>cc :TComment<CR>
" nnoremap <silent> <leader>cb :TCommentBlock<CR>
" vnoremap <silent> <leader>cb :TCommentBlock<CR>
