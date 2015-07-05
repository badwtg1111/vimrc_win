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
NeoBundle 'gmarik/Vundle.vim'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
" }}} end neobundle

" Vundle.vim {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let &runtimepath .= ',' . expand(s:vimfiles . "bundle/Vundle.vim/")
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin(expand(s:vimfiles . "bundle/"))

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" for ctrlp
Plugin 'vim-scripts/ctrlp-z'
Plugin 'the9ball/ctrlp-gtags'
Plugin 'brookhong/k.vim'
Plugin 'voronkovich/ctrlp-nerdtree.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'elentok/ctrlp-objects.vim'
Plugin 'h14i/vim-ctrlp-buftab'
Plugin 'vim-scripts/ctrlp-cmdpalette'
Plugin 'mattn/ctrlp-windowselector'
Plugin 'thiderman/ctrlp-project'
Plugin 'mattn/ctrlp-google'
Plugin 'ompugao/ctrlp-history'
Plugin 'mattn/ctrlp-launcher'
Plugin 'sgur/ctrlp-extensions.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'JazzCore/ctrlp-cmatcher'



" for unite
Plugin 'Shougo/unite.vim'
Plugin 'tsukkee/unite-help'
Plugin 'Sixeight/unite-grep'
Plugin 'kmnk/vim-unite-giti'
Plugin 'hewes/unite-gtags'
Plugin 'mattn/unite-vim_advent-calendar'
Plugin 't9md/vim-unite-ack'
Plugin 'daisuzu/unite-adb'
Plugin 'ujihisa/unite-font'
Plugin 'ujihisa/unite-locate'
Plugin 'Shougo/unite-outline'
Plugin 'tsukkee/unite-tag'
Plugin 'ujihisa/unite-launch'
Plugin 'osyo-manga/unite-filetype'
Plugin 'thinca/vim-unite-history'
Plugin 'osyo-manga/unite-airline_themes'
Plugin 'kannokanno/unite-dwm'
Plugin 'raw1z/unite-projects'
Plugin 'voi/unite-ctags'
Plugin 'osyo-manga/unite-quickfix'
Plugin 'hrsh7th/vim-versions'
Plugin 'junkblocker/unite-codesearch'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'tacroe/unite-mark'
Plugin 'tacroe/unite-alias'
Plugin 'tex/vim-unite-id'
Plugin 'Shougo/unite-session'
Plugin 'lambdalisue/unite-grep-vcs'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"}}} end Vundle.vim



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
nmap  t [ctrlp]

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



"for gtags-cscope {{{
"" settings of cscope.
"" I use GNU global instead cscope because global is faster.
"set cscopetag
"set cscopeprg=gtags-cscope
"cs add /home/chenchunsheng/qc4.4_20140513/GTAGS

"set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-
"nmap <silent> <leader>vj <ESC>:cstag <c-r><c-w><CR>
"nmap <silent> <leader>vc <ESC>:lcs f c <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>vd <ESC>:lcs f d <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>ve <ESC>:lcs f e <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>vf <ESC>:lcs f f <C-R>=expand("<cfile>")<cr><cr>
"nmap <silent> <leader>vg <ESC>:lcs f g <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>vi <ESC>:lcs f i <C-R>=expand("<cfile>")<cr><cr>
"nmap <silent> <leader>vs <ESC>:lcs f s <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>vt <ESC>:lcs f t <C-R>=expand("<cword>")<cr><cr>
"command! -nargs=+ -complete=dir FindFiles :call FindFiles(<f-args>)
"au VimEnter * call VimEnterCallback()
"au BufAdd *.[ch] call FindGtags(expand('<afile>'))
"au BufWritePost *.[ch] call UpdateGtags(expand('<afile>'))
  
"function! FindFiles(pat, ...)
     "let path = ''
     "for str in a:000
         "let path .= str . ','
     "endfor
  
     "if path == ''
         "let path = &path
     "endif
  
     "echo 'finding...'
     "redraw
     "call append(line('$'), split(globpath(path, a:pat), '\n'))
     "echo 'finding...done!'
     "redraw
 "endfunc
  
"function! VimEnterCallback()
     "for f in argv()
         "if fnamemodify(f, ':e') != 'c' && fnamemodify(f, ':e') != 'h'
             "continue
         "endif
  
         "call FindGtags(f)
     "endfor
