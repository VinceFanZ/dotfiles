
let mapleader=";"                              " 定义快捷键的前缀，即 <Leader>
filetype on                                    " 开启文件类型侦测
filetype plugin on                             " 根据侦测到的不同类型加载对应的插件

" 设置 {
    set nocompatible                           " 不兼容旧Vi
    set autoread                               " 自动更新Buffer里的文件
    set nu                                     " 显示行号
    set incsearch                              " 递进搜索
    set hlsearch                               " 高亮搜索结果
    set ignorecase                             " 搜索时大小写不敏感
    set autochdir                              " 自动切换目录到当前文件
    set nowrap                                 " 不自动折行
    set cursorline                             " 突出当前行
    set laststatus=2                           " 总是显示状态栏
    set ruler                                  " 在状态栏显示行号
    syntax enable                              " 开启语法高亮
    syntax on                                  " 允许用指定语法高亮配色方案替换默认方案
    set showmatch                              " 括号匹配
    set matchtime=1                            " 匹配高亮时间(单位是十分之一秒)
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14   " GUI字体设置
    set guioptions-=r                          " 去除右侧滚动条
    set guioptions-=L                          " 去除左侧滚动条
    filetype indent on                         " 自适应不同语言的智能缩进
    set smartindent                            " 自动缩进
    
    set encoding=utf-8                         " vim内部的编码
    set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbkgb2312,cp936   " 默认新建的文件编码
    set termencoding=utf-8                     " 输出到终端的编码
    set fileencoding=utf-8                     " 写入文件的编码
    
    " 普通文件Tab设置
    set expandtab
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2

    " 特殊文件Tab设置
    autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
    autocmd FileType html,jade setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
    autocmd FileType js,css,sass,scss,less,styl setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79

    " 文件类型设置
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown       " Markdown设置
    autocmd FileType markdown setlocal wrap                         " Markdown折行

    " 折叠设置
    set foldmethod=syntax                       " 根据语法进行缩进
    set nofoldenable                            " 启动 vim 时关闭折叠代码

    map <leader>w :w!<cr>                       " 保存
    map <leader>q :wq!<CR>                      " 保存并退出当前窗口

    " 多个窗口间切换
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

" }

" vim-plug {
    " plug 环境设置
    filetype off
    " set rtp+=~/.vim/plugged
    " vim-plug 管理的插件列表必须位于 plug#begin() 和 plug#end() 之间
    call plug#begin('~/.vim/plugged')           " 制定插件安装目录

    Plug 'joshdick/onedark.vim'                " 主题风格
    Plug 'sheerun/vim-polyglot'                " 语法高亮
    Plug 'vim-airline/vim-airline'             " 状态栏主题
    Plug 'ryanoasis/vim-devicons'              " 文件icon
    Plug 'wincent/command-t'                   " 文件搜索
    Plug 'scrooloose/nerdtree'                 " 查看文件列表
    Plug 'Xuyuanp/nerdtree-git-plugin'         " 文件列表显示git状态
    Plug 'fholgado/minibufexpl.vim'            " Buffer

    Plug 'Valloric/YouCompleteMe'              " 代码补全
    Plug 'majutsushi/tagbar'                   " ctags标签提取显示 需依赖：brew install ctags
    Plug 'Raimondi/delimitMate'                " 括号补全
    Plug 'vim-syntastic/syntastic'             " 代码语法检查
    Plug 'nathanaelkane/vim-indent-guides'     " 缩进可视化插件

    Plug 'dyng/ctrlsf.vim'                     " 搜索插件 需依赖：brew install ripgrep

    call plug#end()
    filetype plugin indent on
" }

" Theme {
    set background=dark
    colorscheme onedark
    let g:onedark_termcolors=16
    " 状态栏设置
    let g:airline_theme='onedark'
    let g:airline_powerline_fonts = 1

    " webdevicons      loading the plugin 
    let g:webdevicons_enable = 1
    " adding the flags to NERDTree 
    let g:webdevicons_enable_nerdtree = 1
    " adding the custom source to unite 
    let g:webdevicons_enable_unite = 1
    " adding the column to vimfiler 
    let g:webdevicons_enable_vimfiler = 1
    " adding to vim-airline's tabline 
    let g:webdevicons_enable_airline_tabline = 1
    " adding to vim-airline's statusline 
    let g:webdevicons_enable_airline_statusline = 1
    " ctrlp glyphs
    let g:webdevicons_enable_ctrlp = 1
    " adding to flagship's statusline 
    let g:webdevicons_enable_flagship_statusline = 1
    " turn on/off file node glyph decorations (not particularly useful)
    let g:WebDevIconsUnicodeDecorateFileNodes = 1
    " use double-width(1) or single-width(0) glyphs 
    " only manipulates padding, has no effect on terminal or set(guifont) font
    let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
    " whether or not to show the nerdtree brackets around flags 
    let g:webdevicons_conceal_nerdtree_brackets = 1
    " the amount of space to use after the glyph character (default ' ')
    let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
    " Force extra padding in NERDTree so that the filetype icons line up vertically 
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" }

" NERDTree {
    map <C-n> :NERDTreeToggle<CR>                " Ctrl+n 显示/隐藏目录
    let NERDTreeWinSize=22                       " 设置 NERDTree 子窗口宽度
    let NERDTreeWinPos="left"                    " 设置 NERDTree 子窗口位置
    let NERDTreeShowHidden=1                     " 显示隐藏文件
    let NERDTreeMinimalUI=1                      " NERDTree 子窗口中不显示冗余帮助信息
    let NERDTreeAutoDeleteBuffer=1               " 删除文件时自动删除文件对应 buffer
                                                 " 忽略文件显示
    let NERDTreeIgnore=['\.pyc','\~$','\.git$','\.github$','.DS_Store','\.idea','\.vscode']
    let NERDTreeShowBookmarks=1                  " 显示书签列表
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

    autocmd StdinReadPre * let s:std_in=1
                                                 " vim 命令打开当前文件夹
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd vimenter * NERDTree                  " 打开文件时自动打开 NERDTree
                                                 " 自动关闭 NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " NERDTress File highlighting
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction

    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('vue', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

                                                 " nerdtree-git-plugin 显示git信息
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
" }

" Buffer {
    map <Leader>bl :MBEToggle<cr>               " 显示/隐藏 MiniBufExplorer 窗口
    " buffer 切换快捷键
    map <Leader>bn :MBEbn<cr>
    map <Leader>bp :MBEbp<cr>
" }

" Tagbar {
    nmap <leader>t :TagbarToggle<CR>
    let g:tagbar_autofocus = 1                  " 自动高亮代码所在Tag区域
" }

" Ctrlsf {
    let g:ctrlsf_position = "right"             " 搜索窗口显示位置
    let g:ctrlsf_ackprg = 'rg'                  " 使用 ripgrep 需: brew install ripgrep
    nnoremap <Leader>sp :CtrlSF<CR>             " 快捷键速记法：search in project
" }

" syntastic 代码语法检测 {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_javascript_eslint_exec = 'eslint'

" }

" Indent Guides {
    let g:indent_guides_enable_on_vim_startup=1  " 随 vim 自启动
    let g:indent_guides_auto_colors = 0
    hi IndentGuidesOdd  ctermbg=black            " 奇数层
    hi IndentGuidesEven ctermbg=darkgrey         " 偶数层 
    let g:indent_guides_start_level=2            " 从第二层开始可视化显示缩进
    let g:indent_guides_guide_size=1             " 色块宽度
    nmap <silent> <Leader>i <Plug>IndentGuidesToggle    " 快捷键 i 开/关缩进可视化
" }










