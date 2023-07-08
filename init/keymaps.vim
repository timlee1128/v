"----------------------------------------------------------------------
" 智能选择区域
"----------------------------------------------------------------------
" v选择下个单词/段落 ctrl-v回退选择
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"----------------------------------------------------------------------
" 粘贴板
"----------------------------------------------------------------------
set clipboard=unnamed  " 复制粘贴到系统粘贴板

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
" 文件和项目管理
"----------------------------------------------------------------------
if exists(':NvimTreeToggle')
  let g:which_key_map['t'] = {
    \ 'name' : '+tree',
    \ 't': [':NvimTreeToggle<CR>', 'Toggle file tree']
    \}
endif

" 定义 Telescope 相关的快捷键映射
let g:which_key_map.p = {'name': '+Telescope'}
let g:which_key_map.p.f = 'Find files'
let g:which_key_map.p.g = 'Grep files'
let g:which_key_map.p.b = 'List buffers'
let g:which_key_map.p.h = 'Help tags'

" 快捷键映射
nnoremap <silent> <Leader>pf :<C-u>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent> <Leader>pg :<C-u>lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent> <Leader>pb :<C-u>lua require('telescope.builtin').buffers()<CR>
nnoremap <silent> <Leader>ph :<C-u>lua require('telescope.builtin').help_tags()<CR>

"----------------------------------------------------------------------
" 外观和界面增强
"----------------------------------------------------------------------

" 窗口快捷键定义
let g:which_key_map['w'] = {
	\ 'name' : '+windows'      ,
	\ 'w' : ['<C-W>w'          , 'Other window']                   ,
  \ 'n' : ['vnew'            , 'New window']                     ,
	\ 'd' : ['<C-W>c'          , 'Delete window']                  ,
	\ 's' : ['<C-W>s'          , 'Split window below']             ,
	\ 'v' : ['<C-W>v'          , 'Split window right']             ,
	\ 'h' : ['<C-W>h'          , 'Window left']                    ,
	\ 'j' : ['<C-W>j'          , 'Window below']                   ,
	\ 'l' : ['<C-W>l'          , 'Window right']                   ,
	\ 'k' : ['<C-W>k'          , 'Window up']                      ,
	\ 'H' : ['<C-W>H'          , 'Move window to the very left']   ,
	\ 'J' : ['<C-W>J'          , 'Move window to the very bottom'] ,
	\ 'L' : ['<C-W>L'          , 'Move window to the very right']  ,
	\ 'K' : ['<C-W>K'          , 'Move window to the very top']    ,
	\ '=' : ['<C-W>='          , 'Balance window']                 ,
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
" 实用功能
"----------------------------------------------------------------------
let g:which_key_map['u'] = {
  \ 'name': '+utility',
  \ }

"----------------------------------------------------------------------
" vim-which-key 配置结束
"----------------------------------------------------------------------
