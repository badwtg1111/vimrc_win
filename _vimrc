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
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()    " End Bundle Installation

" Required:
filetype plugin indent on
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"}}}
