" === Плагины (vim-plug) ===
call plug#begin('~/.vim/plugged')

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Ruby / Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Python
Plug 'davidhalter/jedi-vim'

" Файловый менеджер
Plug 'preservim/nerdtree'

" Поиск файлов
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Цветовая схема
Plug 'morhetz/gruvbox'

call plug#end()

" === Общие настройки ===
set nocompatible
filetype plugin indent on
syntax on

" Цвета
set t_Co=256
set background=dark
colorscheme gruvbox

" Отступы
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent

" Кодировка
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251

" Поиск
set incsearch
set hlsearch
set ignorecase
set smartcase

" Интерфейс
set number
set mouse=a
set mousehide
set novisualbell
set t_vb=
set backspace=indent,eol,start whichwrap+=<,>,[,]
set wrap
set linebreak
set foldcolumn=1
set showtabline=2
set laststatus=2

" Без swap/backup
set nobackup
set noswapfile

" Копирование в системный буфер
vmap <C-C> "+yi
imap <C-V> "+gPi

" === NERDTree ===
let NERDTreeShowHidden = 1
autocmd VimEnter * NERDTree
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') | quit | endif

" === FZF ===
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

" === Go (vim-go) ===
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_referrers_mode = 'gopls'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" === Python (jedi-vim) ===
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 1
autocmd BufWritePre *.py %s/\s\+$//e

" === Tab-автодополнение ===
function! TabWrapper()
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\<Tab>"
  elseif exists('&omnifunc') && &omnifunc != ''
    return "\<C-X>\<C-O>"
  else
    return "\<C-N>"
  endif
endfunction
imap <Tab> <C-R>=TabWrapper()<CR>