"endfunc
  
"function! FindGtags(f)
     "let dir = fnamemodify(a:f, ':p:h')
     "while 1
         "let tmp = dir . '/GTAGS'
         "if filereadable(tmp)
             "exe 'cs add ' . tmp . ' ' . dir
             "break
         "elseif dir == '/'
             "break
         "endif
  
         "let dir = fnamemodify(dir, ":h")
     "endwhile
"endfunc
  
"function! UpdateGtags(f)
     "let dir = fnamemodify(a:f, ':p:h')
     "exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
"endfunction
"}}}


"for taghighlight {{{
"
""let s:plugin_paths = split(globpath(&rtp, 'plugin/TagHighlight/TagHighlight.py'), '\n') --> in taghighlight.vim
""let s:plugin_paths = split('~/.vim/bundle/TagHighlight/plugin/TagHighlight/TagHighlight.py', '\n')
"
"
"hi Class                ctermfg=205   cterm=bold
"hi Structure            ctermfg=205   cterm=bold
"hi DefinedName          ctermfg=49    cterm=bold
"hi Member              ctermfg=244
"hi Label                   ctermfg=21    cterm=bold
"hi EnumerationName      ctermfg=19
"hi EnumerationValue     ctermfg=57
"hi LocalVariable        ctermfg=100
"hi GlobalVariable       ctermfg=93

"}}}

"for k.vim {{{
nnoremap <silent> <leader>qe :CtrlPK<CR>
"}}}

"for ctrlp_nerdtree {{{
let g:ctrlp_nerdtree_show_hidden = 1
"}}}

" comment for ctrlp-funky {{{
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
" }}}


"for indentLine {{{
let g:indentLine_color_term = 112
"}}}

" for doxygen toolkit {{{
let g:DoxygenToolkit_briefTag_pre="@Synopsis "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns "
let g:DoxygenToolkit_blockHeader="----------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------"
let g:DoxygenToolkit_licenseTag="My own license"
let g:DoxygenToolkit_authorName="chen.chunsheng, badwtg1111@hotmail.com"
let s:licenseTag = "Copyright(C)\ "
let s:licenseTag = s:licenseTag . "For free\ "
let s:licenseTag = s:licenseTag . "All Rights Reserved\ "
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
"}}}

"for vimfiler {{{
let g:vimfiler_as_default_explorer = 1
"}}}

" LookupFile setting {{{
let g:LookupFile_TagExpr='"./tags.filename"'
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0
nmap  <F8> <Plug>LookupFile<cr>
"}}}

"for webdict in vim-ref{{{

"webdictサイトの設定
let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\   'cn': {
\     'url': 'http://www.iciba.com/%s',
\   },
\   'wikipedia:en':{'url': 'http://en.wikipedia.org/wiki/%s',  },
\   'bing':{'url': 'http://cn.bing.com/search?q=%s', },
\ }


"デフォルトサイト
let g:ref_source_webdict_sites.default = 'cn'
"let g:ref_source_webdict_cmd='lynx -dump -nonumbers %s'
"let g:ref_source_webdict_cmd='w3m -dump %s'
"出力に対するフィルタ。最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ej.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wiki.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction

nmap <Leader>rj :<C-u>Ref webdict je<Space>
nmap <Leader>re :<C-u>Ref webdict ej<Space>
nmap <Leader>rc :<C-u>Ref webdict cn<Space>
nmap <Leader>rw :<C-u>Ref webdict wikipedia:en<Space>
nmap <Leader>rb :<C-u>Ref webdict bing<Space>

"}}}

" -- syntastic.vim {{{
"let g:syntastic_javascript_jshint_arg = "~/.vim/jshintrc"
let g:syntastic_error_symbol='?' " ? ? ? ?
let g:syntastic_warning_symbol='?' " ?  ?
" }}}

" for codesearch{{{
" Make search case insensitive
let g:unite_source_codesearch_ignore_case = 1
call unite#custom#source('codesearch', 'max_candidates', 30)
"}}}

"for buftabs {{{
noremap <Leader>bp :bprev<CR>
noremap <Leader>bn :bnext<CR>
"}}}


