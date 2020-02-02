# cd > ls
function cd
  builtin cd $argv
end

# theme
set -x fish_theme batman

# vimモード
# fish_vi_key_bindings

# ---------------------------------------------------------------------
# envの設定
# ---------------------------------------------------------------------
# anyenvの設定
set -x PATH $HOME/.anyenv/bin $PATH

# rbenv
set -x RBENV_ROOT "$HOME/.anyenv/envs/rbenv"
set -x PATH $PATH "$RBENV_ROOT/bin"
status --is-interactive; and source (rbenv init -|psub)

# nodenv
set -x NODENV_ROOT $HOME/.anyenv/envs/nodenv
set -x PATH $HOME/.anyenv/envs/nodenv/bin $PATH
set -x PATH $NODENV_ROOT/shims $PATH
status --is-interactive; and source (nodenv init -|psub)

# pyenv
set -x PYENV_ROOT "$HOME/.anyenv/envs/pyenv"
set -x PATH $PATH "$PYENV_ROOT/bin"
status --is-interactive; and source (pyenv init -|psub)

# openssl
set -x LIBRARY_PATH $LIBRARY_PATH "/usr/local/opt/openssl/lib/"

# go
set -x GOPATH "$HOME"
set -x PATH $PATH "$GOPATH/bin"

# ---------------------------------------------------------------------
# plugin設定
# ---------------------------------------------------------------------
set -U FZF_LEGACY_KEYBINDINGS 0

# ---------------------------------------------------------------------
# PATHの追加
# ---------------------------------------------------------------------
# neovimの設定
set -x XDG_CONFIG_HOME $HOME/.config

# brewの設定
set -x PATH /usr/local/bin $PATH

# 独自binの設定
set -x PATH $HOME/bin $PATH

# opensslの設定
set -x PATH /usr/local/opt/openssl/bin $PATH

# qt@5.5の設定
set -x PATH /usr/local/opt/qt@5.5/bin $PATH

# ---------------------------------------------------------------------
# 便利alias
# ---------------------------------------------------------------------
# vim,vコマンドでnvimを開くようにする
alias v "nvim"
alias vi "nvim"
alias vim "nvim"

# git alias
alias ga  "git add"
alias gaa  "git add ."
alias gd  "git diff"
alias gb  "git branch"
alias gc "git checkout"
alias gm "git commit"
alias gs "git status"

function ga
  git add $arg
end

function gaa
  git add .
end

function gm
  git commit $arg
end

# rmtrash
function rmt
  rmtrash $arg
end

# fzfの設定
alias gcf "git branch | fzf | xargs git checkout"

# ghqのエイリアス
alias gh='hub browse (ghq list | fzf | cut -d "/" -f 2,3)'

# cran
function cr
  crane run
end

