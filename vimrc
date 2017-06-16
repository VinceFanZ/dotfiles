" vim: set sw=2 ts=2 sts=2 et tw=0 foldmarker={,} foldlevel=0 foldmethod=marker spell:

set nocompatible                           " 不兼容旧Vi
set background=dark
"Load plugins {
  if filereadable(expand("~/dotfiles/vimrc.bundles"))
    source ~/dotfiles/vimrc.bundles
  endif
" }

" General {
  let mapleader=" "                          " 定义快捷键的前缀，即 <Leader>
  set nu                                     " 显示行号
  set incsearch                              " 递进搜索
  set hlsearch                               " 高亮搜索结果
  set ignorecase                             " 搜索时大小写不敏感
  set autoread                               " 自动重新加载外部修改内容
  set autochdir                              " 自动切换目录到当前文件
  set nowrap                                 " 不自动折行
  set cursorline                             " 突出当前行
  syntax enable                              " 开启语法高亮
  syntax on                                  " 允许用指定语法高亮配色方案替换默认方案
  set showmatch                              " 括号匹配
  set matchtime=1                            " 匹配高亮时间(单位是十分之一秒)
  set history=1000                           " Store a ton of history (default is 20)
  set autoindent                             " 自动缩进
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
  set laststatus=2                           " 总是显示状态栏
  set ruler                                  " 在状态栏显示行号

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

" NERDTree {
  if isdirectory(expand("~/.vim/plugged/nerdtree"))
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
  endif
" }

" Buffer {
  map <Leader>bl :MBEToggle<cr>               " 显示/隐藏 MiniBufExplorer 窗口
  " buffer 切换快捷键
  map <Leader>bn :MBEbn<cr>                   " 切换下一个buffer
  map <Leader>bp :MBEbp<cr>                   " 切换上一个buffer
  map <Leader>bd :MBEbd<cr>                   " 删除当前buffer
" }

" Theme UI {
  if isdirectory(expand("~/.vim/plugged/onedark.vim/"))
    colorscheme onedark
    let g:onedark_termcolors=16
  endif
  " 状态栏设置
  if isdirectory(expand("~/.vim/plugged/vim-airline"))
    let g:airline_theme='onedark'
    let g:airline_powerline_fonts = 1
  endif
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
      \ 'file': '\v\.(exe|so|dll)$',
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
    if count(g:fe_bundle_groups, 'javascript')
      let g:tagbar_type_javascript = {
        \ 'ctagsbin' : 'jsctags'
        \ }
    endif
  endif
" }

" ale {
  if isdirectory(expand("~/.vim/plugged/ale"))
    call airline#parts#define_function('ALE', 'ALEGetStatusLine')
    call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
    let g:airline_section_error = airline#section#create_right(['ALE'])
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = '❗'
    let g:ale_echo_msg_error_str = '✷ Error'
    let g:ale_echo_msg_warning_str = '⚠ Warning'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_statusline_format = ['✘ %d', '❗ %d', '✔ ok']
    if count(g:fe_bundle_groups, 'javascript')
      let g:ale_linters = {
        \   'javascript': ['eslint'],
        \}
    endif
  endif
" }

" wildfire.vim {
  if isdirectory(expand("~/.vim/plugged/wildfire.vim/"))
    " This selects the next closest text object.
    map <SPACE> <Plug>(wildfire-fuel)
    " This selects the previous closest text object.
    vmap <C-SPACE> <Plug>(wildfire-water)
  endif
" }

" YouCompleteMe {
  if count(g:fe_bundle_groups, 'youcomplete')
    set completeopt-=preview        " 禁用 Scratch 窗口
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_complete_in_comments = 1
    let g:ycm_key_list_select_completion = ['<Tab>', '<C-j>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
    let g:ycm_seed_identifiers_with_syntax=1      " 开启语法关键字补全
    nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
    let g:ycm_semantic_triggers =  {
      \   'c' : ['->', '.'],
      \   'objc' : ['->', '.'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::'],
      \   'perl' : ['->'],
      \   'php' : ['->', '::', '(', 'use ', 'namespace ', '\'],
      \   'cs,java,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})'],
      \   'html': ['<', '"', '</', ' '],
      \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
      \   'ruby' : ['.', '::'],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \   'haskell' : ['.', 're!.'],
      \   'scss,css': [ 're!^\s{2,4}', 're!:\s+' ],
      \ }
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
  endif
" }

" tern_for_vim {
  if count(g:fe_bundle_groups, 'javascript')
    let tern_show_signature_in_pum = 1
    let tern_show_argument_hints = 'on_hold'
    autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
    autocmd FileType javascript setlocal omnifunc=tern#Complete
  endif
" }

" Vue {
  if count(g:fe_bundle_groups, 'vue')
    autocmd FileType vue syntax sync fromstart
  endif
" }

" Emmet {
  if count(g:fe_bundle_groups, 'html')
    let g:user_emmet_expandabbr_key = '<Tab>'
    let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall
    let g:user_emmet_mode='n'
  endif
" }
