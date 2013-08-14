au VimEnter * NERDTree

"Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on

"Настройки табов для Python, согласно рекоммендациям
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
"Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1
"Включаем 256 цветов в терминале, мы ведь работаем из иксов?
"Нужно во многих терминалах, например в gnome-terminal
set t_Co=256
set nonumber
"Настройка omnicomletion для Python (а так же для js, html и css)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"Авто комплит по табу
"function InsertTabWrapper()
"let col = col('.') - 1
"if !col || getline('.')[col - 1] !~ '\k'
"return "\"
"else
"return "\<c-p>"
"endif
"endfunction
"imap <c-r>=InsertTabWrapper()
"Показываем все полезные опции автокомплита сразу
"set complete=""
"set complete+=.
"set complete+=k
"set complete+=b
"set complete+=t

"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"nippletsEmu(см. дальше в топике) по ctrl-j
"вместо tab по умолчанию (на табе автокомплит)
let g:snippetsEmu_key = "<C-j>"

set incsearch
set hlsearch
set incsearch
set nowrapscan
set ignorecase

" Копи/паст по Ctrl+C/Ctrl+V
vmap <C-C> "+yi
imap <C-V> "+gPi

colorscheme wombat256 "Цветовая схема
syntax on "Включить подсветку синтаксиса
set nu "Включаем нумерацию строк
set mousehide "Спрятать курсор мыши когда набираем текст
set mouse=a "Включить поддержку мыши
set termencoding=utf-8 "Кодировка терминала
set novisualbell "Не мигать
set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
"Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
"Вырубаем черточки на табах
set showtabline=0
"Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldcolumn=1

"Переносим на другую строчку, разрываем строки
set wrap
set linebreak

"Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
" то будет использоваться cp1251d

"
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>


set paste


"show tabline every time
set showtabline=2


"Автоотступ
set autoindent


" Tab autocompletion 
function InsertTabWrapper() 
let col = col('.') - 1 
if !col || getline('.')[col - 1] !~ '\k' 
    return "\<tab>" 
else 
    return "\<c-p>" 
endif 
endfunction 
imap <tab> <c-r>=InsertTabWrapper()<cr> 
set complete="" 
set complete+=. 
set complete+=k 
set complete+=b 
set complete+=t 
set completeopt-=preview 
set completeopt+=longest

" Make the tab key useful {{{
function TabWrapper()
  if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$'
      return "\<Tab>"
        elseif exists('&omnifunc') && &omnifunc != ''
            return "\<C-X>\<C-N>"
    else
      return "\<C-N>"
    endif
endfunction
imap <Tab> <C-R>=TabWrapper()<CR>
imap <C-cr> <C-x><C-o><C-p>

"set background=dark

filetype plugin indent on
