" ----------------------------------------
" SETTINGS
" ----------------------------------------

" Should be present
let g:settings = {}

" Plugin groups settings
" let g:settings.plugin_groups = ['dummy']
" let g:settings.plugin_groups = ['general', 'navigation', 'ui']
let g:settings.plugin_groups_exclude = ['dev']
" let g:settings.plugins = []
let g:settings.plugins_exclude = []
" let g:settings.plugins_exclude += ['dev/YouCompleteMe']
let g:settings.plugins_exclude += ['editor/AutoClose']
" let g:settings.plugins_exclude += ['libs/vimproc']
let g:settings.plugin_groups_order = ['libs']

let g:settings.plugin_depends = {}
let g:settings.plugin_depends['misc/vim-nerdtree_plugin_open'] = ['navigation/nerdtree']
let g:settings.plugin_depends['misc/vim-notes'] = ['libs/vim-misc']
let g:settings.plugin_depends['general/vim-session'] = ['libs/vim-misc']
let g:settings.plugin_depends['navigation/FuzzyFinder'] = ['libs/L9']
let g:settings.plugin_depends['navigation/clipbrd'] = ['libs/genutils']
let g:settings.plugin_depends['dev/vim-easytags'] = ['libs/vim-misc']

" optional dependencies
let g:settings.plugin_depends['navigation/vim-easymotion'] = ['libs/vimproc']
let g:settings.plugin_depends['navigation/unite'] = ['libs/vimproc']
let g:settings.plugin_depends['navigation/vimshell'] = ['libs/vimproc']
let g:settings.plugin_depends['navigation/vimfiler'] = ['libs/vimproc']
let g:settings.plugin_depends['misc/unite-spell-suggest'] = ['libs/vimproc']
let g:settings.plugin_depends['ui/clickable'] = ['libs/vimproc']
