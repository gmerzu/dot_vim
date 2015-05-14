" A Vim plugin for previewing markdown files in a browser
" (needs xdotool, markdown, see)

if exists('g:vundle_installing_plugins')
	Plugin 'JamshedVesuna/vim-markdown-preview'
	" Plugin 'gmerzu/vim-markdown-preview'
	finish
endif

let g:vim_markdown_preview_browser = 'Chromium'
