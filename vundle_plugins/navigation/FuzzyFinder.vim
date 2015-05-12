" Buffer/file/command/tag/etc explorer with fuzzy matching

if exists('g:vundle_installing_plugins')
	Plugin 'FuzzyFinder'
	finish
endif

let g:fuf_dataDir = '~/.vim/.cache/fuf'
