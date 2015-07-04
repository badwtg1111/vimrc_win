set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" neobundle {{{
" My Settings
 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif
 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

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
"let g:neobundle#types#git#default_protocol="git"
"let g:neobundle_default_git_protocol="git"

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'janlay/NERD-tree-project'
NeoBundle 'jistr/vim-nerdtree-tabs'

NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'okcompute/vim-ctrlp-session'
NeoBundle 'mileszs/ack.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neomru.vim'

NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'terryma/vim-multiple-cursors'


NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'vim-scripts/LargeFile'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'honza/vim-snippets'


 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
" }}} end neobundle

" for win {{{
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
" }}} end for win

" common setting {{{
set nu
colo adrian
if has("win32") || has("win64")
set guifont=Courier_New:h12
endif
set t_Co=256
"set autochdir
" Set mapleader
let mapleader=","

set   autoindent
set   autoread
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set   softtabstop=4
set   nobackup
set   cindent
set   cinoptions=:0
set   cursorline
set   completeopt=longest,menuone
set   expandtab
set   fileencodings=utf-8,gb2312,gbk,gb18030
set   fileformat=unix
set   foldenable
set   foldmethod=manual
set   guioptions-=T
set   guioptions-=m
set   guioptions-=r
set   guioptions-=l
set   helpheight=10
set   helplang=cn
set   hidden
set   history=100
set   hlsearch
set   ignorecase
set   incsearch
set   mouse=a
set   pumheight=10
set   ruler
set   scrolloff=5
set   shiftwidth=4
set   showcmd
set   smartindent
set   smartcase
set   tabstop=4
set   termencoding=utf-8
set   textwidth=80
set   whichwrap=h,l
set   wildignore=*.bak,*.o,*.e,*~
set   wildmenu
set   wildmode=list:longest,full
set   nowrap
set list
set listchars=tab:>-,trail:-
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
set ts=4

" plugin shortcuts
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction

" If you like control + arrow key to navigate windows
" then perform the remapping
noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l
nmap <leader>wo <C-w>o

nnoremap <space> :
vnoremap <space> :
syntax on
" }}} end common setting

"vim paste {{{
set clipboard=unnamed
set pastetoggle=<F4>
"}}}

" 复制到系统剪切板 {{{
map m "+y
map <leader>pp "*p
"}}}

" NERDTree.vim {{{
let g:NERDTreeMouseMode=2
let g:NERDTreeAutoCenter=1
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks = 1
let g:NERDChristmasTree = 1

"nnoremap <silent> <leader>f :NERDTreeFind<CR>
let g:NTPNames = ['.git','build.xml', 'Makefile', '.project', '.lvimrc','Android.mk']
let g:NTPNames = add(g:NTPNames, 'SConstruct')
call extend(g:NTPNames, ['*.sln', '*.csproj'])

let g:NTPNamesDirs = ['.git', '*.xcodeproj', '*.xcworkspace']

"set rtp+=~/.vim/bundle/NERD_tree-Project 
"let g:NTPNames = add(g:NTPNames, 'SConstruct')
"let g:NTPNames = add(g:NTPNames, '.git')
"extend(g:NTPNames, ['*.sln', '*.csproj','.git','.project','SConstruct'])

nnoremap  <F3> :ToggleNERDTree<cr>
nnoremap <Leader>nn <plug>NERDTreeTabsToggle<CR>
"}}} end NERDTree.vim

" tagbar {{{
let g:tagbar_left = 1
let g:tagbar_width = 25
nnoremap <silent> <F2> :TagbarToggle<CR>
"}}}

" vim-ctrlp-session {{{
let g:ctrlp_session_path = '$VIM/session_files'

" The prefix key.
nnoremap    [ctrlp]   <Nop>
nmap  f [ctrlp]

nnoremap <silent> [ctrlp]e  :<C-u>CtrlPBuffer<CR>
nnoremap <leader>e :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [ctrlp]s  :<C-u>CtrlPSession<CR>
nnoremap [ctrlp]n :<C-u>Session<Space>

"}}}

"ack.vim {{{

"}}}

" for ctags {{{
set tags=tags
" for qt-cppcomplete, added by LiaoLiang Nov28,2008
"set tags+=/opt/qtsdk-2010.05/tags
"set tags+=/home/linux/linux-2.6.35/tags
"set tags+=/usr/include/tags
"set tags+=/home/badwtg1111/ortp-0.20.0/tags
"set tags+=/home/badwtg1111/oss-devel/tags
"set tags+=/home/badwtg1111/glibc-2.16.0/tags
"set tags+=/usr/include/c++/tags
"set tags+=/home/badwtg1111/cpp
"
set tags+=/home/chenchunsheng/qc4.4_20140513/packages/tags
set tags+=/home/chenchunsheng/qc4.4_20140513/development/tags
"set tags+=/home/chenchunsheng/workdir/test_tiff/jni/tags


" for qc4.4
set tags+=/home/chenchunsheng/qc4.4_20140513/vendor/tags

