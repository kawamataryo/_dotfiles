#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# ---------------------------------------------------------------------
# 転職日の意識の為に
# ---------------------------------------------------------------------




# ---------------------------------------------------------------------
# PATHの追加
# ---------------------------------------------------------------------
# brewの設定
export PATH="/usr/local/bin:$PATH"

# anyenvの設定
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - --no-rehash)"

# globalのnpmの設定
# export PATH=$PATH:`npm bin -g`
# 独自binの設定
export PATH=$HOME/bin:$PATH

# wp-clinのコマンド保管パスの設定
if [[ -s "$HOME/wp-completion.bash" ]]; then
    autoload -U +X bashcompinit && bashcompinit
    source "$HOME/wp-completion.bash"
fi

# ---------------------------------------------------------------------
# プラグイン
# ---------------------------------------------------------------------
# neovimの設定
export XDG_CONFIG_HOME=$HOME/.config

# vim,vコマンドでnvimを開くようにする
alias v=nvim
alias vi=nvim

# vimのキーバインドの設定
bindkey -M viins 'jj' vi-cmd-mode

# git-forestの設定
function gifo() { git-foresta --style=10 "$@" | less -RSX }
function gifa() { git-foresta --all --style=10 "$@" | less -RSX }
compdef _git gifo=git-log
compdef _git gifa=git-log

# php lintの設定
export PATH=$HOME/vendor/bin:$PATH

# pecoで探したフォルダに移動
function find_cd() {
    cd "$(find . -type d | peco)"
}
alias fc="fc"

#pecoでhistory検索(<-R>で起動)
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ---------------------------------------------------------------------
# zの設定
# ---------------------------------------------------------------------
autoload -Uz is-at-least

# Treat hook functions as array
typeset -ga chpwd_functions
typeset -ga precmd_functions
typeset -ga preexec_functions

# Simulate hook functions for older versions
if ! is-at-least 4.2.7; then
  function chpwd() { local f; for f in $chpwd_functions; do $f; done }
  function precmd() { local f; for f in $precmd_functions; do $f; done }
  function preexec() { local f; for f in $preexec_functions; do $f; done }
fi

function load-if-exists() { test -e "$1" && source "$1" }

# z - jump around {{{2
# https://github.com/rupa/z
_Z_CMD=j
_Z_DATA=$ZDOTDIR/.z
if is-at-least 4.3.9; then
  load-if-exists $ZDOTDIR/z/z.sh
else
  _Z_NO_PROMPT_COMMAND=1
  load-if-exists $ZDOTDIR/z/z.sh && {
    function precmd_z() {
      _z --add "$(pwd -P)"
    }
    precmd_functions+=precmd_z
  }
fi
test $? || unset _Z_CMD _Z_DATA _Z_NO_PROMPT_COMMAND

# ---------------------------------------------------------------------
# 独自ショートカットとかtips
# ---------------------------------------------------------------------
# cdの後にlsを実行
function chpwd() {
    if [ 25 -gt `ls -1 | wc -l` ]; then
        ls
    else

    fi
}

# gitで全部ステージに
function git_add_all() {
    git add .
}
alias gaa="git_add_all"

# gitでコミット
function git_commit() {
    git commit
}
alias gc="git_commit"

# gitでステータス
function git_status() {
    git status
}
alias gs="git_status"

# gitでブランチ切り替え
function git_checkout() {
    git checkout
}
alias gch="git_checkout"

# gitでブランチ作成切り替え
function git_create_branch() {
    git checkout -b
}
alias gchb="git_create_branch"

# gitでブランチ一覧
function git_branch() {
    git branch
}
alias gb="git_branch"

# gitでgraph
function git_graph() {
    git graph
}
alias gg="git_graph"
# ssh-addの設定
function ssh_makoto() {
    ssh-add -K ~/.ssh/makotoxserver/id_rsa
}

function ssh_oasis() {
    ssh-add -K ~/.ssh/oasisserver/id_rsa
}

function ssh_conoha() {
    ssh-add -K ~/.ssh/conoha_patient_db/conoha_patient_db
}

function ssh_oasis() {
    ssh-add -K ~/.ssh/oasisserver/id_rsa
}

function ssh_hattori() {
    ssh-add -K ~/.ssh/hattorixserver/id_rsa
}
function ssh_conoha() {
    ssh-add -K ~/.ssh/conoha_patient_db/id_rsa
}


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
