# README

neovim coc.nvim and vim-go

```bash

brew install neovim

brew install python3

pip3 list |awk 'NR>2 {print "pip3 install --upgrade --user "$1}'|bash -

pip3 install neovim

git clone https://github.com/bantana/nvimcoc

nvim  +"CocInstall coc-python coc-pyls coc-vetur coc-snippets coc-stylelint coc-css coc-prettier coc-yaml coc-tslint coc-html coc-tsserver coc-eslint coc-emmet coc-json"

nvim +GoInstallBinaries main.go

brew install ack
```


## install powerline

use vim8 or macvim, neovim暂不支持powerline

```bash
if has('nvim')
    set rtp+=~/.pyenv/versions/3.7.3/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
else
    set rtp+=~/.config/nvim/plugged/powerline/powerline/bindings/vim
endif
```

安装powerline字体

```bash
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

同时设置终端的偏好设置的字体为Inconsolata-g for Powerline 14，vim显示的powerline的字体效果才能正常

## install node

use homebrew

```bash
brew install node@10
```

or install use nvm

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm ls-remote
nvm install v10.15.0
```

## coc.nvim

soft link ~/.config/nvim/ultisnips -> ~/.config/coc/ultisnips

```bash
cd ~/.config/coc && ln -s ~/.config/nvim/ultisnips
```

### golang

install go-langserver

```bash
go get -u -v github.com/sourcegraph/go-langserver
```

vi ~/.config/nvim/coc-settings.json

```json
"languageserver": {
  "golang": {
    "command": "go-langserver",
      "filetypes": ["go"],
      "initializationOptions": {
        "gocodeCompletionEnabled": true,
        "diagnosticsEnabled": true,
        "lintTool": "golint"
      }
  }
}
```

### python

install python-language-server

```bash
pip install python-language-server
```

vi ~/.config/nvim/coc-settings.json

```json

```


### bash

```bash

yarn global add bash-language-server

```

vi ~/.config/nvim/coc-settings.json

```json

  "languageserver": {
      "bash": {
        "command": "bash-language-server",
        "args": ["start"],
        "filetypes": ["sh"],
        "ignoredRootPaths": ["~"]
      }
  }
```

### dart

install dart sdk

```bash
brew tap dart-lang/dart
brew install dart
brew upgrade dart
```

install dart_language_server

On option is use coc-flutter

`:CocInstall coc-flutter`

```bash
pub global activate dart_language_server

```

vi ~/.config/nvim/coc-settings.json

```json
"languageserver": {
  "dart": {
    "command": "dart_language_server",
    "args": [],
    "filetypes": ["dart"],
    "initializationOptions": {},
    "settings": {
      "dart": {
        "validation": {},
        "completion": {}
      }
    }
  },
}

```

### Dockerfile

install dockerfile-language-server-nodejs

```bash
yarn global add dockerfile-language-server-nodejs

```

~/.config/nvim/coc-settings.json

```json
"languageserver": {
  "dockerfile": {
    "command": "docker-langserver",
    "filetypes": ["dockerfile"],
    "args": ["--stdio"]
  }
}
```

### typescript

```bash
yarn global add javascript-typescript-langserver
```

### c, c++, object/c

```bash
brew tap twlz0ne/homebrew-ccls
brew install ccls
```

```json
    "ccls": {
      "command": "ccls",
      "filetypes": ["c", "cpp", "objc", "objcpp"],
      "rootPatterns": [
        ".ccls",
        "compile_commands.json",
        ".vim/",
        ".git/",
        ".hg/"
      ],
      "initializationOptions": {
        "cacheDirectory": "/tmp/ccls"
      }
    },
```

## vimtex mactex skim

latex support

~/.config/nvim/init.nvim

    Plug 'lervag/vimtex', {'for': ['tex', 'plaintex', 'bst']}

```bash
brew cask install mactex skim
```

```bash
if [[ -d /usr/local/texlive/2018/bin/x86_64-darwin ]]; then
  #statements
  export PATH=$PATH:/usr/local/texlive/2018/bin/x86_64-darwin
fi
```

```vimscript
" vimtex {{{
" require: brew cask install mactex skim
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'
let g:vimtex_compiler_enabled=1
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" TOC settings
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}
"
" }}}
```

vim command:

    :vimtexCompile

## floobits.com

plugin:

    Plug 'floobits/floobits-neovim'

visit floobits.com to register a account.
