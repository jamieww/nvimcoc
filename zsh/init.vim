" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" python {{{
" let g:python_host_prog="/Users/jamieww/.pyenv/versions/anaconda2-4.0.0/bin/python"
" let g:python_host_prog="/Users/jamieww/.pyenv/versions/3.7.3/bin/python"
" let g:python3_host_prog="/Users/jamieww/.pyenv/versions/3.7.3/bin/python3"
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

" Plugin {{{
if has('nvim')
    " set rtp+=~/.pyenv/versions/3.7.3/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
    " set rtp+=~/.pyenv/versions/3.7.3/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
else
    set rtp+=~/.config/nvim/plugged/powerline/powerline/bindings/vim
endif

call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
Plug 'scrooloose/nerdtree'                " file/directory treee
Plug 'scrooloose/nerdcommenter'           " code commenter
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder
" Plug 'altercation/vim-colors-solarized'   " solarized themePlug 'jnurmine/Zenburn'
" Plug 'icymind/NeoSolarized'
" Plug 'ErichDonGubler/vim-sublime-monokai'
" Plug 'chriskempson/base16-vim'
" Plug 'KabbAmine/yowish.vim'
" Plug 'tomasr/molokai'
" Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

" Install nightly build, replace ./install.sh with install.cmd on windows
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" Plug 'Valloric/YouCompleteMe'
Plug 'yegappan/mru'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
if has('nvim')
    Plug 'itchyny/lightline.vim'
else
    Plug 'powerline/powerline'
endif
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tell-k/vim-autopep8'
Plug 'gabrielelana/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'
" Plug 'iamcco/mathjax-support-for-mkdp'
" Plug 'iamcco/markdown-preview.vim'
Plug '907th/vim-auto-save'
" Plug 'skywind3000/asyncrun.vim'
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
" Plug 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Initialize plugin system
call plug#end()
filetype plugin indent on    " required
"}}}

"  Basic Settings{{{
"
set nu
syntax enable
syntax on
let mapleader=','
let g:mapleader=','

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
set guifont=Inconsolata\ for\ Powerline:h18

" theme 
set background=dark             " dark | light
colorscheme jellybeans 
" colorscheme NeoSolarized
" colorscheme sublimemonokai
" colorscheme base16-default-dark "set termguicolors
" colorscheme yowish 
" colorscheme gruvbox 
" colorscheme molokai 
" colorscheme solarized           " use solarized theme
" let g:solarized_termcolors=256  " if you are use terminal
if has('gui_running')
    set termguicolors
else
    set t_Co=256
endif

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
"set shortcut for copy to clipboard of system 
" nmap <leader>y "+y
nmap <leader>v "+gp

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabp<cr>
map <leader>tl :tabn<cr>
map <Leader>tt :NERDTreeToggle<CR>
map <Leader>ff :NERDTreeFind<CR>

nmap <Leader>h :MRU<CR> 
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
" nnoremap <Leader>gc :Gcommit -a -v<CR> 
nnoremap <Leader>gc :Gcommit -a<CR> 
nnoremap <Leader>gw :Gwrite<CR> 
nnoremap <Leader>gpl :Gpull<CR> 
nnoremap <Leader>gp :Gpush<CR> 
nnoremap <Leader>ga :!git add .<CR> 

" w0rp/ale
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap ak <Plug>(ale_previous_wrap)
nmap aj <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>a :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>ad :ALEDetail<CR>

nnoremap <Leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

" nerd commenter
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'python': { 'left': '#','leftAlt': '"""','rightAlt': '"""' } }
map cc          <plug>NERDCommenterComment<CR>
map cu          <plug>NERDCommenterUncomment<CR>
map cm          <plug>NERDCommenterMinimal<CR>
map cs          <plug>NERDCommenterSexy<CR>
map ci          <plug>NERDCommenterInvert<CR>
map cy          <plug>NERDCommenterYank<CR>
map ce          <plug>NERDCommenterToEOL<CR>
map c<space>    <plug>NERDCommenterToggle<CR>

" map tt          <plug>NERDTreeTabsToggle<CR>
" map ff          <plug>NERDTreeTabsFind<CR>
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

" YouCompleteMe options
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<c-y>'
let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

" vim-auto-save options
let g:auto_save = 1
let g:updatetime = 5000
let g:auto_save_events = ['CursorHold']

autocmd FileType python noremap <buffer> <Leader>ap :call Autopep8()<CR>
autocmd VimLeave * mks! ~/.config/nvim/session.vim

" w0rp/ale{{{
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_set_quickfix = 1
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'
let g:ale_sign_warning = '•'
"在vim自带的状态栏中整合ale
" let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_completion_enabled = 1
" let g:ale_fix_on_save = 1
let g:ale_javascript_eslint_use_global = 1
" let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'
" highlight ALEWarningSign guifg=green ctermfg=green guibg=red ctermbg=red
" highlight ALEWarningSign guifg=green guibg=#333333 
" highlight ALEErrorSign guifg=red 
highlight ALEWarningSign guifg=green ctermfg=green ctermbg=236 guibg=#333333
highlight ALEErrorSign guifg=red ctermfg=red ctermbg=236 guibg=#333333
hi ALEWarning cterm=undercurl gui=undercurl
hi ALEError cterm=undercurl gui=undercurl
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
let g:asyncrun_open = 8
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

