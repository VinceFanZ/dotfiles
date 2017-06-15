
let mapleader=" "                          " 定义快捷键的前缀，即 <Leader>
set nocompatible                           " 不兼容旧Vi
set nu                                     " 显示行号
set incsearch                              " 递进搜索
set hlsearch                               " 高亮搜索结果
set ignorecase                             " 搜索时大小写不敏感
set autoread                               " 自动重新加载外部修改内容
set autochdir                              " 自动切换目录到当前文件
set nowrap                                 " 不自动折行
set cursorline                             " 突出当前行
set laststatus=2                           " 总是显示状态栏
set ruler                                  " 在状态栏显示行号
syntax enable                              " 开启语法高亮
syntax on                                  " 允许用指定语法高亮配色方案替换默认方案
set showmatch                              " 括号匹配
set matchtime=1                            " 匹配高亮时间(单位是十分之一秒)
" set autoindent                            " 自动缩进
filetype indent on                         " 自适应不同语言的智能缩进
filetype plugin indent on                  " 自动检测文件类型
set nobackup                               " 取消备份
set noswapfile                             " 禁止临时文件生成

" 编码设置
set encoding=utf-8                         " 缓冲编码
set fileencodings=utf-8,cp936,gb18030,big5,gbk,euc-jp,latin1
" set fileencoding=utf-8
set termencoding=utf-8                     " 编码转换
set fileformats=unix

" 普通文件Tab设置
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set list                                   " 显示Tab符
set listchars=tab:>-,trail:·               " 设置空格显示为 ·

" 特殊文件Tab设置
autocmd FileType html,jade setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType javascript,vue,css,sass,scss,less,styl setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0

" 文件类型设置
autocmd BufNewFile,BufReadPost *.md set filetype=markdown       " Markdown设置
autocmd FileType markdown setlocal wrap                         " Markdown折行

" 状态栏显示目前所执行的指令
set showcmd

set backspace=2                             " 设置退格键可用
" set mouse=a                                 " 鼠标可用
set clipboard=unnamed                      " 共享外部剪贴板
set pastetoggle=<F12>

map <Leader>w :w<CR>                        " 保存
map <Leader>q :wq!<CR>                      " 保存并退出当前窗口
map <Leader>e :e<CR>

" 多个窗口间切换
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab操作
set showtabline=1                           " 显示标签页菜单
nnoremap <Leader>tc :tabc<CR>               " 关闭当前的tab
nnoremap <Leader>to :tabo<CR>               " 关闭所有其他的tab
nnoremap <Leader>ts :tabs<CR>               " 查看所有打开的tab
nnoremap <Leader>tn :tabn<CR>               " 下一个
nnoremap <Leader>tp :tabp<CR>               " 上一个
nnoremap <Leader>te :tabe<Space>            " 新建标签页

nnoremap <Leader>nh :nohl<CR>               " 清除文本搜索高亮



"Load plugins
if filereadable(expand("~/dotfiles/vimrc.bundles"))
  source ~/dotfiles/vimrc.bundles
endif

