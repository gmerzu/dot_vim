" A powerful color tool in vim

if exists('g:vundle_installing_plugins')
  Plugin 'Rykka/colorv.vim'
  finish
endif

let g:colorv_cache_file = expand('~/.vim/.cache/colorv')
let g:colorv_cache_fav = expand('~/.vim/.cache/colorv_fav')
let g:colorv_preview_ftype = 'css,javascript,scss,stylus'
