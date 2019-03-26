"------------------------------------------------------------------------------
" dein設定
"------------------------------------------------------------------------------

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if &compatible
   set nocompatible               " Be iMproved
endif

  " 設定開始
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めたTOMLファイル
    if has('nvim')
        " nvim用
        let g:rc_dir = expand('~/.config/nvim')
        let s:toml   = g:rc_dir . '/dein.toml'
        let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
    else
        " vim用
        let g:rc_dir = expand('~/.vim')
        let s:toml   = g:rc_dir . '/dein.toml'
        let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
    end

    "procの読み込み(vim-monsterを使うために)
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
  endif

  " 未インストールのものがあったらインストール
  if dein#check_install()
    call dein#install()
  endif


"------------------------------------------------------------------------------
" 初期設定
"------------------------------------------------------------------------------
" gitのコミット時にbufftypeオプションが設定されていないエラーを回避するため
set hidden

" 行番号を表示
set number

" 改行時の自動インデントを有効に
set autoindent

" 変更を自動更新
set autoread

" スクリプト実行中に画面を描画しない(jkのスピードアップのため)
set lazyredraw

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 改行入力行の末尾にあわせてインデントを増減する
set smartindent

" jsonの自動整形を無効にする
set conceallevel=0

" コンテキストに応じたタブの処理を行なう
set smarttab

" コマンドラインモードでの補完を有効にする
set wildmenu

" シンタックスを有効に
syntax on

" Tab文字を半角スペースにする
set expandtab

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2

" 自動インデント
set shiftwidth=2

" カレント行番号を目立つように
hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE

" カラーをtrueカラーに
"set termguicolors

"クリップボードへコピーできるように
set clipboard+=unnamed

"マウス操作の有効
set mouse=a

"カーソルの形状変更
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2

"検索時に大文字小文字無視
set ignorecase

"検索文字をハイライト
set hlsearch

"バックスペースを有効に
set backspace=indent,eol,start

"ピープオンを画面フラッシュへ
set visualbell

"文字コードをUTF8に
set fenc=utf-8

"行末の一文字先まで移動できるように
set virtualedit=onemore

"括弧入力時に対応する括弧を表示
set showmatch
set matchtime=1

"ステータスラインの表示
set laststatus=2
set statusline=%F
set statusline+=%m
set statusline+=%=
set statusline+=%l/%L

"補完メニューの高さ設定
set pumheight=10

" ファイルタイプの設定を有効に
filetype on            " enables filetype detection
filetype plugin indent on     " enables filetype specific plugin

" スワップファイルを作成しない
set noswapfile

" カーソル行の上下へのオフセットを設定する
set scrolloff=4

"vimの移動高速化の為にカーソルラインを無効化
set nocursorline
set norelativenumber
set nocursorcolumn

"ブッファの自動更新をウィンドウ移動時毎に実行
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

" 空白文字を可視化
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"------------------------------------------------------------------------------
" その他設定
"------------------------------------------------------------------------------

"matchparenの無効化
let g:loaded_matchparen = 1

"markdownの設定
" markdownの折りたたみなし
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal = 0
let g:vim_markdown_no_extensions_in_markdown = 1

"python3のサポートのために
let g:python3_host_prog=expand('$HOME') . '/.anyenv/envs/pyenv/shims/python'
let g:python_host_prog=expand('$HOME') . '/.anyenv/envs/pyenv/shims/python'

"molokaiのカラーを見やすく
autocmd colorscheme * highlight comment ctermfg=102
autocmd colorscheme * highlight visual ctermbg=238
autocmd colorscheme * highlight cursor ctermbg=238
autocmd colorscheme * highlight search ctermbg=8 ctermfg=253
autocmd colorscheme * highlight statusline ctermfg=241 ctermbg=10
autocmd colorscheme * highlight ColorColumn ctermbg=0 guibg=#414141
colorscheme molokai

"neovim上のターミナルを見やすく
let g:terminal_color_0="#272822"
let g:terminal_color_1="#f92672"
let g:terminal_color_2="#a6e22e"
let g:terminal_color_3="#f4bf75"
let g:terminal_color_4="#66d9ef"

"------------------------------------------------------------------------------
" キーマップ変更
"------------------------------------------------------------------------------

"挿入モードでの移動
inoremap <silent> <C-a> <Esc>^<Insert>
inoremap <silent> <C-e> <Esc>$<Insert><Right>

"jjでノーマルモードへ
inoremap <silent> jj <ESC>

"Uでredo
nnoremap <silent> U <C-r>

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" <C-l>でエンター。補完選択時に有効
nnoremap <C-l> <CR>

