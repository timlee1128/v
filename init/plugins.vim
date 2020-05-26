"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = ['basic', 'tags', 'enhanced', 'filetypes', 'textobj']
	let g:bundle_group += ['tags', 'airline', 'nerdtree', 'ale', 'echodoc']
	let g:bundle_group += ['leaderf']
endif


"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/v')
  call dein#begin('~/.cache/v')
"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
" Let dein manage dein
" Required:
call dein#add('~/.cache/v/repos/github.com/Shougo/dein.vim')
call dein#add('wsdjeg/dein-ui.vim')

"----------------------------------------------------------------------
" 默认插件 
"----------------------------------------------------------------------
" 快捷键工具
call dein#add('liuchengxu/vim-which-key', {
			\ 'on_cmd': '[Whichkey, Whichkey!]',
			\ 'hook_add': join(['let g:which_key_map = {}', 'let mapleader="\<Space>"'], '\n'),
			\	'hook_post_source': 'call which_key#register("<Space>", "g:which_key_map")'
			\})

" 漂亮的弹窗
call dein#add('liuchengxu/vim-clap', {'build': 'sh install.sh'})


"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0
	call dein#add('preservim/nerdtree')
endif


"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable


"----------------------------------------------------------------------
" If you want to install not installed plugins on startup.
"----------------------------------------------------------------------
"if dein#check_install()
" call dein#install()
"endif
