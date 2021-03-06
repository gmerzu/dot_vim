" Lean & mean status/tabline for vim that's light as air

if exists('g:vundle_installing_plugins')
	Plugin 'vim-airline/vim-airline'
	finish
endif

let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 10

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '«'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = 'ȑ'

" let g:airline_mode_map = {
" 			\ 'n'  : 'N',
" 			\ 'i'  : 'I',
" 			\ 'R'  : 'R',
" 			\ 'v'  : 'V',
" 			\ 'V'  : 'VL',
" 			\ 'c'  : 'CMD',
" 			\ '' : 'VB',
" 			\ }
" Show the current working directory folder name
" let g:airline_section_b = '%{substitute(getcwd(), ".*\/", "", "g")} '
let g:airline_section_y = 'Ⱦ%{&et} %{airline#util#wrap(airline#parts#ffenc(),0)}'
" Just show the file name
" let g:airline_section_c = '%t'
" let g:airline_section_y = ''
" let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3'
" let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'
