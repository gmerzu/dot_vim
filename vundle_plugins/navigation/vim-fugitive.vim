" A Git wrapper

if exists('g:vundle_installing_plugins')
	Plugin 'tpope/vim-fugitive'
	finish
endif

" nnoremap <leader>gc :Gcommit -v<CR>
" nnoremap <leader>gca :Gcommit -a -v<CR>
" nnoremap <leader>gw :Gwrite<CR>
" nnoremap <leader>gs :Gstatus<CR>
" nnoremap <leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
" nnoremap <leader>gu :Git pull<CR>
" nnoremap <leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
" nnoremap <leader>gx :wincmd h<CR>:q<CR>
" Start git command
" nnoremap <leader>gi :Git<space>
" Undo the last commit
" command! Gcundo :Git reset HEAD~1
