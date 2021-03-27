"----------------------------------------------------------------------
" 默认情况下的分组，可以在前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = ['basic', 'tags', 'enhanced', 'filetypes', 'textobj']
	let g:bundle_group += ['tags', 'airline', 'coc']
endif


"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))


"----------------------------------------------------------------------
" 默认插件 
"----------------------------------------------------------------------

" 快捷键工具
Plug 'liuchengxu/vim-which-key'

" 漂亮的弹窗
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'easymotion/vim-easymotion'

" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

Plug 'mattn/emmet-vim'

Plug 'tpope/vim-repeat'

Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 8

if has('nvim')
  Plug 'equalsraf/neovim-gui-shim'
endif

Plug 'liuchengxu/vista.vim'
let g:vista_sidebar_width = 40
let g:vista_default_executive = 'coc'

Plug 'honza/vim-snippets'
Plug 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 1
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'underscore,react'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'terryma/vim-expand-region'
" Plug 'alpertuna/vim-header'
Plug 'roxma/vim-paste-easy'

"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0
	Plug 'preservim/nerdtree'
  let g:NERDTreeIgnore = ['^node_modules$']
  Plug 'Xuyuanp/nerdtree-git-plugin'
  let NERDTreeMinimalUI=1
 
	" 界面 icon 美化
	Plug 'ryanoasis/vim-devicons'
  let g:webdevicons_enable_nerdtree = 0

  if !has('nvim') && 0
    Plug 'shougo/defx.nvim'
    Plug 'kristijanhusak/defx-icons'
    Plug 'kristijanhusak/defx-git'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'

    autocmd FileType defx call s:defx_my_settings()
    autocmd BufEnter * call s:defx_cursor_set()

    function! s:defx_cursor_set() abort
      if has('nvim') && exists('g:GuiLoaded')
        if &filetype !=# 'defx'
          set guicursor=
          set nocul
        else
          set guicursor=n-v-c:hor1
          set cul
        endif
      endif
    endfunction

    function! s:defx_my_settings() abort
      " Define mappings
      nnoremap <silent><buffer><expr> <CR>
      \ defx#do_action('open')
      nnoremap <silent><buffer><expr> c
      \ defx#do_action('copy')
      nnoremap <silent><buffer><expr> m
      \ defx#do_action('move')
      nnoremap <silent><buffer><expr> p
      \ defx#do_action('paste')
      nnoremap <silent><buffer><expr> E
      \ defx#do_action('open', 'vsplit')
      nnoremap <silent><buffer><expr> o
      \ defx#do_action('open_tree', 'toggle')
      nnoremap <silent><buffer><expr> K
      \ defx#do_action('new_directory')
      nnoremap <silent><buffer><expr> N
      \ defx#do_action('new_file')
      nnoremap <silent><buffer><expr> M
      \ defx#do_action('new_multiple_files')
      nnoremap <silent><buffer><expr> C
      \ defx#do_action('toggle_columns',
      \                'mark:indent:icons:filename:type:size:time')
      nnoremap <silent><buffer><expr> D
      \ defx#do_action('remove')
      nnoremap <silent><buffer><expr> r
      \ defx#do_action('rename')
      nnoremap <silent><buffer><expr> !
      \ defx#do_action('execute_command')
      nnoremap <silent><buffer><expr> x
      \ defx#do_action('execute_system')
      nnoremap <silent><buffer><expr> yy
      \ defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> .
      \ defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> ;
      \ defx#do_action('repeat')
      nnoremap <silent><buffer><expr> h
      \ defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> l
      \ defx#do_action('open')
      nnoremap <silent><buffer><expr> ~
      \ defx#do_action('cd')
      nnoremap <silent><buffer><expr> i
      \ defx#do_action('toggle_select') . 'j'
      nnoremap <silent><buffer><expr> *
      \ defx#do_action('toggle_select_all')
      nnoremap <silent><buffer><expr> j
      \ line('.') == line('$') ? 'gg' : 'j'
      nnoremap <silent><buffer><expr> k
      \ line('.') == 1 ? 'G' : 'k'
      nnoremap <silent><buffer><expr> <C-l>
      \ defx#do_action('redraw')
      nnoremap <silent><buffer><expr> <C-g>
      \ defx#do_action('print')
      nnoremap <silent><buffer><expr> cd
      \ defx#do_action('change_vim_cwd')
    endfunction
  endif

	" 展示开始画面，显示最近编辑过的文件
	Plug 'mhinz/vim-startify'

	" 一次性安装一大堆 colorscheme
	Plug 'flazz/vim-colorschemes'

	" 侧栏行号相对化
	Plug 'myusuf3/numbers.vim'

	" 用于在侧边符号栏显示 git/svn 的 diff
	Plug 'mhinz/vim-signify'
	" signify 调优
	let g:signify_vcs_list = ['git', 'svn']
	let g:signify_sign_add               = '+'
	let g:signify_sign_delete            = '_'
	let g:signify_sign_delete_first_line = '‾'
	let g:signify_sign_change            = '~'
	let g:signify_sign_changedelete      = g:signify_sign_change

	" Git 支持
	Plug 'tpope/vim-fugitive'

	" 配对括号和引号自动补全
	Plug 'Raimondi/delimitMate'
  au FileType python let b:delimitMate_nesting_quotes = ['"', '`']
	" 增加cs, ds, ys等操作符, 用来快速输入包裹符号
	Plug 'tpope/vim-surround'

	" 注释
	Plug 'tpope/vim-commentary'

	" 符号配对美化
	Plug 'luochen1990/rainbow'
	let g:rainbow_active=1
