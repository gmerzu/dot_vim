" A code-completion engine for Vim
" To install: cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer --system-libclang --system-boost

if exists('g:vundle_installing_plugins')
	Plugin 'Valloric/YouCompleteMe'
	finish
endif

highlight YcmErrorSign ctermbg=darkred
highlight YcmWarningSign ctermbg=darkyellow
highlight YcmErrorSection ctermbg=darkred
highlight YcmWarningSection ctermbg=darkyellow
nnoremap <leader>dd :YcmForceCompileAndDiagnostics<CR>
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
" let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
" let g:ycm_auto_trigger = 0
let g:ycm_show_diagnostics_ui = 0
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_server_keep_logfiles = 1
" Don't ever show up preview window
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

" let g:ycm_filetype_specific_completion_to_disable = {
" 			\ 'ruby': 1,
" 			\ 'javascript': 1,
" 			\ 'html': 1,
" 			\ 'vim': 1,
" 			\}
