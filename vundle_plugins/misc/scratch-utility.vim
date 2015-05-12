" A simple utility to create scratch buffers

if exists('g:vundle_installing_plugins')
	Plugin 'scratch-utility'
	finish
endif

let g:no_scratch_maps = 1
"nmap <unique> <silent> <F9> <plug>ShowScratchBuffer
"imap <unique> <silent> <F9> <plug>InsShowScratchBuffer
