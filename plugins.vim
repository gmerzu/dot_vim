" ----------------------------------------
" LOAD PLUGINS SETTINGS
" ----------------------------------------

" Source all the plugin files again, this time loading their configuration
for plugin in g:settings.loaded_plugins
	for file in split(glob('~/.vim/vundle_plugins/' . plugin . '.vim'), '\n')
		execute 'source' fnameescape(file)
	endfor
endfor