" comment for ctrlp {{{
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_root_markers = '.projectile'

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'
let g:ctrlp_show_hidden = 1
"for caching
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $VIM.'/.cache/ctrlp'

"set runtimepath^=~/.vim/bundle/ctrlp.vim 
"let g:ctrlp_map = ',,'
"let g:ctrlp_open_multiple_files = 'v'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|png|jpg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"let g:ctrlp_user_command = {
    "\ 'types': {
        "\ 1: ['.git', 'cd %s && git ls-files'],
        "\ 2: ['.hg', 'hg --cwd %s locate -I .'],
        "\ },
    "\ 'fallback': 'find %s -type f'
    "\ }

"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      "\ --ignore out
      "\ --ignore .git
      "\ --ignore .svn
      "\ --ignore .hg
      "\ --ignore .DS_Store
      "\ --ignore "**/*.pyc"
      "\ -g ""'
      

let g:ctrlp_user_command = {
    \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
    \ 'fallback': 'ag %s -i --nocolor --nogroup --hidden
                    \ --ignore out
                    \ --ignore .git
                    \ --ignore .svn
                    \ --ignore .hg
                    \ --ignore .DS_Store
                    \ --ignore "**/*.pyc"
                    \ -g ""'
    \ }
	
"    \ 'fallback': 'dir %s /-n /b /s /a-d'

let g:ctrlp_max_files = 0
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }


nnoremap <Leader>kk :CtrlPMixed<Cr>

"}}}

"for ctrlp-cmatcher {{{

"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

"}}}

" for ctrlp-launcher {{{
nnoremap <Leader>pl :<c-u>CtrlPLauncher<cr>
"}}}



"for unite {{{ 



call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {'no_split':1, 'resize':0})


"" ------------  define custom action -------------------------------------------
"" file_association
"let s:file_association = {
"\   'description' : 'open withd file associetion'
"\    , 'is_selectable' : 1
"\    }

"function! s:file_association.func(candidates)
    "for l:candidate in a:candidates
        "" .vimrcに関数の定義有り
        "call OpenFileAssociation(l:candidate.action__path)
    "endfor
"endfunction

"call unite#custom_action('openable', 'file_association', s:file_association)
"unlet s:file_association



"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
"let g:unite_enable_split_vertically = 1
let g:unite_source_file_mru_time_format = "%m/%d %T "
let g:unite_source_directory_mru_limit = 80
let g:unite_source_directory_mru_time_format = "%m/%d %T "
let g:unite_source_file_rec_max_depth = 6

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_data_directory='~/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='>> '
let g:unite_split_rule = 'botright'
let g:unite_winheight=25
let g:unite_source_grep_default_opts = "-iRHn"
\ . " --exclude='tags'"
\ . " --exclude='cscope*'"
\ . " --exclude='*.svn*'"
\ . " --exclude='*.log*'"
\ . " --exclude='*tmp*'"
\ . " --exclude-dir='**/tmp'"
\ . " --exclude-dir='CVS'"
\ . " --exclude-dir='.svn'"
\ . " --exclude-dir='.git'"
\ . " --exclude-dir='node_modules'"


let g:unite_source_grep_max_candidates = 200

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack') 
    " For ack.
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    " Use pt in unite grep source.
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
    " For jvgrep.
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
elseif executable('ack-grep')
    " Use ack in unite grep source.
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
                \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
endif


""" my custom unite config
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
            \ -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
            \ -buffer-name=files -prompt=%\  buffer bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
            \ -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>

nnoremap <silent> [unite]s  :<C-u>Unite session<CR>
nnoremap <silent> [unite]n  :<C-u>Unite session/new<CR>


nnoremap <silent> [unite]fr
            \ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]ma
            \ :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me
            \ :<C-u>Unite output:message<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>

nnoremap <silent> [unite]w
            \ :<C-u>Unite -buffer-name=files -no-split
            \ jump_point file_point buffer_tab
            \ file_rec:! file file/new<CR>

" Start insert.
"call unite#custom#profile('default', 'context', {
"\   'start_insert': 1
"\ })

" Like ctrlp.vim settings.
"call unite#custom#profile('default', 'context', {
"\   'start_insert': 1,
"\   'winheight': 10,
"\   'direction': 'botright',
"\ })

" Prompt choices.
"call unite#custom#profile('default', 'context', {
"\   'prompt': '>> ',
"\ })

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " Overwrite settings.

    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-n>   <Plug>(unite_select_next_line)
    nmap <buffer> <C-n>   <Plug>(unite_select_next_line)
    imap <buffer> <C-p>   <Plug>(unite_select_previous_line)
    nmap <buffer> <C-p>   <Plug>(unite_select_previous_line)
    


    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
                \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
    imap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
                \ unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
        nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
                \ empty(unite#mappings#get_current_filters()) ?
                \ ['sorter_reverse'] : [])

    " Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')

endfunction"}}}


""" end for my custom unite config
"" File search

