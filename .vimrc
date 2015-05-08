set nocompatible			"disable vi compatibility (emulation of old bugs)
filetype off				" required for Vundle

" Install vundle as follows:
"
" $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Launch vim mand run :PluginInstall
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
" Keep Plugin commands between here and filetype pluging indent on.
" scripts on GitHub repos
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'andviro/flake8-vim'
Plugin 'michalbachowski/vim-wombat256mod'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'ivanov/vim-ipython'

" scripts from http://vim-scripts.org/vim/scripts.html
" Easily switch between source and header files
Plugin 'a.vim'
Plugin 'bufexplorer.zip'
Plugin 'cscope.vim'
Plugin 'python.vim'
"Plugin 'pythoncomplete'

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.

filetype plugin indent on		" load file type plugins + indentation
syntax enable
set encoding=utf-8
set showcmd				" display incomplete commands
set autoindent				" use indentation of previous line
set smartindent				" use intelligent indentation for C
" Turn syntax highlighting on
set t_Co=256
syntax on
silent! colorscheme wombat256mod
set number				" turn line numbers on
set showmatch				" highligh matching braces
" intelligent comments set comments=sl:/*,mg:\ *,elx:\ */
"" Whitespace
set nowrap
set tabstop=4				" tab width is 4 spaces
set softtabstop=4           " tab width in insert mode is 4 spaces
set shiftwidth=4			" indent also with 4 spaces
set expandtab				"expand tabs to spaces
set textwidth=80			" wrap lines at 80 chars.
set backspace=indent,eol,start		" backspace through everything in insert mode

"" Searching
set hlsearch				" highlight matches
set incsearch				" incremental searching
set ignorecase				" searches are case insensitive
set smartcase				" ... unless they contain at least one captial letter

" Load standard tag files
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
set tags=.

" Move around windows using Ctrl-j, k, h, and l
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

" Clang autocomplete settings
let g:clang_user_options="-I."
let g:clang_use_library=1
let g:clang_library_path="/usr/local/lib"
"let g:clang_jumpto_declaration_key="<C-}>"

" Omni-complete
set completeopt+=longest

" Tagbar settings
let g:tagbar_left=1
nnoremap <silent> <F8> :TagbarToggle<CR>

" File Browser
let g:netrw_liststyle=3
let g:netrw_browse_split=4 " Open file in previous buffer
let g:ctrlp_working_path_mode = ''

" ConqueTerm
let g:ConqueTerm_InsertOnEnter=1
let g:ConqueTerm_CWInsert=1
let g:ConqueTerm_ToggleKey = '<C-F8>'

" Search alias
command! -nargs=+ Cgrep grep -R --include=*.{c,h,cpp,hpp,html,htm} <args> .
command! -nargs=+ Pgrep grep -R --include=*.{py,pyc,pyx} <args> .
command! -nargs=+ Rgrep grep -R --include=*.{c,h,cpp,hpp,html,htm,xml,py,pyc,pyx} <args> .
map <F4> :Rgrep <cword><CR>
map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q<CR>

highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(80,999),",")


" Cscope key mappings
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>
