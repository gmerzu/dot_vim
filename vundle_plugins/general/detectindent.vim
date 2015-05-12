" Automatically detect indent (expandtab, shiftwidth, tabstop) settings

if exists('g:vundle_installing_plugins')
	Plugin 'ciaranm/detectindent'
	finish
endif

let g:detectindent_preferred_tabsize = 1
let g:detectindent_preferred_indent = 4
