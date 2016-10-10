" Vundle

if exists('g:vundle_installing_plugins')
	finish
endif

command! ReloadVundle source ~/.vim/vundle.vim
function! PluginReloadAndRun(command)
	:ReloadVundle
	execute a:command
endfunction

" nnoremap <leader>pi :call PluginReloadAndRun('PluginInstall')<CR>
" nnoremap <leader>pu :call PluginReloadAndRun('PluginInstall!')<CR>
" nnoremap <leader>pc :call PluginReloadAndRun('PluginClean')<CR>
