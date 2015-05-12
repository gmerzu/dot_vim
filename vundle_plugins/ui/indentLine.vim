" Plugin to display the indention levels with thin vertical lines

if exists('g:vundle_installing_plugins')
	Plugin 'Yggdroot/indentLine'
	finish
endif

let g:indentLine_enabled = 0

let g:indentLine_char = '┊'
" let g:indentLine_color_term = 236