"空行の追加
nnoremap ` :<C-u>call append(expand('.'), '')<Cr>j

"改行のコメントアウト自動入力解除、さらに貼り付けモード解除
autocmd Filetype * set formatoptions-=o
autocmd Filetype * set formatoptions-=j

"改行時の行移動修正
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

"leaderキーをスペースに変更
map <Space> <leader>


"数字のインクリメントの設定
nnoremap + <C-a>
nnoremap - <C-x>

"インクリメンタルサーチの設定incsearch.vimの設定
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"neovimだったら
if has('nvim')
    "terminalmodeでexcでコマンドに戻れるように
    "terminalmodeでjjでコマンドに戻れるように
    "tnoremap <silent> <ESC> <C-\><C-n>
    "tnoremap <silent> jj <C-\><C-n>
end

"画面分割のウィンドウ関係のキーマップ
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap sT :<C-u>tabnew<CR>
nnoremap sr :<C-u>sp<CR>
nnoremap sR :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sV :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
if has('nvim')
    nnoremap st :<C-u>tabnew<CR>:<C-u>terminal<CR>
else
    nnoremap st :<C-u>tabnew<CR>
end

"大文字小文字変換を無効に（打ち間違い防止)
"vmap u <Nop>
"vmap U <Nop>
"vmap ~ <Nop>

"macro機能を無効にする（打ち間違い防止）
map q <Nop>

" 行の前後移動を楽にするkeymap
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $

" 行揃えを楽にするkeymap
nnoremap == gg=G''

" 行末までヤンク
nnoremap Y y$

" ページ移動
nnoremap <C-p> <C-u>
nnoremap <C-n> <C-d>

"------------------------------------------------------------------------------
" worpdress themeファイル（htmlとphpの混在）でインデントを自動有効にするために
"------------------------------------------------------------------------------
"autocmd FileType php :set ft=html
"autocmd FileType php :set syn=php

"------------------------------------------------------------------------------
" samrty tplファイル（htmlとphpの混在）でemmetを有効にするために
"------------------------------------------------------------------------------
autocmd FileType smarty :set ft=html
autocmd FileType smarty :set syn=smarty

"------------------------------------------------------------------------------
" worpdressの辞書登録
"------------------------------------------------------------------------------

" <C-x><C-k>で呼び出し
"if has('nvim')
    "autocmd FileType php :set dictionary=~/nvim/dict/vim-dict-wordpress/*.dict
"end

"------------------------------------------------------------------------------
" neocmpleteの設定
"------------------------------------------------------------------------------
if has('nvim')
else
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
end
"------------------------------------------------------------------------------
" NERDtreeのicon設定
"------------------------------------------------------------------------------

" アイコンをカラー表示にする
let g:sol = {
			\"gui": {
				\"base03": "#002b36",
				\"base02": "#073642",
				\"base01": "#586e75",
				\"base00": "#657b83",
				\"base0": "#839496",
				\"base1": "#93a1a1",
				\"base2": "#eee8d5",
				\"base3": "#fdf6e3",
				\"yellow": "#b58900",
				\"orange": "#cb4b16",
				\"red": "#dc322f",
				\"magenta": "#d33682",
				\"violet": "#6c71c4",
				\"blue": "#268bd2",
				\"cyan": "#2aa198",
				\"green": "#719e07"
			\},
			\"cterm": {
				\"base03": 8,
				\"base02": 0,
				\"base01": 10,
				\"base00": 11,
				\"base0": 12,
				\"base1": 14,
				\"base2": 7,
				\"base3": 15,
				\"yellow": 3,
				\"orange": 9,
				\"red": 1,
				\"magenta": 5,
				\"violet": 13,
				\"blue": 4,
				\"cyan": 6,
				\"green": 2
			\}
		\}
function! DeviconsColors(config)
	let colors = keys(a:config)
	augroup devicons_colors
		autocmd!
		for color in colors
			if color == 'normal'
				exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
							\ 'endif'
			elseif color == 'emphasize'
				exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
							\ 'endif'
			else
				exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
			endif
			exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
		endfor
	augroup END
endfunction
let g:devicons_colors = {
			\'normal': ['', '', '', '', ''],
			\'emphasize': ['', '', '', '', '', '', '', '', '', '', ''],
			\'yellow': ['', '', ''],
			\'orange': ['', '', '', 'λ', '', ''],
			\'red': ['', '', '', '', '', '', '', '', ''],
			\'magenta': [''],
			\'violet': ['', '', '', ''],
			\'blue': ['', '', '', '', '', '', '', '', '', '', '', '', ''],
			\'cyan': ['', '', '', ''],
			\'green': ['', '', '', '']
			\}
call DeviconsColors(g:devicons_colors)

