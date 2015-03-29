"for windows



" neobundle {{{

" Note: Skip initialization for vim-tiny or vim-small or With Vim-Starting.
if !1 | finish | endif
if has('vim_starting')
	set nocompatible  " Be iMproved
endif

" Setup RTP:
let s:vimfiles = ""
if has("win32") || has("win64")
	 let s:vimfiles = "$VIM/vimfiles/"
else
	  let s:vimfiles = "~/.vim/"
endif
let &runtimepath .= ',' . expand(s:vimfiles . "bundle/neobundle.vim/")

call neobundle#begin(expand(s:vimfiles . "bundle/"))

let g:neobundle#types#git#default_protocol="git"
let g:neobundle_default_git_protocol="git"

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neomru.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-session'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'kmnk/vim-unite-giti'


NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'godlygeek/csapprox'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'

NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'git@github.com:bling/vim-airline.git'


call neobundle#end()    " End Bundle Installation

" Required:
filetype plugin indent on
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"}}}

" normal {{{
set nu
colorscheme adrian
"}}}


"neocomplcache {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}

"for unite {{{ 
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ? [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['? tig                                                        ? ,gt',
        \'normal ,gt'],
    \['? git status       (Fugitive)                                ? ,gs',
        \'Gstatus'],
    \['? git diff         (Fugitive)                                ? ,gd',
        \'Gdiff'],
    \['? git commit       (Fugitive)                                ? ,gc',
        \'Gcommit'],
    \['? git log          (Fugitive)                                ? ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['? git blame        (Fugitive)                                ? ,gb',
        \'Gblame'],
    \['? git stage        (Fugitive)                                ? ,gw',
        \'Gwrite'],
    \['? git checkout     (Fugitive)                                ? ,go',
        \'Gread'],
    \['? git rm           (Fugitive)                                ? ,gr',
        \'Gremove'],
    \['? git mv           (Fugitive)                                ? ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['? git push         (Fugitive, salida por buffer)             ? ,gp',
        \'Git! push'],
    \['? git pull         (Fugitive, salida por buffer)             ? ,gP',
        \'Git! pull'],
    \['? git prompt       (Fugitive, salida por buffer)             ? ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['? git cd           (Fugitive)',
        \'Gcd'],
    \]
nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>
"}}}

"for airline {{{
"Powerline
"let g:Powerline_symbols = 'unicode'
set laststatus=2   " Always show the statusline
"let g:Powerline_symbols_override = {
            "\ 'BRANCH': [0x2213],
            "\ 'LINE': 'L',
            "\ }
"let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


"function! AccentDemo()
  "let keys = ['dec:', '%b', 'hex:0x', '%B']
  "for k in keys
    "call airline#parts#define_text(k, k)
    "call airline#parts#define_accent(k, 'green')
  "endfor

  "let g:airline_section_w = airline#section#create(keys)
"endfunction
"autocmd VimEnter * call AccentDemo()


let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#bufferline#enabled = 1


function! MyOverride(...)
    call airline#parts#define_accent('Title', 'green')
    call a:1.add_section('Title','dec:%b hex:0x%B ')
endfunction

call airline#add_statusline_func('MyOverride')

"}}}

