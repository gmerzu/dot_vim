" The ultimate snippet solution for Vim

if exists('g:vundle_installing_plugins')
	Plugin 'SirVer/ultisnips'
	finish
endif

" let g:UltiSnipsSnippetDirectories = ['snippets']
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
