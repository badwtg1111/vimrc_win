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

" for unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-session'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'kmnk/vim-unite-giti'

" for ctrlp
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-scripts/ctrlp-z'


NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'godlygeek/csapprox'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'janlay/NERD-tree-project'

NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/taglist.vim'

NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'git@github.com:bling/vim-airline.git'
NeoBundle 'vim-scripts/L9'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'terryma/vim-multiple-cursors'

" for fasd
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'amiorin/vim-fasd'
NeoBundle 'marius/unite-fasd'

NeoBundle 'tyru/open-browser.vim'

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

if has("win32") || has("win64")
set guifont=Courier_New:h12
endif
set t_Co=256
"set autochdir

" Set mapleader
let mapleader=","

" If you like control + arrow key to navigate windows
" then perform the remapping
noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l
nmap <leader>wo <C-w>o

"}}}

"vim paste {{{
set clipboard=unnamed
set pastetoggle=<F4>
"}}}

" 复制到系统剪切板 {{{
map m "+y
map <leader>pp "*p
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

" NERDTree.vim {{{
let g:NERDTreeMouseMode=2
let g:NERDTreeAutoCenter=1
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowHidden=1


"let NERDTreeWinPos='left'
"nnoremap <silent> <leader>f :NERDTreeFind<CR>
let g:NTPNames = ['.git','build.xml', 'Makefile', '.project', '.lvimrc','Android.mk']
let g:NTPNames = add(g:NTPNames, 'SConstruct')
call extend(g:NTPNames, ['*.sln', '*.csproj'])

let g:NTPNamesDirs = ['.git', '*.xcodeproj', '*.xcworkspace']

nmap  <F3> :ToggleNERDTree<cr>
map <Leader>nn <plug>NERDTreeTabsToggle<CR>

"set rtp+=~/.vim/bundle/NERD_tree-Project 
"let g:NTPNames = add(g:NTPNames, 'SConstruct')
"let g:NTPNames = add(g:NTPNames, '.git')
"extend(g:NTPNames, ['*.sln', '*.csproj','.git','.project','SConstruct'])

"}}}

"for vim-fasd.vim {{{
nnoremap <Leader>z :Z<CR>
"}}}

"for ctrlp-z {{{
let g:ctrlp_z_nerdtree = 1
let g:ctrlp_extensions = ['Z', 'F']
nnoremap sz :CtrlPZ<Cr>
nnoremap sf :CtrlPF<Cr>
"}}}

"for open-browser {{{
" This is my setting. 
let g:netrw_nogx = 1 " disable netrw's gx mapping. 
"nmap gx <Plug>(openbrowser-smart-search) 
"vmap gx <Plug>(openbrowser-smart-search) 


"" Open URI under cursor. 
nmap go <Plug>(openbrowser-open) 
"" Open selected URI. 
vmap go <Plug>(openbrowser-open) 

" Search word under cursor. 
nmap gs <Plug>(openbrowser-search) 
" Search selected word. 
vmap gs <Plug>(openbrowser-search) 

" If it looks like URI, Open URI under cursor. 
" Otherwise, Search word under cursor. 
nmap gx <Plug>(openbrowser-smart-search) 
" If it looks like URI, Open selected URI. 
" Otherwise, Search selected word. 
vmap gx <Plug>(openbrowser-smart-search) 

vnoremap gob :OpenBrowser http://www.baidu.com/s?wd=<C-R>=expand("<cword>")<cr><cr>
nnoremap gob :OpenBrowser http://www.baidu.com/s?wd=<C-R>=expand("<cword>")<cr><cr>

vnoremap gog :OpenBrowser http://www.google.com/?#newwindow=1&q=<C-R>=expand("<cword>")<cr><cr>
nnoremap gog :OpenBrowser http://www.google.com/?#newwindow=1&q=<C-R>=expand("<cword>")<cr><cr>

vnoremap goi :OpenBrowserSmartSearch http://www.iciba.com/<C-R>=expand("<cword>")<cr><cr>
nnoremap goi :OpenBrowserSmartSearch http://www.iciba.com/<C-R>=expand("<cword>")<cr><cr>
" In command-line 
":OpenBrowser http://google.com/ 
":OpenBrowserSearch ggrks 
":OpenBrowserSmartSearch http://google.com/ 
":OpenBrowserSmartSearch ggrks 
"}}}

" Man.vim {{{
source $VIMRUNTIME/ftplugin/man.vim
nnoremap <C-A> :Man 3 <cword><CR>
inoremap <C-A> <ESC>:Man 3 <cword><CR>
"}}}

"for tag search{{{
nmap <Leader>tn :tn<cr>
nmap <Leader>tp :tp<cr>

"}}}

" taglist.vim {{{
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_OnlyWindow=1
let Tlist_Use_Right_Window=0
let Tlist_Sort_Type='name'
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_Max_Submenu_Items=10
let Tlist_Max_Tag_length=20
let Tlist_Use_SingleClick=0
let Tlist_Auto_Open=0
let Tlist_Close_On_Select=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Process_File_Always=1
let Tlist_WinHeight=10
let Tlist_WinWidth=15
let Tlist_Use_Horiz_Window=0
let g:Tlist_Auto_Update=1
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1
"}}}

" tagbar {{{
let g:tagbar_left = 1
nnoremap <silent> <F2> :TagbarToggle<CR>
"}}}
