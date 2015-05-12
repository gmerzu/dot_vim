" A tree explorer plugin for navigating the filesystem

if exists('g:vundle_installing_plugins')
	Plugin 'scrooloose/nerdtree'
	finish
endif

nnoremap <silent> <F3> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.py[cdo]$', '\~$', '\.sw[op]$', '^\.git$', '^\.hg$', '^\.svn$', '^\.bzr$']
let NERDTreeChDirMode = 0
let NERDTreeQuitOnOpen = 0
let NERDTreeMouseMode = 2
let NERDTreeShowHidden = 0
let NERDTreeKeepTreeInNewTab = 1
let g:NERDTreeHijackNetrw = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