"nnoremap <silent><C-p> :Unite -no-split -start-insert file_rec buffer<CR>
"nnoremap <leader>mm :Unite -auto-resize file file_mru file_rec<cr>
nnoremap <leader>mm :Unite   -no-split -start-insert   file file_mru file_rec buffer<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>tf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>mr :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>tb :<C-u>Unite -no-split -buffer-name=buffer_tab  buffer_tab<cr>

"" shortcup for key mapping
nnoremap <silent><leader>u  :<C-u>Unite -start-insert mapping<CR>

"" Execute help.
nnoremap <silent><leader>h  :Unite -start-insert -no-split help<CR>
" Execute help by cursor keyword.
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>
"" Tag search

""" For searching the word in the cursor in tag file
nnoremap <silent><leader>f :Unite -no-split tag/include:<C-R><C-w><CR>

nnoremap <silent><leader>ff :Unite tag/include -start-insert -no-split<CR>

"" grep dictionay

""" For searching the word in the cursor in the current directory
nnoremap <silent><leader>v :Unite -auto-preview -no-split grep:.::<C-R><C-w><CR>

nnoremap <space>/ :Unite -auto-preview grep:.<cr>

""" For searching the word handin
nnoremap <silent><leader>vs :Unite -auto-preview -no-split grep:.<CR>

""" For searching the word in the cursor in the current buffer
noremap <silent><leader>vf :Unite -auto-preview -no-split grep:%::<C-r><C-w><CR>

""" For searching the word in the cursor in all opened buffer
noremap <silent><leader>va :Unite -auto-preview -no-split grep:$buffers::<C-r><C-w><CR>

nnoremap <silent><leader>vg :Unite -auto-preview -no-split grep/git:.::<C-R><C-w><CR>

"" outline
"nnoremap <leader>o :Unite -start-insert -no-split outline<CR>

nnoremap <leader>o :<C-u>Unite -buffer-name=outline   -start-insert -auto-preview -no-split outline<cr>
"" Line search
nnoremap <leader>l :Unite line -start-insert  -auto-preview -no-split<CR>

"" Yank history
nnoremap <leader>y :<C-u>Unite -no-split -auto-preview -buffer-name=yank history/yank<cr>
"nnoremap <space>y :Unite history/yank<cr>

" search plugin
" :Unite neobundle/search

nnoremap <space>s :Unite -quick-match -auto-preview buffer<cr>


"for Unite menu{

let g:unite_source_menu_menus = {}
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
"}
"}}}


"for unite-gtags {{{

nnoremap <leader>gd :execute 'Unite  -auto-preview -start-insert -no-split  gtags/def:'.expand('<cword>')<CR>
nnoremap <leader>gc :execute 'Unite  -auto-preview -start-insert -no-split gtags/context'<CR>
nnoremap <leader>gr :execute 'Unite  -auto-preview -start-insert -no-split gtags/ref'<CR>
nnoremap <leader>gg :execute 'Unite  -auto-preview -start-insert -no-split gtags/grep'<CR>
nnoremap <leader>gp :execute 'Unite  -auto-preview -start-insert -no-split gtags/completion'<CR>
vnoremap <leader>gd <ESC>:execute 'Unite -auto-preview -start-insert -no-split gtags/def:'.GetVisualSelection()<CR>

let g:unite_source_gtags_project_config = {
  \ '_':                   { 'treelize': 0 }
  \ }
" specify your project path as key.
" '_' in key means default configuration.
" }}}

