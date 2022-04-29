filetype plugin indent on

syntax on

set nowrap

set hlsearch

set ignorecase " 検索で大文字小文字を区別しない
set smartcase " 検索で大文字を含めたときは大文字小文字を区別する


set ruler

set number " 行数の表示

" 改行コードの可視化($表示)
" set list
set wildmenu
set showcmd

" -----------------------------
"  Tabの設定
set expandtab    "タブ文字ではなくtabstopで指定した数のスペースを挿入
set tabstop=2    "タブ文字に対する見た目の空白数
set shiftwidth=2 "インデントの見た目の空白数
set smarttab     "行頭で<Tab>を入力するとインデントを挿入する
set autoindent   "改行時に前と同じ数だけ自動でインデント挿入

set clipboard=unnamed

" -----------------------------
"  文字列のコマンド実行
"  行選択中に実行
vnoremap <Space><CR> :!sh<CR>
"行選択していない状態からコマンド実行
nnoremap <Space><CR> V:!sh<CR> 



" -----------------------------
"  移動に関する設定
set whichwrap=lh "行の頭、末尾でh、lを押したときに行移動をする

" 検索のハイライトを消すキーバインドの追加
nmap <Esc><Esc> :nohl<CR>

" o で挿入モードに入らないようにする
nnoremap o o<ESC>
nnoremap O O<ESC>

" カラースキーム選択
colorscheme desert " デフォルトで入っていテーマ

" 日本語入力ON時のカーソルの色を設定
if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=DarkCyan guifg=NONE
endif

" (、{の後に)、}の自動補完と開業の挿入
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>



" -----------------------------
" コピー
" カーソル位置から行末までヤンク（Yは元々は1行ヤンク)
nnoremap Y y$


" -----------------------------
" ファイラプラグイン netrwの有効化
filetype plugin on
" ファイルツリーの表示形式、1にするとls -laのような表示になります
let g:netrw_liststyle=1
" ヘッダを非表示にする
let g:netrw_banner=0
" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1


" -----------------------------
" プロンプトの履歴(デフォルト20個)の拡張
set history=500
" 履歴からコマンドを呼ぶときにカーソルキーを使わない
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>



" -----------------------------
" vim-plugの設定
" ※プラグインを追加した後は↓を叩くこと
" :PlugInstall
" ※削除するときはpluginをコメントアウトor削除して↓を叩くこと
" :PlugClean
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()
" -----------------------------



" -----------------------------
" lspの設定

" 警告をステータスラインに表示する:w
"
let g:lsp_diagnostics_echo_cursor = 1 

" -----------------------------
