"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------
" 光标行和光标栏
au WinEnter * set cursorline nocursorcolumn
au InsertLeave * set cursorline nocursorcolumn
au InsertEnter * set nocursorline cursorcolumn

" 光标样式
" 0  -> blinking block.
" 1  -> blinking block (default).
" 2  -> steady block.
" 3  -> blinking underline.
" 4  -> steady underline.
" 5  -> blinking bar (xterm).
" 6  -> steady bar (xterm).
" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"

" Optionally reset the cursor on start:
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

" 总是显示状态栏
set laststatus=2

" 总是显示行号
set number

" 侧边栏（用于显示 mark/gitdiff/诊断信息）
if has('nvim')
  set signcolumn=auto
elseif has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" 总是显示标签栏
"set showtabline=2

" 设置显示制表符等隐藏字符
"set list

" 右下角显示命令
set showcmd

" 插入模式在状态栏下面不显示 -- INSERT --，
" 因为 statusline 已经集成
set noshowmode

" 水平切割窗口时，默认在左边显示新窗口
set nosplitright


"----------------------------------------------------------------------
" 颜色主题：色彩文件位于 colors 目录中
"----------------------------------------------------------------------

" 设置黑色背景
set background=dark

" 允许 256 色
set t_Co=256

" 设置颜色主题，会在所有 runtimepaths 的 colors 目录寻找同名配置
color papercol
" color gruvbox


"----------------------------------------------------------------------
" 状态栏设置
"----------------------------------------------------------------------
set statusline=                                 " 清空状态了
set statusline+=\ [%{winnr()}]                  " 窗口号
set statusline+=\ %F                            " 文件名
set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
set statusline+=%=                              " 向右对齐
set statusline+=\ %y                            " 文件类型

" 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)


"----------------------------------------------------------------------
" 更改样式
"----------------------------------------------------------------------

" 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" 只显示红色或者蓝色下划线或者波浪线
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal
if has('gui_running')
	hi! SpellBad gui=undercurl guisp=red
	hi! SpellCap gui=undercurl guisp=blue
	hi! SpellRare gui=undercurl guisp=magenta
	hi! SpellRare gui=undercurl guisp=cyan
else
	hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
	hi! SpellCap term=underline cterm=underline
	hi! SpellRare term=underline cterm=underline
	hi! SpellLocal term=underline cterm=underline
endif

" 去掉 sign column 的白色背景
hi! SignColumn guibg=NONE ctermbg=NONE

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE 
	\ gui=NONE guifg=DarkGrey guibg=NONE

" 修正补全目录的色彩：默认太难看
" hi! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
" hi! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray


"----------------------------------------------------------------------
" 终端设置，隐藏行号和侧边栏
"----------------------------------------------------------------------
if has('terminal') && exists(':terminal') == 2
	if exists('##TerminalOpen')
		augroup VimUnixTerminalGroup
			au! 
			au TerminalOpen * setlocal nonumber signcolumn=no
		augroup END
	endif
endif


"----------------------------------------------------------------------
" quickfix 设置，隐藏行号
"----------------------------------------------------------------------
augroup VimInitStyle
	au!
	au FileType qf setlocal nonumber
augroup END


"----------------------------------------------------------------------
" 标签栏文字风格：默认为零，GUI 模式下空间大，按风格 3显示
" 0: filename.txt
" 2: 1 - filename.txt
" 3: [1] filename.txt
"----------------------------------------------------------------------
if has('gui_running')
	let g:config_vim_tab_style = 3
endif


"----------------------------------------------------------------------
" 终端下的 tabline
"----------------------------------------------------------------------
function! Vim_NeatTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'

		" the label is made by MyTabLabel()
		let s .= ' %{Vim_NeatTabLabel(' . (i + 1) . ')} '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999XX'
	endif

	return s
endfunc


"----------------------------------------------------------------------
" 需要显示到标签上的文件名
"----------------------------------------------------------------------
function! Vim_NeatBuffer(bufnr, fullname)
	let l:name = bufname(a:bufnr)
	if getbufvar(a:bufnr, '&modifiable')
		if l:name == ''
			return '[No Name]'
		else
			if a:fullname 
				return fnamemodify(l:name, ':p')
			else
				let aname = fnamemodify(l:name, ':p')
				let sname = fnamemodify(aname, ':t')
				if sname == ''
					let test = fnamemodify(aname, ':h:t')
					if test != ''
						return '<'. test . '>'
					endif
				endif
				return sname
			endif
		endif
	else
		let l:buftype = getbufvar(a:bufnr, '&buftype')
		if l:buftype == 'quickfix'
			return '[Quickfix]'
		elseif l:name != ''
			if a:fullname 
				return '-'.fnamemodify(l:name, ':p')
			else
				return '-'.fnamemodify(l:name, ':t')
			endif
		else
		endif
		return '[No Name]'
	endif
