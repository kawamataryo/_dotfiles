# cd > ls
function cd
  builtin cd $argv
end

# theme
set -x fish_theme batman

# vimモード
fish_vi_key_bindings

# ---------------------------------------------------------------------
# ショートカット
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
alias gco "git checkout"
alias gc "git commit"
alias gs "git status"
alias wp "php -d memory_limit=-1 /usr/local/bin/wp"

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

# compsoerの設定
set -x PATH Unknown command /Users/kawamataryou/.composer/vendor/bin $PATH

# ---------------------------------------------------------------------
# envの設定
# ---------------------------------------------------------------------
# anyenvの設定
set -x PATH $HOME/.anyenv/bin $PATH
# rbenv
set -x RBENV_ROOT "$HOME/.anyenv/envs/rbenv"
set -x PATH $PATH "$RBENV_ROOT/bin"
status --is-interactive; and source (rbenv init -|psub)

# ndenv
set -x NDENV_ROOT "$HOME/.anyenv/envs/ndenv"
set -x PATH $PATH "$NDENV_ROOT/bin"
set -gx PATH "$NDENV_ROOT/shims" $PATH
set -gx NDENV_SHELL fish
command ndenv rehash 2>/dev/null
function ndenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    eval (ndenv sh-"$command" $argv|psub)
  case '*'
    command ndenv "$command" $argv
  end
end

# pyenv
set -x PYENV_ROOT "$HOME/.anyenv/envs/pyenv"
set -x PATH $PATH "$PYENV_ROOT/bin"
status --is-interactive; and source (pyenv init -|psub)

# ---------------------------------------------------------------------
# sshの設定
# ---------------------------------------------------------------------

# ssh-addの設定
function ssh_makoto
    ssh-add -K ~/.ssh/makotoxserver/id_rsa
end

function ssh_acuweb
    ssh-add -K ~/.ssh/conoha_acuweb/id_rsa
end

function ssh_oasis
    ssh-add -K ~/.ssh/oasisserver/id_rsa
end

function ssh_conoha
    ssh-add -K ~/.ssh/conoha_patient_db/conoha_patient_db
end

function ssh_oasis
    ssh-add -K ~/.ssh/oasisserver/id_rsa
end

function ssh_hattori
    ssh-add -K ~/.ssh/hattorixserver/id_rsa
end

function ssh_conoha
    ssh-add -K ~/.ssh/conoha_patient_db/id_rsa
end

function ssh_git
    ssh-add -K ~/.ssh/id_git_rsa
end

function gnow
    git now
end
