set encoding=utf-8
set fileencodings=utf-8
"set fileencoding=utf-8
"bundle
set nocompatible
filetype off                   " (1)


set spell

"if has('vim_starting')
"      set runtimepath+=~/.vim/bundle/neobundle.vim
"        "call neobundle#rc(expand('~/.vim/bundle/'))
"    endif
"    " originalrepos on github
"call neobundle#begin()
"     NeoBundle 'Shougo/neobundle'
"     NeoBundle 'Shougo/vimproc.vim'
"     NeoBundle 'VimClojure'
"     NeoBundle 'Shougo/vimshell'
"     NeoBundle 'Shougo/unite.vim'
"     NeoBundle 'Shougo/neocomplcache'
"     NeoBundle 'Shougo/neosnippet'
"     NeoBundle 'Shougo/neosnippet-snippets'
"     NeoBundle 'Shougo/neocomplcache-clang'
"     NeoBundle 'jpalardy/vim-slime'
"     NeoBundle 'scrooloose/syntastic'
"     NeoBundle 'tpope/vim-fugitive'
"     NeoBundle 'Shougo/vimfiler'
"     NeoBundle 'itchyny/lightline.vim'
"     NeoBundle 'vim-scripts/taglist.vim'
"     ""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
"     NeoBundle 'vim-latex/vim-latex'
"     NeoBundle 'thinca/vim-quickrun'
"call neobundle#end()
    
call plug#begin('~/.vim/plugged')
     Plug 'Shougo/vimproc.vim', { 'do': 'make' }
     "Plug 'VimClojure'
     Plug 'Shougo/vimshell'
     Plug 'Shougo/unite.vim'
     Plug 'Shougo/neocomplcache'
     Plug 'Shougo/neosnippet'
     Plug 'Shougo/neosnippet-snippets'
     Plug 'jpalardy/vim-slime'
     Plug 'tpope/vim-fugitive'
     Plug 'Shougo/vimfiler'
     Plug 'itchyny/lightline.vim'
     "Plug 'vim-scripts/taglist.vim'
     "Plug 'vim-latex/vim-latex'
     Plug 'thinca/vim-quickrun'
     Plug 'lervag/vimtex'
call plug#end()

     filetype plugin indent on     " required!
     filetype indent on
     syntax on





" PEP 8 Indent rule
 setl tabstop=2
 setl softtabstop=2
 setl shiftwidth=2
 setl smarttab
 setl expandtab
 setl autoindent
 setl nosmartindent
 setl cindent
 setl textwidth=80
 "setl colorcolumn=80

 " Folding
" setl foldmethod=indent
" setl foldlevel=99


let fortran_free_source=1
let fortran_fold=1
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1






" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


"python mode
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Execute python script C-P 
 function! s:ExecPy()
     exe "!" . &ft . "3" . " %"
     :endfunction
     command! Exec call <SID>ExecPy()
     autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>



""
"" tex.vim
""
filetype plugin on
filetype indent on

let g:Tex_Leader=';'
let g:Tex_UseMakefile=0
let g:Tex_Menus=0
let g:tex_conceal=''
"let call IMAP(':p', '\partial', 'tex')
"call IMAP(';o', '\omega', 'tex')


set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'pdf'
"let g:Tex_FormatDependency_pdf = 'pdf, bib'
"let g:Tex_FormatDependency_pdf = 'pdf,bib,pdf'
"let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
"let g:Tex_MultipleCompileFormats = 'pdf,bib,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
""let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"let g:Tex_FormatDependency_ps = 'dvi,ps'
""let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error --shell-escape $*'
"let g:Tex_CompileRule_pdf = 'lualatex -interaction=nonstopmode %:r & bibtex %:r & lualatex -interaction=nonstopmode %:r'
"let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode-file-line-error-style $*'
"let g:Tex_BibtexFlavor = 'pbibtex -kanji=utf8'
"let g:Tex_BibtexFlavor = 'bibtex'
let g:Tex_ViewRule_pdf = 'evince $*.pdf 2>/dev/null'
let g:Tex_IgnoredWarnings =
      \"Underfull\n".
      \"Overfull\n".
      \"specifier changed to\n".
      \"You have requested\n".
      \"Missing number, treated as zero.\n".
      \"There were undefined references\n".
      \"Citation %.%# undefined\n".
      \'LaTeX Warning: A float is stuck'"
let g:Tex_IgnoreLevel = 8


""hokan c++
let g:neocomplcache_enable_at_startup = 1 

" <TAB> completion.
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR>    pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" " snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)

"set completeopt = menuone
" libclang を使用して高速に補完を行う
let g:neocomplcache_clang_use_library=1
" " clang.dll へのディレクトリパス
let g:neocomplcache_clang_library_path='~/bin/lib'
" " clang のコマンドオプション
" " MinGW や Boost のパス周りの設定は手元の環境に合わせて下さい
let g:neocomplcache_clang_user_options =
            \ '-I ~/boost/'.
            \ '-fms-extensions -fgnu-runtime '.
            \ '-include malloc.h '.
            \ '-mkl'
"                 " neocomplcache で表示される補完の数を増やす
"                 " これが少ないと候補が表示されない場合があります
let g:neocomplcache_max_list=1000




""lightline

     set laststatus=2
     set t_Co=256


let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'modified': 'MyModified',
            \   'readonly': 'MyReadonly',
            \   'fugitive': 'MyFugitive',
            \   'filename': 'MyFilename',
            \   'fileformat': 'MyFileformat',
            \   'filetype': 'MyFiletype',
            \   'fileencoding': 'MyFileencoding',
            \   'mode': 'MyMode'
            \ }
            \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction



"taglist
"set tags =tags
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_Show_One_File =1
"let Tlist_Use_Right_Window = 1
"let Tlist_Exit_OnlyWindow = 1
"map <silent> <leader>l :TlistToggle<CR>


"VimShell
"let g:vimshell_prompt_expr='getcwd().">"'
"let g:vimshell_prompt_pattern = '^\f\+ > '



" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/Dropbox/neosnippet-snippets/snippets/'



let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }

au FileType qf nnoremap <silent><buffer>q :quit<CR>

let g:quickrun_no_default_key_mappings = 1
nnoremap \r :write<CR>:QuickRun -mode n<CR>        
xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR>



nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

let g:quickrun_config = {
\   'tex': {
\       'runner' : 'vimproc',
\       "outputter/buffer/split" : ":botright 6sp",
\       "outputter/buffer/close_on_empty" : 1,
\       'command': 'lualatex',
\       'exec': ['%c -synctex=1 -interaction=nonstopmode %s']
\   },
\}
"\       'exec': ['%c -synctex=1 -interaction=nonstopmode %s', 'evince %s:r.pdf']

if has('win32unix')
  let &t_ti .= "\e[1 q"  " 端末を termcap モードにする
  let &t_SI .= "\e[5 q"  " 挿入モード開始(バー型のカーソル)
  let &t_EI .= "\e[1 q"  " 挿入モード終了(ブロック型カーソル)
  let &t_te .= "\e[0 q"  " termcap モードから抜ける
endif


let g:vimtex_imaps_leader = ";"
let g:vimtex_echo_ignore_wait = 1
map <silent> <leader>l :VimtexLabelsToggle<CR>
