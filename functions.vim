" ----------------------------------------
" FUNCTIONS
" ----------------------------------------

" Used to close preview window
function! AutoClosePreviewWindow()
	if !&l:previewwindow
		pclose
	endif
endfunction

" Generates encoding menu
function! GenEncMenu()
	let encs = ['utf-8', 'koi8-r', 'windows-1251', 'dos-866']
	for enc in encs
		execute 'silent! aunmenu Encoding.' . enc
		execute 'silent! aunmenu Encoding.' . enc . '*'
		if &fileencoding == enc
			execute 'amenu Encoding.' . enc . '* :e ++enc=' . enc . '<CR>'
		else
			execute 'amenu Encoding.' . enc . ' :e ++enc=' . enc . '<CR>'
		endif
	endfor
endfunction

" Translate words with console StarDict
function! TranslateWord()
	let dict    = 'sdcv -n'
	let phrase  = expand('<cword>')
	let tmpfile = tempname()

	silent execute '!' . dict . ' ' . phrase . ' > ' . tmpfile

	let lines = system("wc -l " . tmpfile . "| awk '{print $1}'")

	if lines == 0
		echo phrase . ': Not found.'
	else
		execute 'botright sp ' . tmpfile
	end
endfunction
" menu Translate.Translate_word<Tab> :call TranslateWord()<CR>

" Enable or disable mouse
function! ToggleMouse()
	if !exists("g:enable_disable_mouse")
		if empty(&mouse)
			let g:enable_disable_mouse = 0
		else
			let g:enable_disable_mouse = 1
		end
	endif

	if g:enable_disable_mouse == 0
		let g:enable_disable_mouse = 1
		set mouse=a
		echo "mouse is enabled"
	else
		let g:enable_disable_mouse = 0
		set mouse=""
		echo "mouse is disabled"
	end
endfunction

" Set or unset number
function! ToggleNumber()
	if !exists("b:set_unset_number")
		let b:set_unset_number = &number
	endif

	if b:set_unset_number == 0
		let b:set_unset_number = 1
		set number
		set foldcolumn=2
		echo "number is set"
	else
		let b:set_unset_number = 0
		set nonumber
		set foldcolumn=0
		echo "number is unset"
	end
endfunction

" Set or unset list
function! ToggleList()
	if !exists("b:set_unset_list")
		let b:set_unset_list = &list
	endif

	if b:set_unset_list == 0
		let b:set_unset_list = 1
		set list
		echo "list is set"
	else
		let b:set_unset_list = 0
		set nolist
		echo "list is unset"
	end
endfunction
