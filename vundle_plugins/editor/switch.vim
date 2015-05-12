" Plugin to switch segments of text with predefined replacements

if exists('g:vundle_installing_plugins')
  Plugin 'AndrewRadev/switch.vim'
  finish
endif

nnoremap - :Switch<cr>