set tags+=/home/chenchunsheng/qc4.4_20140513/frameworks/tags
set tags+=/home/chenchunsheng/qc4.4_20140513/system/tags

set tags+=/home/chenchunsheng/qc4.4_20140513/external/tags
set tags+=/home/chenchunsheng/qc4.4_20140513/hardware/tags

set tags+=/home/chenchunsheng/workdir/mysql/tags
set tags+=/home/chenchunsheng/workdir/mysql-5.6.22/tags
" for lte-mol
"set tags+=/home/chenchunsheng/lte-mol/frameworks/tags
"set tags+=/home/chenchunsheng/lte-mol/vendor/tags
"}}}

"for cscope {{{
if has("cscope") && filereadable("/usr/bin/cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
       cs add cscope.out $PROJ
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB $PROJ
    endif
    set csverb
endif
"cscope设置
"set cscopequickfix=s-,c-,d-,i-,t-,e-

"nmap s :cs find s =expand("") 
" :cw    "查找声明
"nmap g :cs find g =expand("") 
":cw     "查找定义
"nmap c :cs find c =expand("") 
":cw    "查找调用
"nmap t :cs find t =expand("") :cw    
"查找指定的字符串
"nmap e :cs find e =expand("") 
":cw    "查找egrep模式，相当于egrep功能，但查找速度快多了
"nmap f :cs find f =expand("") 
":cw    "查找文件
"nmap i :cs find i ^=expand("")$ 
":cw   "查找包含本文件的文件
"nmap d :cs find d =expand("")  
":cw   "查找本函数调用的函数
nmap <leader>sa :cs add cscope.out<cr>
nmap <leader>sq :cs add $CSCOPE_DB $PROJ<cr>

nmap <leader>sba :cs add /home/chenchunsheng/qc4.4_20140513/packages/cscope.out /home/chenchunsheng/qc4.4_20140513/packages <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/development/cscope.out /home/chenchunsheng/qc4.4_20140513/development <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/vendor/cscope.out /home/chenchunsheng/qc4.4_20140513/vendor <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/external/cscope.out /home/chenchunsheng/qc4.4_20140513/external <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/frameworks/cscope.out /home/chenchunsheng/qc4.4_20140513/frameworks <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/system/cscope.out /home/chenchunsheng/qc4.4_20140513/system <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/hardware/cscope.out /home/chenchunsheng/qc4.4_20140513/hardware <cr>
            \:cs add /home/chenchunsheng/workdir/mysql/cscope.out /home/chenchunsheng/workdir/mysql <cr>
            \:cs add /home/chenchunsheng/workdir/mysql-5.6.22/cscope.out /home/chenchunsheng/workdir/mysql-5.6.22 <cr>

nmap <leader>sbb :cs add /home/chenchunsheng/qc4.4_20140513/packages/cscope.out /home/chenchunsheng/qc4.4_20140513/packages <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/development/cscope.out /home/chenchunsheng/qc4.4_20140513/development <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/vendor/cscope.out /home/chenchunsheng/qc4.4_20140513/vendor <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/external/cscope.out /home/chenchunsheng/qc4.4_20140513/external <cr>
            \:cs add /home/chenchunsheng/t2_20150302/frameworks/cscope.out /home/chenchunsheng/t2_20150302/frameworks <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/system/cscope.out /home/chenchunsheng/qc4.4_20140513/system <cr>
            \:cs add /home/chenchunsheng/qc4.4_20140513/hardware/cscope.out /home/chenchunsheng/qc4.4_20140513/hardware <cr>
            \:cs add /home/chenchunsheng/workdir/mysql/cscope.out /home/chenchunsheng/workdir/mysql <cr>
            \:cs add /home/chenchunsheng/workdir/mysql-5.6.22/cscope.out /home/chenchunsheng/workdir/mysql-5.6.22 <cr>

nmap <leader>sm :cs show<cr>


nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>

nmap <F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>

"for qc4.4
"cs add /home/chenchunsheng/qc4.4_20140513/packages/cscope.out /home/chenchunsheng/qc4.4_20140513/packages 
"cs add /home/chenchunsheng/qc4.4_20140513/development/cscope.out /home/chenchunsheng/qc4.4_20140513/development 
"cs add /home/chenchunsheng/qc4.4_20140513/vendor/cscope.out /home/chenchunsheng/qc4.4_20140513/vendor 
"cs add /home/chenchunsheng/qc4.4_20140513/external/cscope.out /home/chenchunsheng/qc4.4_20140513/external 
"cs add /home/chenchunsheng/qc4.4_20140513/frameworks/cscope.out /home/chenchunsheng/qc4.4_20140513/frameworks

"
"cs add /home/chenchunsheng/workdir/test_tiff/jni/cscope.out /home/chenchunsheng/workdir/test_tiff/jni
" for lte
"cs add /home/chenchunsheng/lte-mol/frameworks/cscope.out /home/chenchunsheng/lte-mol/frameworks
"cs add /home/chenchunsheng/lte-mol/vendor/cscope.out /home/chenchunsheng/lte-mol/vendor
"}}}

"for neosnippet {{{
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

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

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

" neocomplete {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"}}}
