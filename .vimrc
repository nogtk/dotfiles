set number
set cursorline " カーソルラインをハイライト
inoremap <silent> jj <ESC>
set clipboard+=unnamed
set backspace=indent,eol,start

set encoding=utf-8
scriptencoding utf-8

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" ペーストの設定
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$HOME/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('$HOME/.vim/dein/repos/github.com/Shougo/dein.vim')

call dein#add('preservim/nerdtree')
call dein#add('itchyny/lightline.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Yggdroot/indentLine')
call dein#add('haishanh/night-owl.vim')
call dein#add('hashivim/vim-terraform')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
call dein#add('Shougo/ddc.vim')
call dein#add('vim-denops/denops.vim')
call dein#add('Shougo/ddc-around')
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-sorter_rank')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')
call dein#add('shun/ddc-vim-lsp')
call dein#add('Shougo/ddc-converter_remove_overlap')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

"----------------------------------------------------------
" ステータスラインの設定
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" night-owl color scheme
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme night-owl

" ddc.vim settings ref: https://github.com/Shougo/ddc.vim
" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('sources', [
    \ 'around',
    \ 'vim-lsp',
    \ ])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \     'matchers': ['matcher_head'],
    \     'sorters': ['sorter_rank'],
    \ },
    \ 'around': { 'mark': 'around'},
    \ 'vim-lsp': {
    \ 'mark': 'LSP',
    \ 'matchers': ['matcher_head'],
    \ 'forceCompletionPattern': '\.|:|->|"\w+/*'
    \ }
    \ })

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'
" Use ddc.
call ddc#enable()

" shortcut
noremap <silent><C-e> :NERDTreeToggle<CR>
noremap <silent><C-o> :FZF<CR>
