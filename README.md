# dotfiles

### vim 快捷键
```
<leader> 键为空格

代码折叠 foldmethod=indent
zc / zo   折叠／展开折叠
zj / zk   折叠代码上下移动
[z / ]z   到当前打开的折叠的开始处／结尾处
<leader>zz   所有代码折叠

<leader>N   相对 / 绝对行号切换

<F2>   开启/关闭行号显示
<F3>   显示可打印字符开关
<F4>   换行开关
<F5>   粘贴模式paste_mode开关,用于有格式的代码粘贴
<F6>   语法开关，关闭语法可以加快大文件的展示

分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
<leader>z   缩放窗口

H   相当于^ 跳到当前行行首第一个字符
L   相当于$ 跳到当前行行尾
;   相当于: 快速进入命令行
<leader>/   去掉搜索高亮

buffer 操作
[b / ]b   previous / next
<left> / <right>   previous / next
<leader>bl   显示buffer list
<leader>bd   删除当前buffer
<leader>1 - 9 | 0   打开相应index 的buffer

tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

<leader>tt   toggle
<C-t>   新建tab

Y   快捷复制到句尾
<leader>y   复制选中区到系统剪切板
<leader>sa   全选 ggVG
gv   选中并高亮最后一次插入的内容
<leader>v   选中到段尾

kj   inoremap 替换Esc

<leader>q   快捷退出
<leader>w   快捷保存
<leader>e   快捷加载当前文件


交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '

U   撤回 <C-r>

<leader>ev   编辑vimrc
<leader>ez   编辑zshrc
<leader>sv   重写加载vimrc


NERDTree
<leader>n   显示/隐藏目录
s/v 分屏打开文件

gitgutter
nnoremap <leader>gs :GitGutterToggle<CR>

gundo
noremap <leader>h :GundoToggle<CR>

Vim EasyMotion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

Ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>

CtrlSF
vmap <Leader>f <Plug>CtrlSFVwordExec

Ack
nnoremap <Leader>a :Ack!<Space>

Tagbar
nnoremap <leader>t :TagbarToggle<CR>

nerdcommentar
<leader>cc   加注释
<leader>cu   解开注释
<leader>c<space>  加上/解开注释, 智能判断
<leader>cy   先复制, 再注解(p可以进行黏贴)

YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

```
* * *
