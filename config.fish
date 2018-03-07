#bashの設定コピー
set -x PATH ~/homebrew/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/munki
set -x HOMEBREW_CACHE ~/homebrew/cache

# cd > ls
function cd
  builtin cd $argv
end

# theme
set fish_theme batman

# ショートカット
alias v='~/homebrew/bin/nvim'
alias vi='~/homebrew/bin/nvim'
alias vim='~/homebrew/bin/nvim'

# pyenvの設定
set PYENV_ROOT HOME/.pyenv
eval (pyenv init - | source)

# postgresqlの設定
set -x PGDATA /Users/ryo.kawamata/homebrew/var/postgres
