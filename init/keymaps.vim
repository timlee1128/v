"----------------------------------------------------------------------
" 智能选择区域
"----------------------------------------------------------------------
" v选择下个单词/段落 ctrl-v回退选择
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"----------------------------------------------------------------------
" 粘贴板
"----------------------------------------------------------------------
noremap ]y "*y
noremap ]p "*p

"----------------------------------------------------------------------
" vim-which-key 配置开始
"----------------------------------------------------------------------
let mapleader="\<Space>"
let g:which_key_map = {}
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

set timeoutlen=1000
let g:which_key_disable_default_offset = 1

"----------------------------------------------------------------------
" 窗口快捷键定义
"----------------------------------------------------------------------

let g:which_key_map['w'] = {
	\ 'name' : '+windows'      ,
	\ 'w' : ['<C-W>w'          , 'other-window']                   ,
  \ 'n' : ['vnew'            , 'new window']                     ,
	\ 'd' : ['<C-W>c'          , 'delete-window']                  ,
	\ 's' : ['<C-W>s'          , 'split-window-below']             ,
	\ 'v' : ['<C-W>v'          , 'split-window-right']             ,
	\ 'h' : ['<C-W>h'          , 'window-left']                    ,
	\ 'j' : ['<C-W>j'          , 'window-below']                   ,
	\ 'l' : ['<C-W>l'          , 'window-right']                   ,
	\ 'k' : ['<C-W>k'          , 'window-up']                      ,
	\ 'H' : ['<C-W>H'          , 'Move window to the very left']   ,
	\ 'J' : ['<C-W>J'          , 'Move window to the very bottom'] ,
	\ 'L' : ['<C-W>L'          , 'Move window to the very right']  ,
	\ 'K' : ['<C-W>K'          , 'Move window to the very top']    ,
	\ '=' : ['<C-W>='          , 'balance-window']                 ,
	\ }

nnoremap <c-h> <c-w>10<
nnoremap <c-l> <c-w>10>
map <c-j> :resize +20<CR>
map <c-k> :resize -20<CR>

nnoremap <silent><leader>1 :1wincmd w<CR>
nnoremap <silent><leader>2 :2wincmd w<CR>
nnoremap <silent><leader>3 :3wincmd w<CR>
nnoremap <silent><leader>4 :4wincmd w<CR>
nnoremap <silent><leader>5 :5wincmd w<CR>
nnoremap <silent><leader>6 :6wincmd w<CR>
let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'

"----------------------------------------------------------------------
" vim-which-key 配置结束
"----------------------------------------------------------------------
