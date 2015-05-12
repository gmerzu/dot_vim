" Automated tag file generation and syntax highlighting of tags in Vim

if exists('g:vundle_installing_plugins')
	Plugin 'xolox/vim-easytags'
	finish
endif

let g:easytags_file = '~/.vim/.tags'
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_include_members = 1
" let g:easytags_suppress_report = 1
