" Vim plugin to interact with tmux

if exists('g:vundle_installing_plugins')
	Plugin 'benmills/vimux'
	finish
endif

" let g:VimuxUseNearestPane = 1
" nnoremap <leader>a :call VimuxRunCommand('spring rspec --fail-fast')<CR>
" nnoremap <leader>A :call VimuxRunCommand('spring rspec')<CR>
" nnoremap <leader>cu :call VimuxRunCommand('spring cucumber')<CR>
" nnoremap <leader>ca :call VimuxRunCommand('spring cucumber; spring rspec')<CR>
" nnoremap <leader>cm :VimuxPromptCommand<CR>
" function! WriteAndVimuxRunLastCommand()
" 	:call WriteBufferIfNecessary()
" 	:call VimuxRunLastCommand()
" endfunction
" nnoremap <leader>w :call WriteAndVimuxRunLastCommand()<CR>
