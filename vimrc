
let mapleader=" "                              " 定义快捷键的前缀，即 <Leader>

" 设置 {
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
    set smartindent                            " 自动缩进
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
    autocmd FileType js,css,sass,scss,less,styl setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79

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
" }

" vim-plug {
    " plug 环境设置

    set rtp+=~/.vim/plugged
    " vim-plug 管理的插件列表必须位于 plug#begin() 和 plug#end() 之间
    call plug#begin('~/.vim/plugged')           " 制定插件安装目录

    Plug 'joshdick/onedark.vim'                " 主题风格
    Plug 'vim-airline/vim-airline'             " 状态栏主题
    Plug 'scrooloose/nerdtree'                 " 查看文件列表
    Plug 'Xuyuanp/nerdtree-git-plugin'         " 文件列表显示git状态
    Plug 'airblade/vim-gitgutter'              " git diff
    Plug 'fholgado/minibufexpl.vim'            " Buffer
    Plug 'tpope/vim-fugitive'

    Plug 'Valloric/YouCompleteMe'              " 代码补全
    Plug 'marijnh/tern_for_vim'
    Plug 'majutsushi/tagbar'                   " ctags标签提取显示 需依赖：brew install ctags
    Plug 'Raimondi/delimitMate'                " 括号补全
    Plug 'vim-syntastic/syntastic'             " 代码语法检查
    Plug 'nathanaelkane/vim-indent-guides'     " 缩进可视化插件
    Plug 'terryma/vim-multiple-cursors'        " 多光标编辑
    Plug 'tpope/vim-commentary'                " 快速注释与反注释

    Plug 'ctrlpvim/ctrlp.vim'                  " 文件搜索
    Plug 'mileszs/ack.vim'                     " 全局搜索 需依赖：brew install the_silver_searcher
    Plug 'sjl/gundo.vim'                       " edit history
    Plug 'easymotion/vim-easymotion'           " 快速移动

    " javascript
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'mxw/vim-jsx'
    Plug 'elzr/vim-json'
    Plug 'posva/vim-vue'
    " HTML
    Plug 'mattn/emmet-vim'
    Plug 'othree/html5.vim'
    Plug 'digitaltoad/vim-jade'
    Plug 'plasticboy/vim-markdown'
    " CSS
    Plug 'hail2u/vim-css3-syntax'
    Plug 'groenewege/vim-less'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'wavded/vim-stylus'

    Plug 'pearofducks/ansible-vim'

    call plug#end()
" }

" Theme {
    set background=dark
    colorscheme onedark
    let g:onedark_termcolors=16
    " 状态栏设置
    let g:airline_theme='onedark'
    let g:airline_powerline_fonts = 1
" }

" NERDTree {
    map <leader>n :NERDTreeToggle<CR>                " Ctrl+n 显示/隐藏目录
    let NERDTreeWinSize=32                       " 设置 NERDTree 子窗口宽度
    let NERDTreeWinPos="left"                    " 设置 NERDTree 子窗口位置
    let NERDTreeShowHidden=1                     " 显示隐藏文件
    let NERDTreeMinimalUI=1                      " NERDTree 子窗口中不显示冗余帮助信息
    let NERDTreeAutoDeleteBuffer=1               " 删除文件时自动删除文件对应 buffer
    " 忽略文件显示
    let NERDTreeIgnore=['\.pyc','\~$','\.git$','\.github$','.DS_Store','\.idea','\.vscode','**.swp$']
    let NERDTreeShowBookmarks=1                  " 显示书签列表
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

    autocmd StdinReadPre * let s:std_in=1
    " vim 命令 打开当前文件夹
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " autocmd vimenter * NERDTree                  " 打开文件时自动打开 NERDTree

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
    map <Leader>bn :MBEbn<cr>                   " 切换下一个buffer
    map <Leader>bp :MBEbp<cr>                   " 切换上一个buffer
    map <Leader>bd :MBEbd<cr>                   " 删除当前buffer
" }

" Tagbar {
    nmap <leader>t :TagbarToggle<CR>
    let g:tagbar_autofocus = 1                  " 自动高亮代码所在Tag区域
    let g:tagbar_type_javascript = {
      \ 'ctagsbin' : '/path/to/jsctags'
      \ }
" }

" Ctrlp {
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'
    set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
" }

" Ack {
    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
      let g:ackhighlight = 1
    endif
    nnoremap <Leader>a :Ack!<Space>
" }

" syntastic 代码语法检测 {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    " 设置错误符号
    let g:syntastic_error_symbol='✗'
    " 设置警告符号
    let g:syntastic_warning_symbol='⚠'
    " 是否在打开文件时检查
    let g:syntastic_check_on_open=1
    " 是否在保存文件后检查
    let g:syntastic_check_on_wq=1
    let syntastic_mode_map = { 'passive_filetypes': ['html'] }
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_javascript_eslint_exec = 'eslint'

"}

"Indent Guides {
    let g:indent_guides_enable_on_vim_startup=1  " 随 vim 自启动
    let g:indent_guides_auto_colors = 0
    hi IndentGuidesOdd  ctermbg=black            " 奇数层
    hi IndentGuidesEven ctermbg=darkgrey         " 偶数层 
    let g:indent_guides_start_level=2            " 从第二层开始可视化显示缩进
    let g:indent_guides_guide_size=1             " 色块宽度
    nmap <silent> <Leader>i <Plug>IndentGuidesToggle    " 快捷键 i 开/关缩进可视化
" }

" YouCompleteMe {
    let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'    " 全局默认配置
    set completeopt-=preview        " 禁用 Scratch 窗口
    " preview window settiing
    let g:ycm_add_preview_to_completeopt = 0

    let g:ycm_seed_identifiers_with_syntax=1      " 开启语法关键字补全
    nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
    " 屏蔽以下格式文件
    let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}
" }

" gundo {
    let g:gundo_width = 60
    let g:gundo_right = 1
    noremap <leader>h :GundoToggle<CR>
" }

" EasyMotion {
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)
" }

" Emmet {
    let g:user_emmet_expandabbr_key = '<Tab>'
    let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall
    let g:user_emmet_mode='n'
" }

" CSS3 vim {
    augroup VimCSS3Syntax
    autocmd!
      autocmd FileType css setlocal iskeyword+=-
    augroup END
" }

" Vue {
    autocmd FileType vue syntax sync fromstart
" }