endfunc


"----------------------------------------------------------------------
" 标签栏文字，使用 [1] filename 的模式
"----------------------------------------------------------------------
function! Vim_NeatTabLabel(n)
	let l:buflist = tabpagebuflist(a:n)
	let l:winnr = tabpagewinnr(a:n)
	let l:bufnr = l:buflist[l:winnr - 1]
	let l:fname = Vim_NeatBuffer(l:bufnr, 0)
	let l:num = a:n
	let style = get(g:, 'config_vim_tab_style', 0)
	if style == 0
		return l:fname
	elseif style == 1
		return "[".l:num."] ".l:fname
	elseif style == 2
		return "".l:num." - ".l:fname
	endif
	if getbufvar(l:bufnr, '&modified')
		return "[".l:num."] ".l:fname." +"
	endif
	return "[".l:num."] ".l:fname
endfunc


"----------------------------------------------------------------------
" GUI 下的标签文字，使用 [1] filename 的模式
"----------------------------------------------------------------------
function! Vim_NeatGuiTabLabel()
	let l:num = v:lnum
	let l:buflist = tabpagebuflist(l:num)
	let l:winnr = tabpagewinnr(l:num)
	let l:bufnr = l:buflist[l:winnr - 1]
	let l:fname = Vim_NeatBuffer(l:bufnr, 0)
	let style = get(g:, 'config_vim_tab_style', 0)
	if style == 0
		return l:fname
	elseif style == 1
		return "[".l:num."] ".l:fname
	elseif style == 2
		return "".l:num." - ".l:fname
	endif
	if getbufvar(l:bufnr, '&modified')
		return "[".l:num."] ".l:fname." +"
	endif
	return "[".l:num."] ".l:fname
endfunc



"----------------------------------------------------------------------
" 设置 GUI 标签的 tips: 显示当前标签有哪些窗口
"----------------------------------------------------------------------
function! Vim_NeatGuiTabTip()
	let tip = ''
	let bufnrlist = tabpagebuflist(v:lnum)
	for bufnr in bufnrlist
		" separate buffer entries
		if tip != ''
			let tip .= " \n"
		endif
		" Add name of buffer
		let name = Vim_NeatBuffer(bufnr, 1)
		let tip .= name
		" add modified/modifiable flags
		if getbufvar(bufnr, "&modified")
			let tip .= ' [+]'
		endif
		if getbufvar(bufnr, "&modifiable")==0
			let tip .= ' [-]'
		endif
	endfor
	return tip
endfunc


"----------------------------------------------------------------------
" 标签栏最终设置
"----------------------------------------------------------------------
set tabline=%!Vim_NeatTabLine()
set guitablabel=%{Vim_NeatGuiTabLabel()}
set guitabtooltip=%{Vim_NeatGuiTabTip()}


"----------------------------------------------------------------------
" Gui 设置
"----------------------------------------------------------------------
if has('gui_running')
  set guioptions-=T           " No toolbar
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
  set linespace=2
  if has('gui_win32')
    set guifont=Consolas:h12
  else
    set guifont=Hack\ Regular\ Nerd\ Font\ Complete:h12
  endif
endif

if has('nvim')
  autocmd VimEnter * call GuiWindowFullScreen(1)
  if exists('g:GuiLoaded')
    GuiFont! Hack Nerd Font:style=Bold:h14
    " nvim-qt 下的 popupmenu 有问题，关闭掉
    GuiPopupmenu 0
    GuiTabline 0
  endif
else
  " 启动时开启全屏
  " set fu
endif

"----------------------------------------------------------------------
" which-key 设置
"----------------------------------------------------------------------
let g:which_key_hspace = 7
highlight default link WhichKey          Function
highlight default link WhichKeySeperator Number
highlight default link WhichKeyGroup     Keyword
highlight default link WhichKeyDesc      Identifier
highlight WhichKeyFloating  guifg=#000000 ctermfg=0


"----------------------------------------------------------------------
" clap 设置
"----------------------------------------------------------------------
let g:clap_theme = 'material_design_dark'
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_icon = 1
let g:clap_provider_grep_enable_icon = 1
let g:clap_current_selection_sign= { 'text': '➤', 'texthl': "ClapCurrentSelectionSign", "linehl": "ClapCurrentSelection"}


"----------------------------------------------------------------------
" startify
"----------------------------------------------------------------------
let g:startify_name = [
      \'___________.__         ',
      \'\__    ___/|__| _____  ',
      \'  |    |   |  |/     \ ',
      \'  |    |   |  |  Y Y  \',
      \'  |____|   |__|__|_|  /',
      \'                    \/ ',
      \]

let g:startify_custom_header = startify#center(g:startify_name)
