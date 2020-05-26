"----------------------------------------------------------------------
" vim-which-key 配置
"----------------------------------------------------------------------

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

set timeoutlen=1000
let g:which_key_disable_default_offset = 1


"----------------------------------------------------------------------
" 窗口快捷键定义
"----------------------------------------------------------------------

let g:which_key_map['w'] = {
	\ 'name' : '+windows' ,
	\ 'w' : ['<C-W>w'     , 'other-window']          ,
	\ 'd' : ['<C-W>c'     , 'delete-window']         ,
	\ 's' : ['<C-W>s'     , 'split-window-below']    ,
	\ 'v' : ['<C-W>v'     , 'split-window-right']    ,
	\ 'h' : ['<C-W>h'     , 'window-left']           ,
	\ 'j' : ['<C-W>j'     , 'window-below']          ,
	\ 'l' : ['<C-W>l'     , 'window-right']          ,
	\ 'k' : ['<C-W>k'     , 'window-up']             ,
	\ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
	\ 'J' : ['resize +5'  , 'expand-window-below']   ,
	\ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
	\ 'K' : ['resize -5'  , 'expand-window-up']      ,
	\ '=' : ['<C-W>='     , 'balance-window']        ,
	\ }

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
" 查找快捷键定义
"----------------------------------------------------------------------
let g:which_key_map['f'] = {'name': '+find'}

map <C-n> :NERDTreeToggle<CR>
map <leader>ft :NERDTreeToggle<CR>
let g:which_key_map.f.t = 'Open file tree'

nnoremap <silent> <Leader>fw :<C-u>Clap grep<CR>
let g:which_key_map.f.w = 'Find Word'

nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
let g:which_key_map.f.f = 'Find File'

nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
let g:which_key_map.f.v = 'Find visual text'

nnoremap <silent> <Leader>fu :<C-u>Clap grep ++query=<cword><cr>
let g:which_key_map.f.u = 'Find the word under cursor'

"----------------------------------------------------------------------
" 工具箱
"----------------------------------------------------------------------
let g:which_key_map['t'] = {'name': '+tool'}

nnoremap <silent> <Leader>tc :<C-u>Clap<CR>
let g:which_key_map.t.c = 'Clap'
