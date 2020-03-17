" Plugins {{{
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'neomake/neomake'
" Plug 'mhartington/oceanic-next'
call plug#end()
" }}}

" UI {{{
if (has("termguicolors"))
	set termguicolors
endif
colorscheme chalk
let g:airline_theme='chalk'
"set number
" let g:airline_theme='onedark'
nnoremap ` :let @/=""<CR>
" }}}

" Cargo {{{
" set g:neomake_rust_cargo_command = ['build']
" }}}

" Mappings {{{
set showcmd
let mapleader=" "
nnoremap <silent> <leader>f :NERDTreeToggle<CR>
" }}}

" Neomake commands {{{
autocmd filetype rust nnoremap <leader>b :w <bar> exec '!cargo build'<CR>
autocmd filetype rust nnoremap <leader>r :w <bar> exec '!cargo run'<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
" }}}
