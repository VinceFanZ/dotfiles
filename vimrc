" vim: set sw=2 ts=2 sts=2 et tw=0 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" 修改leader键
let mapleader = ' '
let g:mapleader = ' '

" 开启语法高亮
syntax on

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" ensure ftdetect et al work by including this after the bundle stuff
filetype plugin indent on

"==========================================
" General Settings 基础设置
"==========================================

" history存储容量
set history=2000

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" 突出显示当前列
"set cursorcolumn
" 突出显示当前行
set cursorline


" 设置 退出vim后，内容显示在终端屏幕
"set t_ti= t_te=

" 鼠标暂不启用
set mouse-=a
" 启用鼠标
" set mouse=a
" Hide the mouse cursor while typing
" set mousehide


" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key

" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 显示行号
set number
" 取消换行
set nowrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2


" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=2
" 每一次缩进对应的空格数
set shiftwidth=2
" 按退格键时可以一次删掉 2 个空格
set softtabstop=2
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 2 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>N :call NumberToggle()<cr>

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 使用系统剪切板
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif


"==========================================
" others 其它设置
"==========================================
" vimrc文件修改之后自动加载, windows
" autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
" autocmd! bufwritepost .vimrc source %

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" command-line window
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>


" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

" 主要按键重定义

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" F1 - F6 设置

" F1 废弃这个键,防止调出系统帮助
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()



" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" Go to home and end using capitalized directions
" noremap H ^
" noremap L $


" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" 搜索相关
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


" tab/buffer相关

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

nnoremap <Leader>bl :ls<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>


" tab 操作
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

" tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
"noremap <leader>1 1gt
"noremap <leader>2 2gt
"noremap <leader>3 3gt
"noremap <leader>4 4gt
"noremap <leader>5 5gt
"noremap <leader>6 6gt
"noremap <leader>7 7gt
"noremap <leader>8 8gt
"noremap <leader>9 9gt
"noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


" => 选中及操作改键

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" auto jump to end of select
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" select all
map <Leader>sa ggVG

" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]

