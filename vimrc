" ----------------------------------------
" MAIN FILE
" ----------------------------------------

" Encoding of the config
scriptencoding utf-8

" Load user-settings
source ~/.vim/settings.vim

" All of the plugins are installed with Vundle from this file
source ~/.vim/vundle.vim

" Automatically detect file types (must turn on after Vundle)
filetype plugin indent on

" Load plugin-specific configuration
source ~/.vim/plugins.vim

" All of the Vim configuration
source ~/.vim/config.vim

" Small custom functions
source ~/.vim/functions.vim

" New commands
source ~/.vim/commands.vim

" All hotkeys, not dependant on plugins, are mapped here
source ~/.vim/mappings.vim

" Auto commands
source ~/.vim/autocmds.vim
