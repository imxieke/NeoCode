## NeoCode
> 仅用于个人备份与学习用途

## Features
- 多款主题
- 代码高亮 treesitter
- 搜索功能 Telescope && fzf-lua
  - 文件搜索
  - 代码内容搜索
- LSP/Snippets/自动补全 CMP/Coc
  - 默认仅提供 `VSCode` 格式 by `luasnip`
- TODO
  - TodoLocList Telescope
  - TodoTelescope
  - TodoTrouble
  - 支持自定义关键字
- 快捷键
  - `<A-/>` 单行注释
  - `<A-\>` 多行注释
  - `<A-t>` 创建窗口
  - `<A-w>` 关闭窗口
  - `<A-q>` 退出编辑器
  - `<A-p>` 文件搜索
  - `<A-f>` 代码搜索

## TODO
view [TODO.md](docs/TODO.md)

### Prettier 代码美化 支持格式
  - JavaScript
  - TypeScript
  - Flow
  - JSX
  - JSON
  - CSS
  - SCSS
  - Less
  - HTML
  - Vue
  - Angular HANDLEBARS
  - Ember
  - Glimmer
  - GraphQL
  - Markdown
  - YAML
- 搜索
  - [x] 文件搜索
    - Telescope fd
    - Telescope find_files
  - 文件模糊搜素
  - [x] 代码搜索
  - 代码 tag 函数搜索
  - TODO
  - 注释

:TSInstall query

## 目录说明
- data/telescope-sources 自定义 emoji 等特殊字符保存目录

# Require
```bash
# macOS
# universal-ctags: need overwrite system ctags command
# ripgrep: rg command
# the_silver_searcher: ag command
brew install ripgrep fd lua universal-ctags the_silver_searcher
# for Archlinux
pacman -S ripgrep fd lua the_silver_searcher

npm i -g neovim pyright
pip3 install neovim pynvim
```


## Install and Remove

### Install
```
git clone --depth 1 https://github.com/imxieke/NeoCode.git ~/.config/nvim
```

## Remove
```
rm -fr ~/.config/nvim
```