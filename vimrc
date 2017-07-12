"=============
" Launch Config
"=============
" use pathogen
call pathogen#infect()

" enable syntax processing
syntax enable

" enable filetype plugins
filetype indent plugin on
set modeline
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"=============
" UI Config
"=============
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" search as characters are entered
set incsearch
" highlight matches
set hlsearch
" turn of search highlight
map <F4> :nohl<CR>

"=============
" UI Config
"=============
" show line numbers
set number
" show command in bottom bar
set showcmd
" highlight current line
set cursorline
" visual autocomplete for command menu
set wildmenu
" highlight matching [{()}]
set showmatch
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

"=============
" Spaces, tabs and indent related
"=============
" tabs are spaces
set expandtab
" Be smart when using tabs
set smarttab
" number of visual spaces per TAB
set tabstop=4
set shiftwidth=4
" number of spaces in tab when editing
set softtabstop=4
"Auto indent
set ai
"Smart indent
set si
"Wrap lines
set wrap
" higlight whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$\|\t/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\|\t/
au InsertLeave * match ExtraWhiteSpace /\s\+$\|\t/

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"=============
" Misc
"=============
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"=============
" Syntastic settings
"=============
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Python
let g:syntastic_python_checkers=['pyflakes']


"=============
" Lightline settings
"=============
" lightline.vim statusline activate
set laststatus=2
" hide mode information from status line
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }
