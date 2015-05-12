" ----------------------------------------
" MAPPINGS
" ----------------------------------------

" Set leader to \
" Note: This line MUST come before any <leader> mappings
let mapleader='\'
let maplocalleader = '\'

" ---------------
" Regular Mappings
" ---------------

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" Yank entire buffer with gy
nnoremap gy :%y+<cr>

" Select entire buffer
nnoremap vy ggVG

" Make Y behave like other capital commands
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$

" Just to beginning and end of lines easier. From http://vimbits.com/bits/16
noremap H ^
noremap L $

" Create newlines without entering insert mode
nnoremap go o<Esc>k
nnoremap gO O<Esc>j

" remap U to <C-r> for easier redo
" from http://vimbits.com/bits/356
nnoremap U <C-r>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Ctrl-C to copy to the X-clipboard
vnoremap <C-C> "+y

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" For when you forget to sudo.. Really Write the file
cnoremap w!! w !sudo tee % >/dev/null

" Ctrl-T to aspell check file in the current buffer
nnoremap <C-T> :write!<CR>:!aspell check %<CR>:edit! %<CR>

" Toggle list set
nnoremap <F5> :call ToggleList()<CR>
" Toggle number set
nnoremap <F6> :call ToggleNumber()<CR>
" Toggle mouse
nnoremap <F7> :call ToggleMouse()<CR>
" Change encoding
nnoremap <F8> :call GenEncMenu()<CR>:emenu Encoding.<Tab>
" Translate word
" map <F10> :call TranslateWord()<CR>

" ---------------
" Window Movement
" ---------------
nnoremap <silent> gh :WriteBufferIfNecessary<CR>:wincmd h<CR>
nnoremap <silent> gj :WriteBufferIfNecessary<CR>:wincmd j<CR>
nnoremap <silent> gk :WriteBufferIfNecessary<CR>:wincmd k<CR>
nnoremap <silent> gl :WriteBufferIfNecessary<CR>:wincmd l<CR>

"   4 Window Splits
"
"   -----------------
"   g1 | g2 | g3 | g4
"   -----------------
nnoremap <silent> g1 :WriteBufferIfNecessary<CR>:wincmd t<CR>
nnoremap <silent> g2 :WriteBufferIfNecessary<CR>:wincmd t<bar>:wincmd l<CR>
nnoremap <silent> g3 :WriteBufferIfNecessary<CR>:wincmd t<bar>:wincmd l<bar>
	\:wincmd l<CR>
nnoremap <silent> g4 :WriteBufferIfNecessary<CR>:wincmd b<CR>

" Previous Window
nnoremap <silent> gp :wincmd p<CR>
" Equal Size Windows
nnoremap <silent> g= :wincmd =<CR>
" Swap Windows
nnoremap <silent> gx :wincmd x<CR>

" ---------------
" Modifer Mappings
" ---------------

" Make line completion easier
inoremap <C-l> <C-x><C-l>

" Easier Scrolling (think j/k with left hand)
" All variations are mapped for now until I get used to one
" C/M/D + d (page up)
" C/M/D + f (page down)
nnoremap <C-j> 15gjzz
nnoremap <C-k> 15gkzz
vnoremap <C-j> 15gjzz
vnoremap <C-k> 15gkzz

" ---------------
" Insert Mode Mappings
" ---------------

" Let's make escape better, together
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

" ---------------
" Leader Mappings
" ---------------

" Clear search
" noremap <silent><leader>/ :nohlsearch<CR>
" Toggle search highlight
" noremap <silent><leader>/ :if &hlsearch \| set nohlsearch \| else \| set hlsearch \| endif<CR>
nnoremap <silent> <leader>/ :set invhlsearch<CR>

" Highlight search word under cursor without jumping to next
nnoremap <leader>h *<C-O>

" Toggle spelling mode with ,s
nnoremap <silent> <leader>s :set spell!<CR>

" Quickly switch to last buffer
nnoremap <leader>, :e#<CR>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" Surround the commented line with lines.
"
" Example:
"          # Test 123
"          becomes
"          # --------
"          # Test 123
"          # --------
nnoremap <silent> <leader>cul :normal "lyy"lpwv$r-^"lyyk"lP<cr>

" Format the entire file
nnoremap <leader>fef mx=ggG='x

" Format a json file with Python's built in json.tool.
" from https://github.com/spf13/spf13-vim/blob/3.0/.vimrc#L390
nnoremap <leader>jt <Esc>:%!underscore print<CR><Esc>:set filetype=json<CR>
nnoremap <leader>jts <Esc>:%!underscore print --strict<CR><Esc>:set filetype=json<CR>

" Split window vertically or horizontally *and* switch to the new split!
nnoremap <silent> <leader>hs :split<Bar>:wincmd j<CR>
nnoremap <silent> <leader>vs :vsplit<Bar>:wincmd l<CR>

" Close the current window
nnoremap <silent> <leader>sc :close<CR>

" Code folding switch hot-keys
nnoremap <silent> <leader>f0 :set foldlevel=0<CR>
nnoremap <silent> <leader>f1 :set foldlevel=1<CR>
nnoremap <silent> <leader>f2 :set foldlevel=2<CR>
nnoremap <silent> <leader>f3 :set foldlevel=3<CR>
nnoremap <silent> <leader>f4 :set foldlevel=4<CR>
nnoremap <silent> <leader>f5 :set foldlevel=5<CR>
nnoremap <silent> <leader>f6 :set foldlevel=6<CR>
nnoremap <silent> <leader>f7 :set foldlevel=7<CR>
nnoremap <silent> <leader>f8 :set foldlevel=8<CR>
nnoremap <silent> <leader>f9 :set foldlevel=9<CR>

" ---------------
" Typo Fixes
" ---------------

noremap <F1> <Esc>
inoremap <F1> <Esc>
cnoremap w' w<CR>

" Disable the ever-annoying Ex mode shortcut key. Type visual my ass. Instead,
" make Q repeat the last macro instead. *hat tip* http://vimbits.com/bits/263
nnoremap Q @@

" Don't use Ex mode, use Q for formatting
" map Q gq

" Removes doc lookup mapping because it's easy to fat finger and never useful
nnoremap K k
vnoremap K k

" Toggle paste mode with F5
nnoremap <silent> <F5> :set paste!<CR>

" Insert date
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>
