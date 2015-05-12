" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)

if exists('g:vundle_installing_plugins')
	Plugin 'taglist.vim'
	finish
endif

" Taglist Variables
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
" let g:ctags_statusline = 1
" Override how taglist does javascript
" let g:tlist_javascript_settings = 'javascript;f:function;c:class;m:method;p:property;v:global'
nnoremap <silent> TT :TlistToggle<CR>
" F5: Tag list
" imap <silent> <F5> :Tlist<CR>
" map <silent> <F5> :Tlist<CR>
