" ----------------------------------------
" Bootstrap Vundle
" ----------------------------------------

scriptencoding utf-8
language message en_US.UTF-8

source ~/.vim/settings.vim
source ~/.vim/vundle.vim
source ~/.vim/plugins.vim

filetype on

set nobackup
set nowritebackup
set noswapfile
set nomore

set viminfo+=n~/.vim/.viminfo
set backupdir=~/.vim/.backup
set directory=~/.vim/.swp,.,~/tmp,/var/tmp,/tmp
set viewdir=~/.vim/.view
