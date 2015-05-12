" Check your python source files with PEP8

if exists('g:vundle_installing_plugins')
	Plugin 'pep8'
	finish
endif

let g:pep8_map = '\p8'
command! Pep8 call Pep8()
