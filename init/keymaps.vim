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
" vim-which-key 配置
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
" 查找快捷键定义
"----------------------------------------------------------------------
let g:which_key_map['f'] = {'name': '+find'}

map <leader>ft :NERDTreeToggle<CR>
" map <silent><leader>ft :call Defx_style()<cr>
let g:which_key_map.f.t = 'Open file tree'

function! Defx_style() abort
  call defx#custom#option('_', {
        \ 'winwidth': 28,
        \ 'split': 'vertical',
        \ 'direction': 'topleft',
        \ 'columns': 'mark:indent:git:icons:filename:type',
        \ 'toggle': 1
        \})

  :Defx
endfunction

nnoremap <silent> <Leader>fw :<C-u>Clap grep<CR>
let g:which_key_map.f.w = 'Find Word'

nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
let g:which_key_map.f.f = 'Find File'

nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
let g:which_key_map.f.v = 'Find visual text'

nnoremap <silent> <Leader>fu :<C-u>Clap grep ++query=<cword><cr>
let g:which_key_map.f.u = 'Find the word under cursor'

nnoremap <silent> <leader>fc :<C-u>CocConfig<CR>
let g:which_key_map.f.c = 'Open Coc Config'

nnoremap <silent> <leader>fs :<C-u>source %<CR>
let g:which_key_map.f.s = 'Source current file'

nnoremap <silent> <leader>fb :<c-u>Clap buffers<cr>
let g:which_key_map.f.b = 'Find buffer'


"----------------------------------------------------------------------
" 跳转快捷键定义
"----------------------------------------------------------------------
let g:which_key_map['j'] = {'name': '+jump'}

let g:which_key_map.j.e = {'name': 'Jump to error'}
nmap <silent> <Leader>jen <Plug>(coc-diagnostic-next)
let g:which_key_map.j.e.n = 'Jump to next error'
nmap <silent> <Leader>jep <Plug>(coc-diagnostic-prev)
let g:which_key_map.j.e.p = 'Jump to prev error'

nmap <silent> <Leader>jd <Plug>(coc-definition)
let g:which_key_map.j.d = 'Jump to definition'

nmap <silent> <Leader>jt <Plug>(coc-type-definition)
let g:which_key_map.j.t = 'Jump to type'

nmap <silent> <Leader>jD <Plug>(coc-declaration)
let g:which_key_map.j.D = 'Jump to Declaration'

nmap <silent> <Leader>ji <Plug>(coc-implementation)
let g:which_key_map.j.i = 'Jump to implementation'

nmap <silent> <Leader>jr <Plug>(coc-references)
let g:which_key_map.j.r = 'Jump to references'

nmap <silent> <Leader>jl <Plug>(coc-openlink)
let g:which_key_map.j.l = 'Jump to link'

map <silent> <Leader>jf <Plug>(easymotion-overwin-f)
let g:which_key_map.j.f = 'Jump to finded char'

map <silent><Leader>jT :<c-u>Vista!!<CR>
let g:which_key_map.j.T = 'Jump to tag'
"----------------------------------------------------------------------
" Git 快捷键定义
"----------------------------------------------------------------------
let g:which_key_map.g = {'name': '+Git'}

let g:which_key_map.g.s = 'Git status'
map <silent> <Leader>gs :Gstatus<CR>

let g:which_key_map.g.d = 'Git diff vert split'
map <silent> <Leader>gd :Gvdiffsplit<CR>

let g:which_key_map.g.b = "Git blame"
map <silent> <Leader>gb :Gblame<CR>

let g:which_key_map.g.a = 'Git add all'
map <silent> <Leader>ga :Git add .<CR>

let g:which_key_map.g.w = 'Git write current file'
map <silent> <Leader>gw :Gwrite<CR>

let g:which_key_map.g.c = 'Git commit'
map <silent> <Leader>gc :Gcommit<CR>

let g:which_key_map.g.p = 'Git push'
map <silent> <Leader>gp :Git push<CR>

let g:which_key_map.g.P = 'Git pull'
map <silent> <Leader>gP :Gpull<CR>

let g:which_key_map.g.f = 'Git fetch'
map <silent> <Leader>gf :Gfetch<CR>

let g:which_key_map.g.l = 'Git log'
map <silent> <Leader>gl :Gllog<CR>

"----------------------------------------------------------------------
" Buffer
"----------------------------------------------------------------------
let g:which_key_map['b'] = {'name': '+buffer'}
" 自动整理当前buffer所有import引用，包括删除未使用到的import、多import归类整理、排序
let g:which_key_map.b.i = 'Organize Import' 
nnoremap <silent> <Leader>bi :call CocAction('runCommand', 'editor.action.organizeImport')<CR>

let g:which_key_map.b.f = 'Format buffer'
nnoremap <silent> <Leader>bf :call CocAction('format')<CR>

let g:which_key_map.b.r = 'Rename'
nmap <Leader>br <Plug>(coc-rename)

let g:which_key_map.b.R = 'Refactor'
nmap <Leader>bR <Plug>(coc-refactor)

let g:which_key_map.b.x = 'Fix'
nmap <Leader>bx <Plug>(coc-fix-current)

" TODO: 需要检查文档类型为js、ts再绑定键盘映射
let g:which_key_map.b.d = 'Doc function'
map <silent> <Leader>bd :JsDoc<CR>
let g:which_key_map.b.D = 'Doc buffer'
map <silent> <Leader>bD :JsDocFormat<CR>
"----------------------------------------------------------------------
" 工具箱
"----------------------------------------------------------------------
let g:which_key_map['t'] = {'name': '+tool'}

nnoremap <silent> <Leader>tc :<C-u>Clap<CR>
let g:which_key_map.t.c = 'Clap'

nnoremap <silent> <Leader>tt :call CocActionAsync('doHover')<CR>
let g:which_key_map.t.t = 'Translate the word under cursor'


"----------------------------------------------------------------------
" Coc
"----------------------------------------------------------------------

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 <tab> 补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" 使用 <shift-tab> 反向补全
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" 使用 <CR> 确认补全，并触发 coc.nvim 的 `formatOnType` 功能
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_snippet_next = '<tab>'
