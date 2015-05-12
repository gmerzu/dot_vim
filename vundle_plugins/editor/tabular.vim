" Vim script for text filtering and alignment

if exists('g:vundle_installing_plugins')
	Plugin 'godlygeek/tabular'
	finish
endif

nnoremap <leader>t= :Tabularize assignment<CR>
vnoremap <leader>t= :Tabularize assignment<CR>
nnoremap <leader>t: :Tabularize symbol<CR>
vnoremap <leader>t: :Tabularize symbol<CR>
nnoremap <leader>t, :Tabularize comma<CR>
vnoremap <leader>t, :Tabularize comma<CR>

" nnoremap <leader>a& :Tabularize /&<CR>
" vnoremap <leader>a& :Tabularize /&<CR>
" nnoremap <leader>a= :Tabularize /=<CR>
" vnoremap <leader>a= :Tabularize /=<CR>
" nnoremap <leader>a=> :Tabularize /=><CR>
" vnoremap <leader>a=> :Tabularize /=><CR>
" nnoremap <leader>a: :Tabularize /:<CR>
" vnoremap <leader>a: :Tabularize /:<CR>
" nnoremap <leader>a:: :Tabularize /:\zs<CR>
" vnoremap <leader>a:: :Tabularize /:\zs<CR>
" nnoremap <leader>a, :Tabularize /,<CR>
" vnoremap <leader>a, :Tabularize /,<CR>
" nnoremap <leader>a,, :Tabularize /,\zs<CR>
" vnoremap <leader>a,, :Tabularize /,\zs<CR>
" nnoremap <leader>a<bar> :Tabularize /<bar><CR>
" vnoremap <leader>a<bar> :Tabularize /<bar><CR>
