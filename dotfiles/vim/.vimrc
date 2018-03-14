syntax on

"colorscheme slate
colorscheme cobalt2

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set number
set colorcolumn=80,100
set hlsearch
nnoremap <silent> <cr> :nohlsearch<cr><cr>

set foldmethod=syntax
set foldlevelstart=1
set foldminlines=5
set nofoldenable

let g:netrw_preview   = 1
let g:netrw_liststyle=3
let g:netrw_winsize   = 30

let g:go_highlight_functions=1
let g:go_highlight_methods=1
"let g:go_highlight_fields=1
"let g:go_highlight_types=1
"let g:go_highlight_operators=1
"let g:go_highlight_build_constraints=1
"" Show errors on save
let g:syntastic_go_checkers = ['go vet', 'errcheck', 'go', 'golint']
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

autocmd FileType mail setlocal spell spelllang=en_us
autocmd FileType mail setlocal fo+=aw
autocmd FileType javascript setlocal equalprg=js-beautify\ -f\ -\ -j\ -k
autocmd FileType gitcommit setlocal spell textwidth=72
autocmd FileType java set omnifunc=javacomplete#Complete

                                                                                                    
filetype plugin indent on
set autoindent
set smartindent
set expandtab
au FileType go setlocal noexpandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround

inoremap <leader><leader> <C-x><C-o>

"let g:ackprg = 'ag --vimgrep'
let g:ackprg = 'rg --vimgrep'

" line numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

"let g:android_sdk_path = '/home/nick/Android/'
"let g:gradle_path = '/home/nick/.gradle/'
