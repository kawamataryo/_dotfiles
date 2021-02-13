# cd > ls
function cd
  builtin cd $argv
end

# theme
set -x fish_theme batman

# vimモード
# fish_vi_key_bindings

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
# envの設定
# ---------------------------------------------------------------------
# anyenvの設定
set -x PATH $HOME/.anyenv/bin $PATH

# rbenv
set -x RBENV_ROOT "$HOME/.anyenv/envs/rbenv"
set -x PATH $PATH "$RBENV_ROOT/bin"
status --is-interactive; and source (rbenv init -|psub)

# nodenv
set -x NODENV_ROOT "$HOME/.anyenv/envs/nodenv"
set -x PATH $HOME/.anyenv/envs/nodenv/bin $PATH
set -x PATH $NODENV_ROOT/shims $PATH
status --is-interactive; and source (nodenv init -|psub)

# pyenv
set -x PYENV_ROOT "$HOME/.anyenv/envs/pyenv"
set -x PATH $PATH "$PYENV_ROOT/bin"
status --is-interactive; and source (pyenv init -|psub)

# goenv
set -x GOENV_ROOT "$HOME/.anyenv/envs/goenv"
set -x PATH $PATH "$GOENV_ROOT/bin"

set -gx PATH "$GOENV_ROOT/shims" $PATH
set -gx GOENV_SHELL fish
source "$GOENV_ROOT/libexec/../completions/goenv.fish"
command goenv rehash 2>/dev/null
function goenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (goenv "sh-$command" $argv|psub)
  case '*'
    command goenv "$command" $argv
  end
end

# openssl
set -x LIBRARY_PATH $LIBRARY_PATH "/usr/local/opt/openssl/lib/"

# google-cloud-sdk
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# flutter
set -x PATH $PATH "$HOME/flutter/bin"

# ---------------------------------------------------------------------
# 便利alias
# ---------------------------------------------------------------------

# fzfの設定
alias gcf "git branch | fzf | xargs git checkout"

# nvimの設定
alias vim nvim
alias vi nvim
alias v nvim

# githubにリポジトリを作り、ghqで取得、vscodeでひらく
function ghcr
 gh repo create $argv
 ghq get git@github.com:kawamataryo/{$argv[1]}.git
 code /Users/kawamataryou/ghq/github.com/kawamataryo/{$argv[1]}
end

# ghコマンドの補完
eval (gh completion -s fish| source)
