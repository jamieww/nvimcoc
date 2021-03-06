" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" function {{{
function! EnsureDirExits (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir, 'p')
      echo "Created directory: " . a:dir
    else
      echo "please create directory: " . a:dir
    endif
  endif
endfunction
" }}}

" python {{{
let g:python_host_prog="/Users/jamieww/.pyenv/versions/anaconda2-4.0.0/bin/python"
let g:python3_host_prog="/Users/jamieww/.pyenv/versions/3.7.3/bin/python"
" let g:powerline_pycmd="py3"
" }}}

" Startup {{{
set nocompatible              " be iMproved, required
filetype off                  " required
" vim 文件折叠方式为 marker
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
augroup END
" }}}

call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
Plug 'scrooloose/nerdtree'                " file/directory treee
Plug 'scrooloose/nerdcommenter'           " code commenter
" Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder
Plug 'altercation/vim-colors-solarized'   " solarized themePlug 'jnurmine/Zenburn'
" Plug 'chriskempson/base16-vim'
" Plug 'icymind/NeoSolarized'
" Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'KabbAmine/yowish.vim'
Plug 'tomasr/molokai'
" Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

" Install nightly build, replace ./install.sh with install.cmd on windows
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" Plug 'Valloric/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'honza/vim-snippets'
Plug 'yegappan/mru'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'w0rp/ale'
" Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tell-k/vim-autopep8'
Plug 'dart-lang/dart-vim-plugin'
Plug 'gabrielelana/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'
" Plug 'iamcco/mathjax-support-for-mkdp'
" Plug 'iamcco/markdown-preview.vim'
" Plug '907th/vim-auto-save'
" Plug 'skywind3000/asyncrun.vim'
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
" Plug 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Initialize plugin system
Plug 'rbgrouleff/bclose.vim'
call plug#end()
filetype plugin indent on    " required
"}}}

" vim-mundo {{{
set undofile
" check 'vim-mundo directory'
call EnsureDirExits($HOME . '/.vim/tmp/undo')
set undodir=~/.vim/tmp/undo
nnoremap tu :MundoToggle<cr>
nnoremap <F5> :MundoToggle<cr>
let g:mundo_debug = 1
let g:mundo_preview_bottom = 1
let g:mundo_tree_statusline = "mundo"
let g:mundo_preview_statusline = "mundo preview"
" }}}
 
"  Basic Settings{{{
"
set nu
syntax enable
syntax on
let mapleader=' '
let g:mapleader=' '

set autochdir
set cursorline
set ruler
set showmatch
set showcmd
set nobackup
set noswapfile
set history=1024
set hlsearch
set incsearch
set mouse=a
set relativenumber
set autoread
set backspace=indent,eol,start whichwrap+=<,>,[,]
"}}}

" Vim UI{{{
" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed
" 设置 alt 键不映射到菜单栏
" set winaltkeys=no
" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright
"不显示工具/菜单栏
" set guioptions-=T
" set guioptions-=m
" set guioptions-=L
" set guioptions-=r
" set guioptions-=b
" 使用内置 tab 样式而不是 gui
" set guioptions-=e
set nolist

if has("gui_vimr")
    set termguicolors
elseif has('gui_running')
    set termguicolors
	set guifont=Inconsolata\ for\ Powerline:h18
else
    set t_Co=256
	set guifont=Inconsolata\ for\ Powerline:h18
endif

" theme 
set background=dark             " dark | light
" set background=light             " dark | light
colorscheme jellybeans 
" colorscheme NeoSolarized
" colorscheme sublimemonokai
" colorscheme base16-default-dark "set termguicolors
" colorscheme base16-default-light "set termguicolors
" colorscheme yowish 
" colorscheme gruvbox 
" colorscheme molokai 
" colorscheme solarized           " use solarized theme
" let g:solarized_termcolors=256  " if you are use terminal

" if has('gui_running')
"     set termguicolors
" else
"     set t_Co=256
" endif

" let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
set laststatus=2
" }}}

" Encoding, Autoindent{{{
set autoindent
set smartindent
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
" set pastetoggle=<F4>

set encoding=utf-8
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
" set fileencodings=utf-8
set fileencoding=utf-8
set fileformats=unix,dos
" language messages zh_CN.utf-8
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim
"}}}

" Keymap {{{
nmap <leader>s :source ~/.config/nvim/init.vim<cr>
nmap <leader>ss :source ~/.config/nvim/session.vim<cr>
nmap <leader>e :e ~/.config/nvim/init.vim<cr>
nmap <leader>gr :bufdo e<cr>
"set shortcut for copy to clipboard of system 
" nmap <leader>y "+y
" nmap <leader>v "+gp
inoremap jk <ESC> 
vnoremap ` <ESC> 
nnoremap <leader>es :CocCommand snippets.editSnippets<CR>

map tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>h :tabfirst<cr>
map <leader>k :tabp<cr>
map <leader>j :tabn<cr>
map <leader>l :tablast<cr>
map tt :NERDTreeToggle<CR>
map <Leader>ff :NERDTreeFind<CR>

nmap gh :MRU<CR> 
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
" nnoremap <Leader>gc :Gcommit -a -v<CR> 
nnoremap <Leader>gc :Gcommit -a<CR> 
nnoremap <Leader>gw :Gwrite<CR> 
nnoremap <Leader>gpl :Gpull<CR> 
nnoremap <Leader>gp :Gpush<CR> 
nnoremap <Leader>ga :!git add .<CR> 

" nnoremap <silent> <space>g :<C-u>CocList --normal<CR>
" nnoremap <silent> <space>m :<C-u>CocList --normal mru<cr>
" nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

" w0rp/ale
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
" nmap ak <Plug>(ale_previous_wrap)
" nmap aj <Plug>(ale_next_wrap)
" "<Leader>s触发/关闭语法检查
" nmap <Leader>a :ALEToggle<CR>
" "<Leader>d查看错误或警告的详细信息
" nmap <Leader>ad :ALEDetail<CR>

" nnoremap <Leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

" nerd commenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
" let g:NERDCustomDelimiters = { 'python': { 'left': '#','leftAlt': '"""','rightAlt': '"""' } }
let g:NERDCustomDelimiters = { 
    \ 'python': {'left': '#', 'leftAlt': '"""', 'rightAlt': '"""'},
    \ 'html': {'left': '<!--', 'right': '-->', 'leftAlt': '/*', 'rightAlt': '*/'}
    \ }
map cc          <plug>NERDCommenterComment<CR>
map cu          <plug>NERDCommenterUncomment<CR>
map cm          <plug>NERDCommenterMinimal<CR>
map cs          <plug>NERDCommenterSexy<CR>
map ci          <plug>NERDCommenterInvert<CR>
map cy          <plug>NERDCommenterYank<CR>
map ca          <plug>NERDCommenterAltDelims<CR>
map ce          <plug>NERDCommenterToEOL<CR>
map c<space>    <plug>NERDCommenterToggle<CR>

" map tt          <plug>NERDTreeTabsToggle<CR>
" map ff          <plug>NERDTreeTabsFind<CR>

" split naviagation 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [ <Plug>(coc-diagnostic-prev)
nmap <silent> ] <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> cd <Plug>(coc-diagnostic-info)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"}}}

" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='powerlineish'

" set laststatus=2

" let g:nerdtree_tabs_autofind = 1
" let g:nerdtree_tabs_focus_on_files = 1
" let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_autoclose = 1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden = 1

let NERDTreeIgnore = ['\.png$','\.jpg$','\.gif$','\.mp3$','\.flac$', '\.ogg$', '\.mp4$','\.avi$','.webm$','.mkv$','\.pdf$', '\.zip$', '\.tar.gz$', '\.rar$']

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:autopep8_on_save = 1
let g:autopep8_diff_type='vertical'
let g:autopep8_disable_show_diff=1
let g:go_metalinter_autosave = 1

" YouCompleteMe options
" set completeopt=menu,menuone
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_server_log_level = 'info'
" let g:ycm_min_num_identifier_candidate_chars = 2
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_complete_in_comments = 1
" let g:ycm_complete_in_strings = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_key_invoke_completion = '<c-y>'
" let g:ycm_goto_buffer_command = 'vertical-split'
" let g:ycm_semantic_triggers =  {
"             \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"             \ 'cs,lua,javascript': ['re!\w{2}'],
"             \ }

" vim-auto-save options
" let g:auto_save = 1
" let g:updatetime = 5000
" let g:auto_save_events = ['CursorHold']

autocmd FileType python noremap <buffer> <Leader>ap :call Autopep8()<CR>
autocmd VimLeave * mks! ~/.config/nvim/session.vim

" lightline {{{
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
" }}}

" w0rp/ale{{{
"始终开启标志列
" let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 1
" let g:ale_set_quickfix = 1
" "文件内容发生变化时不进行检查
" let g:ale_lint_on_text_changed = 'never'
" "打开文件时不进行检查
" let g:ale_lint_on_enter = 0
" "自定义error和warning图标
" let g:ale_sign_error = '✗'
" " let g:ale_sign_warning = '⚡'
" let g:ale_sign_warning = '•'
" "在vim自带的状态栏中整合ale
" " let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" "显示Linter名称,出错或警告等相关信息
" let g:ale_echo_msg_error_str = 'Error'
" let g:ale_echo_msg_warning_str = 'Warning'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" " let g:ale_completion_enabled = 1
" " let g:ale_fix_on_save = 1
" let g:ale_javascript_eslint_use_global = 1
" " let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'
" " highlight ALEWarningSign guifg=green ctermfg=green guibg=red ctermbg=red
" " highlight ALEWarningSign guifg=green guibg=#333333 
" " highlight ALEErrorSign guifg=red 
" highlight ALEWarningSign guifg=green ctermfg=green ctermbg=236 guibg=#333333
" highlight ALEErrorSign guifg=red ctermfg=red ctermbg=236 guibg=#333333
" hi ALEWarning cterm=undercurl gui=undercurl
" hi ALEError cterm=undercurl gui=undercurl
" " highlight clear ALEErrorSign
" " highlight clear ALEWarningSign
" let g:asyncrun_open = 8
" let g:ale_linters = {
" \   'go': ['golint'],
" \   'python': ['pylint'],
" \}
"}}}

" Compile & Run{{{
" map <F5> :call CompileRunGcc()<CR>
map <Leader>go :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!ipython %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go run %"
    endif
endfunc
"}}}

" bclose plugin {{{
" added by bantana
nnoremap <leader>q :Bclose<CR>
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>/ :Ack!<Space>
" }}}

" json hidden {{{
" set conceallevel=0
" }}}