" select block
nnoremap <leader>v V`}

" Allow saving of files as sudo when I forgot to start vim using sudo.
" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" kj 替换 Esc
inoremap kj <Esc>

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


" Jump to start and end of line using the home row keys
" 增强tab操作, 导致这个会有问题, 考虑换键
"nmap t o<ESC>k
"nmap T O<ESC>j

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

nnoremap <leader>e :e<CR>

" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quickly edit/reload the vimrc file
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
" nmap <silent> <leader>sv :so $MYVIMRC<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"==========================================
" FileType Settings  文件类型设置
"==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,typescript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>



" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        " call setline(1, "\#!/usr/bin/env python")
        " call append(1, "\# encoding: utf-8")
        call setline(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc


" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

"==========================================
" TEMP 设置, 尚未确定要不要
"==========================================

" beta
" https://dougblack.io/words/a-good-vimrc.html
set lazyredraw          " redraw only when we need to.


"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" 主题
set background=dark
set t_Co=256

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" =======================================
" 插件设置
" =======================================

" Theme UI {
    if isdirectory(expand("~/.vim/plugged/onedark.vim/"))
      colorscheme onedark
    endif
    " 状态栏设置
    if isdirectory(expand("~/.vim/plugged/vim-airline"))
      if isdirectory(expand("~/.vim/plugged/vim-airline-themes"))
        let g:airline_theme='simple'
      endif
      let g:airline_powerline_fonts = 1
    endif
" }

" NERDTree {
    if isdirectory(expand("~/.vim/plugged/nerdtree"))
      map <leader>n :NERDTreeToggle<CR>            " leader+n 显示/隐藏目录
      nmap <leader>nt :NERDTreeFind<CR>            " 定位文件
      let NERDTreeWinSize=28                       " 设置 NERDTree 子窗口宽度
      let NERDTreeWinPos="left"                    " 设置 NERDTree 子窗口位置
      let NERDTreeShowHidden=1                     " 显示隐藏文件
      let NERDTreeMinimalUI=1                      " NERDTree 子窗口中不显示冗余帮助信息
      let NERDTreeAutoDeleteBuffer=1               " 删除文件时自动删除文件对应 buffer
      " 忽略文件显示
      let NERDTreeIgnore=['\.pyc','\~$','\.git$','\.github$','.DS_Store','\.idea','\.vscode','**.swp$']
      let NERDTreeShowBookmarks=1                  " 显示书签列表
      let g:NERDTreeDirArrowExpandable = '▸'
      let g:NERDTreeDirArrowCollapsible = '▾'

      " 打开目录时自动打开 NERDTree
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

      " 打开文件时自动打开 NERDTree
      " autocmd vimenter * NERDTree

      " s/v 分屏打开文件
      let g:NERDTreeMapOpenSplit = 's'
      let g:NERDTreeMapOpenVSplit = 'v'

      " NERDTress File highlighting
      function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
      exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
      exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
      endfunction

      call NERDTreeHighlightFile('html', 'red', 'none', 'red', '#151515')
      call NERDTreeHighlightFile('jade', 'red', 'none', 'red', '#151515')
      call NERDTreeHighlightFile('pug', 'red', 'none', 'red', '#151515')
      call NERDTreeHighlightFile('js', 'yellow', 'none', 'yellow', '#151515')
      call NERDTreeHighlightFile('ts', 'blue', 'none', 'blue', '#151515')
      call NERDTreeHighlightFile('vue', 'green', 'none', '#ffa500', '#151515')
      call NERDTreeHighlightFile('css', 'magenta', 'none', 'magenta', '#151515')
      call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
      call NERDTreeHighlightFile('less', 'cyan', 'none', 'cyan', '#151515')
      call NERDTreeHighlightFile('json', '184', 'none', 'yellow', '#151515')
    endif
" }

" ctrlspace {
    let g:airline_exclude_preview = 1
    hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
    hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
    hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
    hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
" }

" nerdtree-git-plugin {
    if isdirectory(expand("~/.vim/plugged/nerdtree-git-plugin"))
      let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }
    endif
" }

" gitgutter {
    let g:gitgutter_map_keys = 0
    let g:gitgutter_enabled = 1
    let g:gitgutter_highlight_lines = 0
    nnoremap <leader>gs :GitGutterToggle<CR>
" }

"indentline {
    if isdirectory(expand("~/.vim/plugged/indentline"))
      let g:indentLine_color_tty_dark = 1
      let g:indentLine_conceallevel = 2
      let g:indentLine_char = '┆'
    endif
" }

" gundo {
    if isdirectory(expand("~/.vim/plugged/gundo.vim/"))
      let g:gundo_width = 60
      let g:gundo_right = 1
      noremap <leader>h :GundoToggle<CR>
    endif
" }

" undotree {
    if isdirectory(expand("~/.vim/plugged/undotree"))
      let g:undotree_WindowLayout = 3
      noremap <leader>h :UndotreeToggle<CR>
    endif
" }

" Vim EasyMotion {
    if isdirectory(expand("~/.vim/plugged/vim-easymotion"))
      let g:EasyMotion_smartcase = 1
      "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
      map <Leader><leader>h <Plug>(easymotion-linebackward)
      map <Leader><Leader>j <Plug>(easymotion-j)
      map <Leader><Leader>k <Plug>(easymotion-k)
      map <Leader><leader>l <Plug>(easymotion-lineforward)
      " 重复上一次操作, 类似repeat插件, 很强大
      map <Leader><leader>. <Plug>(easymotion-repeat)
    endif
" }

" Ctrlp {
    if isdirectory(expand("~/.vim/plugged/ctrlp.vim/"))
      let g:ctrlp_map = '<c-p>'
      let g:ctrlp_cmd = 'CtrlP'
      let g:ctrlp_working_path_mode = 'ra'
      set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
      let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
        \ 'link': 'some_bad_symbolic_links',
        \ }
    endif
" }

" Ctrlp-funky {
    if isdirectory(expand("~/.vim/plugged/ctrlp-funky"))
      let g:ctrlp_funky_matchtype = 'path'
      let g:ctrlp_funky_syntax_highlight = 1
      nnoremap <Leader>fu :CtrlPFunky<Cr>
    endif
" }

" CtrlSF {
    if isdirectory(expand("~/.vim/plugged/ctrlsf.vim/"))
      let g:ctrlsf_position = 'right'
      let g:ctrlsf_winsize = '24%'
      vmap <Leader>f <Plug>CtrlSFVwordExec
    endif
" }

" Ack {
    if isdirectory(expand("~/.vim/plugged/ack.vim/"))
      if executable('ag')
        let g:ackprg = 'ag --vimgrep'
        let g:ackhighlight = 1
      endif
      nnoremap <Leader>a :Ack!<Space>
    endif
" }

" delimitMate {
    if isdirectory(expand("~/.vim/plugged/delimitMate"))
      let delimitMate_matchpairs = "(:),[:],{:},<:>"
      au FileType javascript,typescript,vue let b:delimitMate_matchpairs = "(:),[:],{:}"
    endif
" }

" Tagbar {
    if isdirectory(expand("~/.vim/plugged/tagbar"))
      nnoremap <leader>t :TagbarToggle<CR>
      let g:tagbar_autofocus = 1
      let g:tagbar_width = 50
      let g:tagbar_type_javascript = {
        \ 'ctagsbin' : 'jsctags'
        \ }
    endif
" }

" ale {
    if isdirectory(expand("~/.vim/plugged/ale"))
      " 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
      nmap sp <Plug>(ale_previous_wrap)
      nmap sn <Plug>(ale_next_wrap)
      " 触发/关闭语法检查
      nmap <Leader>s :ALEToggle<CR>
      " 查看错误或警告的详细信息
      nmap <Leader>sd :ALEDetail<CR>

      let g:ale_sign_error = '✘'
      let g:ale_sign_warning = '❗'
      let g:ale_echo_msg_error_str = '✷ Error'
      let g:ale_echo_msg_warning_str = '⚠ Warning'
      let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
      let g:ale_statusline_format = ['✘ %d', '❗ %d', '✔ ok']
      let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'typescript': ['tslint']
        \}

      if isdirectory(expand("~/.vim/plugged/vim-airline"))
        let g:airline#extensions#ale#enabled = 1
        let g:airline#extensions#ale#error_symbol = '✷ '
        let g:airline#extensions#ale#warning_symbol = '⚠ '
      endif

    endif
" }

" nerdcommentar {
    if isdirectory(expand("~/.vim/plugged/nerdcommenter"))
      let g:NERDSpaceDelims = 1
      let g:NERDCompactSexyComs = 1
      let g:NERDDefaultAlign = 'left'
      let g:NERDCommentEmptyLines = 1
      let g:NERDTrimTrailingWhitespace = 1

      let g:ft = ''
      fu! NERDCommenter_before()
        if &ft == 'vue'
          let g:ft = 'vue'
          let stack = synstack(line('.'), col('.'))
          if len(stack) > 0
            let syn = synIDattr((stack)[0], 'name')
            if len(syn) > 0
              let syn = tolower(syn)
              exe 'setf '.syn
            endif
          endif
        endif
      endfu
      fu! NERDCommenter_after()
        if g:ft == 'vue'
          setf vue
          let g:ft = ''
        endif
      endfu
    endif
" }

" YouCompleteMe {
    if isdirectory(expand("~/.vim/plugged/YouCompleteMe"))
      set completeopt-=preview        " 禁用 Scratch 窗口
      let g:ycm_autoclose_preview_window_after_completion = 1
      let g:ycm_key_list_select_completion = ['<Tab>', '<C-j>', '<Down>']
      let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
      let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
      let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
      let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
      let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
      let g:ycm_collect_identifiers_from_tags_files = 1
      let g:ycm_key_list_stop_completion = ['<CR>']   " 回车作为选中
      let g:ycm_seed_identifiers_with_syntax=1        " 开启语法关键字补全

      " 跳转到定义处, 分屏打开
      let g:ycm_goto_buffer_command = 'horizontal-split'
      let g:ycm_register_as_syntastic_checker = 0
      nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
      nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

      " 黑名单
      let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'notes' : 1,
        \ 'markdown' : 1,
        \ 'unite' : 1,
        \ 'text' : 1,
        \ 'vimwiki' : 1,
        \ 'gitcommit' : 1,
        \ }
    endif
" }

" tern_for_vim {
    if isdirectory(expand("~/.vim/plugged/tern_for_vim"))
      let tern_show_signature_in_pum = 1
      let tern_show_argument_hints = 'on_hold'
      autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
      autocmd FileType javascript setlocal omnifunc=tern#Complete
    endif
" }

" javascript {
    if isdirectory(expand("~/.vim/plugged/vim-javascript"))
      let g:javascript_plugin_jsdoc = 1
      let g:javascript_plugin_ngdoc = 1
      let g:javascript_plugin_flow = 1
    endif
" }

" Prettier {
    if isdirectory(expand("~/.vim/plugged/vim-prettier"))
      nmap <Leader>p <Plug>(Prettier)
      " let g:prettier#exec_cmd_path = "~/.vim/plugged/vim-prettier/node_modules/.bin/prettier"
      let g:prettier#exec_cmd_async = 1
      let g:prettier#quickfix_enabled = 0
      let g:prettier#autoformat = 0
      " autocmd BufWritePre,TextChanged,InsertLeave *.js,*.ts,*.json PrettierAsync
      " ----- Overwrite default prettier configuration -----
      let g:prettier#config#print_width = 120
      let g:prettier#config#tab_width = 2
      let g:prettier#config#use_tabs = 'false'
      let g:prettier#config#semi = 'false'
      let g:prettier#config#single_quote = 'true'
      let g:prettier#config#bracket_spacing = 'true'
      let g:prettier#config#jsx_bracket_same_line = 'false'
      let g:prettier#config#arrow_parens = 'always'
      let g:prettier#config#trailing_comma = 'all'
      let g:prettier#config#parser = 'typescript'
      let g:prettier#config#config_precedence = 'prefer-file'
      let g:prettier#config#prose_wrap = 'preserve'
    endif
" }

" jsDoc {
    if isdirectory(expand("~/.vim/plugged/vim-jsdoc"))
      nmap <silent>l <Plug>(jsdoc)
    endif
" }

" Emmet {
    if isdirectory(expand("~/.vim/plugged/emmet-vim"))
      let g:user_emmet_expandabbr_key = '<Tab>'
      let g:user_emmet_install_global = 0
      autocmd FileType html,css EmmetInstall
      let g:user_emmet_mode='n'
    endif
" }

" markdown {
    let g:vim_markdown_folding_disabled = 1
" }
