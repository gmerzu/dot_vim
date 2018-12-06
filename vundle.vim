" ----------------------------------------
" VUNDLE
" ----------------------------------------

set nocompatible " be iMproved
filetype off     " required!

" Gather groups to load vim files from
let s:groups = {}
if has_key(g:settings, 'plugin_groups') && !empty(g:settings.plugin_groups)
	for group in g:settings.plugin_groups
		if isdirectory(expand('~/.vim/vundle_plugins/' . group))
			let s:groups[group] = 1
		endif
	endfor
else
	for dir in split(glob('~/.vim/vundle_plugins/*'), '\n')
		let group = fnamemodify(fnameescape(dir), ":t")
		let s:groups[group] = 1
	endfor
endif
if has_key(g:settings, 'plugin_groups_exclude') && !empty(g:settings.plugin_groups_exclude)
	for group_exclude in g:settings.plugin_groups_exclude
		if has_key(s:groups, group_exclude)
			unlet s:groups[group_exclude]
		endif
	endfor
endif
let s:plugins = {}
if has_key(g:settings, 'plugins') && !empty(g:settings.plugins)
	for plugin in g:settings.plugins
		if filereadable(expand('~/.vim/vundle_plugins/' . plugin . '.vim'))
			let s:plugins[plugin] = 1
		endif
	endfor
endif
function! s:GroupsCompare(g1, g2)
	if has_key(g:settings, 'plugin_groups_order') && !empty(g:settings.plugin_groups_order)
		let i1 = index(g:settings.plugin_groups_order, a:g1)
		let i2 = index(g:settings.plugin_groups_order, a:g2)
		if i1 == -1 && i2 == -2
			return 0
		elseif i1 == -1
			return 1
		elseif i2 == -1
			return -1
		else
			return i1 - i2
	else
		return 0
	endif
endfunction
function! s:PlusinsCompare(p1, p2)
	let g1 = split(a:p1, '/')[0]
	let g2 = split(a:p2, '/')[0]
	return s:GroupsCompare(g1, g2)
endfunction
let s:sortedgroups = sort(keys(s:groups), 's:GroupsCompare')
let g:settings.loaded_groups = s:sortedgroups[:]
let s:sortedplugins = sort(keys(s:plugins), 's:PluginsCompare')
let g:settings.loaded_plugins = s:sortedplugins[:]
let s:loaded_plugins = {}

" Functions to load plugins regarding its dependencies
function! s:LoadPlugin(p)
	for file in split(glob('~/.vim/vundle_plugins/' . a:p . '.vim'), '\n')
		if !has_key(s:loaded_plugins, a:p)
			execute 'source' fnameescape(file)
			let s:loaded_plugins[a:p] = 1
		endif
	endfor
endfunction
function! s:GatherPluginRecursively(p, deps)
	if index(a:deps, a:p) != -1
		return
	endif
	if has_key(g:settings, 'plugins_exclude') && index(g:settings.plugins_exclude, a:p) != -1
		return
	endif
	if has_key(g:settings, 'plugin_depends') && has_key(g:settings.plugin_depends, a:p)
		for d in get(g:settings.plugin_depends, a:p)
			call s:GatherPluginRecursively(d, a:deps)
		endfor
	endif
	call add(a:deps, a:p)
endfunction
function! s:LoadPluginRecursively(p)
	let deps = []
	call s:GatherPluginRecursively(a:p, deps)
	for d in deps
		call s:LoadPlugin(d)
	endfor
endfunction

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Source all the plugins with a global variable set
" that ensures only the Plugin 'name' code will be called
let g:vundle_installing_plugins = 1
for group in s:sortedgroups
	for file in split(glob('~/.vim/vundle_plugins/' . group . '/*.vim'), '\n')
		let plugin = fnamemodify(fnameescape(file), ":t:r")
		call s:LoadPluginRecursively(group . '/' . plugin)
	endfor
endfor
for plugin in s:sortedplugins
	call s:LoadPluginRecursively(plugin)
endfor
unlet g:vundle_installing_plugins

call vundle#end()

let g:settings.loaded_plugins = keys(s:loaded_plugins)
