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
nmap  g [ctrlp]

nnoremap <silent> [ctrlp]e  :<C-u>CtrlPBuffer<CR>
nnoremap <leader>e :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [ctrlp]s  :<C-u>CtrlPSession<CR>
nnoremap [ctrlp]n :<C-u>Session<Space>

"}}}

"ack.vim {{{

"}}}
