function cd
  builtin cd $argv
end

# theme
set -x fish_theme batman

# ショートカット
alias v='~/homebrew/bin/nvim'
alias vi='~/homebrew/bin/nvim'
alias vim='~/homebrew/bin/nvim'

# vimモード
fish_vi_key_bindings

# ---------------------------------------------------------------------
# PATHの追加
# ---------------------------------------------------------------------
# brewの設定
set PATH /usr/local/opt/openssl/bin $HOME/bin $HOME/.anyenv/bin /usr/local/bin  $PATH

# anyenvの設定
eval (anyenv init --no-rehash | source)

# ---------------------------------------------------------------------
# プラグイン
# ---------------------------------------------------------------------

# neovimの設定
set XDG_CONFIG_HOME $HOME/.config

# vim,vコマンドでnvimを開くようにする
alias v='/usr/local/bin/nvim'
alias vi='/usr/local/bin/nvim'

# rmでゴミ箱に入れる
alias rm='rmtrash'
