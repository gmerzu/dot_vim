" Toggle the cursor shape in the terminal for Vim

if exists('g:vundle_installing_plugins')
	Plugin 'jszakmeister/vim-togglecursor'
	finish
endif

let g:togglecursor_leave = 'line'
