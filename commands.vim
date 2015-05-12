" ----------------------------------------
" COMMANDS
" ----------------------------------------

" Fixes common typos
command! W w
command! Q q

" Write r/o file with sudo
command! -nargs=0 -bang WSudo :silent! write !sudo tee % &>/dev/null
