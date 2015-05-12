" Fuzzy file and buffer finder with regexp support

if exists('g:vundle_installing_plugins')
	Plugin 'kien/ctrlp.vim'
	finish
endif

let g:ctrlp_cache_dir = '~/.vim/.cache/ctrlp'

" let g:ctrlp_prompt_mappings = {
" 			\ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
" 			\ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
" 			\ }

" Ensure Ctrl-P isn't bound by default
" let g:ctrlp_map = ''

" Ensure max height isn't too large. (for performance)
" let g:ctrlp_max_height = 10
" Fix new windows opening in split from startify
" let g:ctrlp_reuse_window = 'startify'
" let g:ctrlp_mruf_max = 350
" let g:ctrlp_mruf_default_order = 0

" Leader Commands
" nnoremap <leader>t :CtrlPRoot<CR>
" nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap <leader>u :CtrlPCurFile<CR>
" nnoremap <leader>m :CtrlPMRUFiles<CR>

" if executable('ag')
" 	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
" 	" HatTip: http://robots.thoughtbot.com/faster-grepping-in-vim and
" 	" @ethanmuller
" 	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"
" 	" ag is fast enough that CtrlP doesn't need to cache
" 	let g:ctrlp_use_caching = 0
" endif