endif


"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj') >= 0
	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'kana/vim-textobj-user'

	" indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
	Plug 'kana/vim-textobj-indent'

	" 语法文本对象：iy/ay 基于语法的文本对象
	Plug 'kana/vim-textobj-syntax'

	" 函数文本对象：if/af 支持 c/c++/vim/java/javascript
	Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java', 'javascript'] }
	Plug 'thinca/vim-textobj-function-javascript', {'for': ['javascript']}

	" 注释文本对象：ac/ic
	Plug 'glts/vim-textobj-comment'

	" 参数文本对象：i,/a, 包括参数或者列表元素
	Plug 'sgur/vim-textobj-parameter'

	" 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
	Plug 'bps/vim-textobj-python', {'for': 'python'}

	" 提供 uri/url 的文本对象，iu/au 表示
	Plug 'jceb/vim-textobj-uri'

	" xml 属性文本对象：ax/ix
	Plug 'whatyouhide/vim-textobj-xmlattr'
endif


"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
	let g:airline_exclude_preview = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.branch = ''
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.maxlinenr = ''
	let g:airline_theme='deus'
  let g:airline_skip_empty_sections = 1
	let g:airline#extensions#branch#enabled = 1
	let g:airline#extensions#syntastic#enabled = 1
	let g:airline#extensions#fugitiveline#enabled = 1
	let g:airline#extensions#csv#enabled = 0
	let g:airline#extensions#vimagit#enabled = 1
  let g:airline#extensions#coc#enabled = 1

	function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
	endfunction

	autocmd User AirlineAfterInit call airline#add_statusline_func('WindowNumber')
	autocmd User AirlineAfterInit call airline#add_inactive_statusline_func('WindowNumber')
endif


"----------------------------------------------------------------------
" coc
"----------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_config_home = s:path('coc')
let g:coc_disable_startup_warning = 1
autocmd CursorHold * silent call CocActionAsync('highlight')

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

let g:coc_global_extensions=[
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-ecdict',
      \ 'coc-emmet',
      \ 'coc-vetur',
      \ 'coc-vimlsp',
      \ 'coc-yank',
      \ 'coc-snippets'
      \]

if has('nvim')
  call add(g:coc_global_extensions, 'coc-actions')
elseif index(g:coc_global_extensions, 'coc-actions') > 0
  call remove(g:coc_global_extensions, index(g:coc_global_extensions, 'coc-actions'))
endif

" coc-vimlsp 文档高亮
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]
"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
