# Vim Configuration

## Установка

1. Клонировать репозиторий:

```bash
git clone git@github.com:niksan/vim.git ~/.vim
```

2. Создать симлинк на `.vimrc`:

```bash
ln -s ~/.vim/.vimrc ~/.vimrc
```

3. (Опционально) Для Go-разработки — установить тулинг:

```bash
vim +GoInstallBinaries +qall
```

## Плагины

| Плагин | Описание |
|--------|----------|
| [vim-go](https://github.com/fatih/vim-go) | Go |
| [vim-ruby](https://github.com/vim-ruby/vim-ruby) | Ruby |
| [vim-rails](https://github.com/tpope/vim-rails) | Rails |
| [jedi-vim](https://github.com/davidhalter/jedi-vim) | Python |
| [nerdtree](https://github.com/preservim/nerdtree) | Файловый менеджер |
| [fzf](https://github.com/junegunn/fzf) + [fzf.vim](https://github.com/junegunn/fzf.vim) | Поиск файлов |
| [ale](https://github.com/dense-analysis/ale) | Линтинг |
| [gruvbox](https://github.com/morhetz/gruvbox) | Цветовая схема |

## Зависимости

- `fzf` >= 0.56.0 — в Ubuntu apt версия старая, лучше ставить через `go install github.com/junegunn/fzf@latest` или скачать с [releases](https://github.com/junegunn/fzf/releases)
- `vim-go` — Go + `gopls`: `:GoInstallBinaries`
