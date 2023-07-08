"----------------------------------------------------------------------
" 计算上级目录, 之后可以使用s:path拼接
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
" 代码编辑和增强
"----------------------------------------------------------------------
" LSP server

" Terminal

" 代码运行和调试

“ 代码测试和覆盖率

” 代码片段和模版

" 语法高亮增强

" 文档与注释
Plug 'tpope/vim-commentary'  " 快速注释

” 符号查找、替换、跳转

“ 自动保存和恢复

" 代码折叠

" 文本对象
Plug 'kana/vim-textobj-user'  " 基础插件：提供让用户方便的自定义文本对象的接口
Plug 'kana/vim-textobj-indent'  " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
Plug 'kana/vim-textobj-syntax'  " 语法文本对象：iy/ay 基于语法的文本对象
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java', 'javascript'] }  " 函数文本对象：if/af
Plug 'bps/vim-textobj-python', {'for': 'python'}  " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
"Plug 'thinca/vim-textobj-function-javascript', {'for': ['javascript']}
Plug 'glts/vim-textobj-comment'  " 注释文本对象：ac/ic
Plug 'sgur/vim-textobj-parameter'  " 参数文本对象：i,/a, 包括参数或者列表元素
Plug 'jceb/vim-textobj-uri'  " 提供 uri/url 的文本对象，iu/au 表示
Plug 'whatyouhide/vim-textobj-xmlattr', {'for': ['html', 'xml']} " xml 属性文本对象：ax/ix

" 配对符
Plug 'Raimondi/delimitMate'  " 快速补全另一半
au FileType python let b:delimitMate_nesting_quotes = ['"', '`']  " python中三重引号和反引号的自动补全配置

Plug 'luochen1990/rainbow'  " 美化
let g:rainbow_active=1

“ 格式化

"----------------------------------------------------------------------
" 文件和项目管理
"----------------------------------------------------------------------
" 文件目录树

“ 文件搜索

” 代码版本控制
" TODO: 侧栏Diff

"----------------------------------------------------------------------
" 外观和界面增强
"----------------------------------------------------------------------
" 开始画面
Plug 'mhinz/vim-startify'  " 显示最近编辑过的文件
let g:startify_name = [
      \'___________.__         ',
      \'\__    ___/|__| _____  ',
      \'  |    |   |  |/     \ ',
      \'  |    |   |  |  Y Y  \',
      \'  |____|   |__|__|_|  /',
      \'                    \/ ',
      \]

let g:startify_custom_header = startify#center(g:startify_name)

" 主题和配色
Plug 'flazz/vim-colorschemes'  " 一次性安装许多主题

" 侧栏
Plug 'myusuf3/numbers.vim'  " 行号相对化

" icon美化

" 缩进线
Plug 'yggdroot/indentline'

“ 字体设置

“ 窗口和标签页

" 状态栏和标签栏

"----------------------------------------------------------------------
" 辅助功能
"----------------------------------------------------------------------
“ 快捷键映射
Plug 'liuchengxu/vim-which-key'
let g:which_key_hspace = 7
highlight default link WhichKey          Function
highlight default link WhichKeySeperator Number
highlight default link WhichKeyGroup     Keyword
highlight default link WhichKeyDesc      Identifier
highlight WhichKeyFloating  guifg=#000000 ctermfg=0

” 剪贴板共享

" 表格对齐
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }  " 使用命令 Tabularize

" . 增强
Plug 'tpope/vim-repeat'  " 使得 >, <, gU, gu, J, dd, yy, cc等命令都可以重复了

" TODO工具

"----------------------------------------------------------------------
" 插件安装结束
"----------------------------------------------------------------------
call plug#end()
