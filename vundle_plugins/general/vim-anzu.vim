" Vim search status

if exists('g:vundle_installing_plugins')
	Plugin 'osyo-manga/vim-anzu'
	finish
endif

nmap n <plug>(anzu-n)
nmap N <plug>(anzu-N)
nmap * <plug>(anzu-star)
nmap # <plug>(anzu-sharp)
let g:airline#extensions#anzu#enabled = 1
