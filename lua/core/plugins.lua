vim.cmd 'packadd packer.nvim'

require('packer').init({
    ensure_dependencies = true,
    log = {
        level = 'debug'
    },
    auto_clean = true,
    autoremove = true,
    compile_on_sync = true,
    git = {
        cmd = 'git', -- The base command for git operations
        subcommands = { -- Format strings for git subcommands
            update = 'pull --ff-only --progress --rebase=false',
            install = 'clone --depth %i --no-single-branch --progress',
            fetch = 'fetch --depth 999999 --progress',
            checkout = 'checkout %s --',
            update_branch = 'merge --ff-only @{u}',
            current_branch = 'branch --show-current',
            diff = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
            diff_fmt = '%%h %%s (%%cr)',
            get_rev = 'rev-parse --short HEAD',
            get_msg = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
            submodules = 'submodule update --init --recursive --progress'
        },
        depth = 1, -- Git clone depth
        clone_timeout = 60, -- Timeout, in seconds, for git clones
        default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
    }
})

-- ft 指定打开文件类型才加载
return require('packer').startup(function(use)
    -- 包管理
    use 'wbthomason/packer.nvim'

    -- #################################################################
    --  		 	 Features
    -- #################################################################
    -- SQLite/LuaJIT binding for lua and neovim
    -- Depends By nvim-telescope/telescope-frecency.nvim
    use "kkharji/sqlite.lua"
    -- 依赖 nerd 字体
    -- Depends By folke/trouble.nvim
    use "kyazdani42/nvim-web-devicons"

    -- 🌈 creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin LSP client.
    -- Depends By folke/trouble.nvim option
    use 'folke/lsp-colors.nvim'
    use "folke/trouble.nvim"
    -- ✅ Highlight, list and search todo comments in your projects
    use "folke/todo-comments.nvim"

    -- full; complete; entire; absolute; unqualified. All the lua functions
    -- Depends By Telescope nvim-lua/popup.nvim Shatur/neovim-session-manager sudormrfbin/cheatsheet.nvim
    use "nvim-lua/plenary.nvim"
    -- An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
    -- Depends By sudormrfbin/cheatsheet.nvim
    use "nvim-lua/popup.nvim"

    -- Find, Filter, Preview, Pick. All lua, all the time.
    use "nvim-telescope/telescope.nvim"
    -- 似乎就是 UI 基础库
    use "nvim-telescope/telescope-ui-select.nvim"
    -- Live grep with args 代码搜索
    use "nvim-telescope/telescope-live-grep-args.nvim"
    -- A telescope.nvim extension that offers intelligent prioritization when selecting files from your editing history.
    use "nvim-telescope/telescope-frecency.nvim"
    -- A history implementation that memorizes prompt input for a specific context
    use "nvim-telescope/telescope-smart-history.nvim"
    -- File Browser extension for telescope.nvim
    use "nvim-telescope/telescope-file-browser.nvim"
    -- An extension that provides its users with node packages under node_modules directory
    use "nvim-telescope/telescope-node-modules.nvim"
    -- FZF sorter for telescope written in c
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    -- provides extra functionality for Packer.nvim
    use "nvim-telescope/telescope-packer.nvim"
    -- A Neovim Telescope extension to open your browser bookmarks right from the editor!
    use "dhruvmanila/telescope-bookmarks.nvim"
    -- markdown letex asciidoc neorg ReStructuredText vimhelp 等文档的头部标签 如 markdown ##
    use "crispgm/telescope-heading.nvim"
    -- 😃 Emoji Search
    use "xiyaowong/telescope-emoji.nvim"
    -- An extension for telescope.nvim that allows you to search font glyphs
    use "ghassan0/telescope-glyph.nvim"
    use "fhill2/telescope-ultisnips.nvim"
    -- get ctags outline for telescope.nvim
    use "fcying/telescope-ctags-outline.nvim"
    -- Create key-bindings and watch them with telescope 🔭
    use "LinArcX/telescope-command-palette.nvim"
    -- The Silver Searcher (Ag) functionality similar to that of fzf.vim
    use "kelly-lin/telescope-ag"
    -- coc.nvim integration for telescope.nvim
    -- use "fannheyward/telescope-coc.nvim"
    -- bundled cheatsheets for the editor, multiple vim plugins, nerd-fonts, regex, etc. with a Telescope fuzzy finder interface
    -- TODO: 不知道有什么卵用待删除
    use "sudormrfbin/cheatsheet.nvim"
    -- An extension for Telescope that registers handlers
    use "gbrlsnchs/telescope-lsp-handlers.nvim"
    -- Telescope extension to preview media files using Ueberzug.
    -- use "nvim-telescope/telescope-media-files.nvim"
    -- Telescope.nvim extension that adds LuaSnip integration.
    use {
        "benfowler/telescope-luasnip.nvim",
        module = "telescope._extensions.luasnip" -- if you wish to lazy-load
    }

    -- A simple wrapper around :mksession
    -- use 'Shatur/neovim-session-manager'

    -- A neovim lua plugin to help easily manage multiple terminal windows
    -- 可用于创建独立浮动窗口 如 vim 中查看 htop
    use 'akinsho/toggleterm.nvim'

    -- experimental quick picker for vim 快速选择选项
    -- 似乎没什么用 待测试
    use 'prabirshrestha/quickpick.vim'
    -- filetype picker for quickpick.vim
    -- :Pfiletypes
    use 'prabirshrestha/quickpick-filetypes.vim'
    -- 快速选择并预览主题
    -- :Pcolorschemes
    use 'prabirshrestha/quickpick-colorschemes.vim'

    -- Async Language Server Protocol plugin for vim8 and neovim.
    use "prabirshrestha/async.vim"

    -- 🌻 A Vim alignment plugin 如 PHP 数组内对其
    use "junegunn/vim-easy-align"

    -- Vim plugin that displays tags in a window, ordered by scope
    -- 查看 函数变量等信息
    use 'preservim/tagbar'
    -- 🌵 Viewer & Finder for LSP symbols and tags
    -- -- 查看 函数变量等信息
    use 'liuchengxu/vista.vim'
    -- A code outline window for skimming and quick navigation
    -- 查看 函数变量等信息
    use 'stevearc/aerial.nvim'
    -- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
    use 'simrat39/symbols-outline.nvim'

    -- A plugin for Neovim that helps you surf through your document and move elements around using the nvim-treesitter API.
    -- 提供对代码进行移动 复制 多行操作 等行为
    use "ziontee113/syntax-tree-surfer"
    -- A small Neovim plugin for previewing definitions using floating windows.
    -- vscode-like pictograms for neovim lsp completion items
    -- 提供自动提示前面的 icon 可以分辨出是什么软件提供 什么类型 如 function method variable snippet const 等等
    use "onsails/lspkind.nvim"
    -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    use "sindrets/diffview.nvim"

    -- Icon Picker
    use { -- This is a Neovim plugin that helps you pick Nerd Font Icons, Symbols & Emojis
    "ziontee113/icon-picker.nvim"}

    -- EditorConfig plugin for Vim
    use "editorconfig/editorconfig-vim"
    -- Library of 20+ independent Lua modules improving overall Neovim (version 0.5 and higher) experience with minimal effort

    -- 为 NeoVim 提供 IDE 的一些特性以及一些 lua utils
    use { -- 提供快速注释的能力
    "numToStr/Comment.nvim", -- A framework for building Neovim plugins
    "ldelossa/litee.nvim",
    -- Library of 20+ independent Lua modules improving overall Neovim (version 0.5 and higher) experience with minimal effort
    "echasnovski/mini.nvim"}

    -- 提供搜索能力
    use { -- Improved fzf.vim written in lua
    "ibhagwan/fzf-lua"}

    use { -- 功能比较简陋不支持按键 需自定义命令或按键 详见 :help litee-filetree.nvim
    "ldelossa/litee-filetree.nvim", -- A document outline tool implemented with the litee.nvim library
    "ldelossa/litee-symboltree.nvim", -- Neovim's missing call hierarchy UI
    "ldelossa/litee-calltree.nvim", "ldelossa/litee-bookmarks.nvim"}

    -- #################################################################
    -- 			   LSP, Treesitter Completion Coc + CMP
    -- #################################################################
    -- Quickstart configs for Nvim LSP
    -- Depends By hrsh7th/nvim-cmp
    use {"neovim/nvim-lspconfig"}

    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    use { -- language server protocol installer
    "williamboman/mason.nvim", -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
    "williamboman/mason-lspconfig.nvim"}

    -- Nvim Treesitter configurations and abstraction layer
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- Show code context
    use 'nvim-treesitter/nvim-treesitter-context'
    -- Refactor module for nvim-treesitter
    use "nvim-treesitter/nvim-treesitter-refactor"
    -- Syntax aware text-objects, select, move, swap, and peek support.
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- treesitter An incremental parsing system for programming tools
    -- 语法解析

    -- Original popup completion menu framework library
    -- 待删除
    use 'Shougo/pum.vim'

    -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
    use 'glepnir/lspsaga.nvim'

    -- cmp
    -- A completion plugin for neovim coded in Lua.
    use 'hrsh7th/nvim-cmp'
    -- nvim-cmp source for path
    -- paths of files and folders
    use "hrsh7th/cmp-path"
    -- nvim-cmp source for buffer words
    use "hrsh7th/cmp-buffer"
    -- nvim-cmp source for emoji
    use "hrsh7th/cmp-emoji"
    -- nvim-cmp source for vim's cmdline
    use "hrsh7th/cmp-cmdline"
    -- nvim-cmp source for omnifunc
    -- based on Vim's omnifunc
    -- use "hrsh7th/cmp-omni"
    -- nvim-cmp source for math calculation
    use "hrsh7th/cmp-calc"
    -- nvim-cmp source for nvim lua
    -- You can get the vim.lsp.util.* API with this source
    -- use {
    -- "hrsh7th/cmp-nvim-lua",
    -- ft = "lua"
    -- }
    -- nvim-cmp source for neovim builtin LSP client
    -- use "hrsh7th/cmp-nvim-lsp"
    -- ripgrep source for nvim-cmp
    use "lukas-reineke/cmp-rg"
    -- tags completion source for nvim-cmp
    use "quangnguyen30192/cmp-nvim-tags"
    -- Universal Ctags source for nvim-cmp.
    use "delphinus/cmp-ctags"
    -- cmp source for treesitter
    use "ray-x/cmp-treesitter"
    -- TabNine plugin for hrsh7th/nvim-cmp
    use {
        "tzachar/cmp-tabnine",
        run = "bash ./install.sh"
    }

    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    -- 似乎还可以提供 snippets 功能 luasnip
    use "jose-elias-alvarez/null-ls.nvim"

    -- 💻 Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    -- 自动完成 函数等信息 hover doc
    use "folke/neodev.nvim"

    -- Neovim lua API for highly extensible popup window
    -- Depends By RishabhRD/nvim-lsputils
    use {
        "RishabhRD/popfix",
        run = "sh ./install_fzy_native_sorter"
    }
    -- Better defaults for nvim-lsp actions
    use "RishabhRD/nvim-lsputils"

    -- Pop-up menu for code actions to show meta-information and diff preview
    -- 为错误代码提供快速修复解决方案 并支持修复前后对比diff
    use 'weilbith/nvim-code-action-menu'
    -- use {
	-- 	'xiyaowong/coc-code-action-menu.nvim',
    --     after = 'coc.nvim'
    -- }

	-- Free, ultrafast Copilot alternative for Vim and Neovim
	use 'jcdickinson/codeium.nvim'
    -- Source code analysis & navigation plugin for Neovim. Navigate codes like a breeze🎐. Exploring LSP and 🌲Treesitter symbols a piece of 🍰. Take control like a boss 🦍
    use "ray-x/navigator.lua"

    -- #################################################################
    -- 	  				Code
    -- #################################################################
    -- Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.
    -- use {
    --     'neoclide/coc.nvim',
    --     branch = 'release'
    -- }

    -- #################################################################
    --                 Syntax && Code Feature Support
    -- #################################################################
    -- 提供 pandoc 时编写的一些完善的功能
    -- use "vim-pandoc/vim-pandoc"
    -- use "vim-pandoc/vim-pandoc-syntax"
    -- rmarkdown 语法支持
    -- use "vim-pandoc/vim-rmarkdown"
    -- Insert Extended Markdown Footnotes in Vim
    -- use "vim-pandoc/vim-markdownfootnotes"
    -- Syntax highlighting, matching rules and mappings
    use "preservim/vim-markdown"
    -- nginx vim syntax highlighting
    -- use "chr4/nginx.vim"
    -- Docker Syntax highlighting
    -- use "danishprakash/vim-docker"

    -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
    -- CSS HTML 颜色代码高亮
    use "norcalli/nvim-colorizer.lua"

    -- #################################################################
    --                   Snippets
    -- #################################################################
    -- Snippets Engine
    -- 常见 Snippets 格式 neosnippet UltiSnips massCode snipmate VSCode
    -- 已经安装 coc-snippets 支持 UltiSnips snipmate VSCode(支持自定义目录) massCode(App Runtime need)
    -- 后缀为 .snip 的为标准 standard snippets
    -- 后缀为 .UltiSnips 的 UltiSnips snippet 关键字
    -- 目录含有 snippets/*.json (prefix body description 关键字) 为 VSCode 格式

    -- 支持 SnipMate VSCode LSP
	-- 	-- Snippet Engine for Neovim written in Lua.
	use {'L3MON4D3/LuaSnip'}

	-- luasnip completion source for nvim-cmp
    use "saadparwaiz1/cmp_luasnip"

    -- 前端 VSCode 格式
    -- 含有多种语言
    -- use "imxieke/snippets"
    use "capaj/vscode-standardjs-snippets"
    use "Wscats/html-snippets"
    use "rafamadriz/friendly-snippets"
    use "kitagry/vs-snippets"

    -- Python
    use "cstrap/python-snippets"
    use "cstrap/flask-snippets"

    -- C
    use "Harry-Ross/vscode-c-snippets"
    use "one-harsh/vscode-cpp-snippets"
    -- Jekylltr
    use "edheltzel/vscode-jekyll-snippets"
    -- Cobol
    -- use "spgennard/vscode_cobol"
    -- Latex
    -- use "JeffersonQin/VSCode-LaTeX-Snippets"

    -- #################################################################
    --                   UI
    -- #################################################################
    -- 似乎是默认 UI 的优化版本 覆盖了默认的 UI 无功能 仅提供 UI 库
    use { -- Neovim plugin to improve the default vim.ui interfaces
    "stevearc/dressing.nvim" -- A GUI library for Neovim plugin developers
    }
    -- https://github.com/ray-x/guihua.lua
    use {
        'ray-x/guihua.lua',
        run = 'cd lua/fzy && make'
    }
    -- Status line
    use "nvim-lualine/lualine.nvim"

    -- 🀀🀄︎🀡 A snazzy bufferline for Neovim 顶部菜单以及窗口栏
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- File Explorer
    use "kyazdani42/nvim-tree.lua"

    -- 启动页面面板
    use 'goolord/alpha-nvim'

    -- The missing UI extensions
    -- 支持自定义右键菜单及顶部菜单栏
    use 'skywind3000/vim-quickui'

    -- A fancy, configurable, notification manager for NeoVim
    use 'rcarriga/nvim-notify'

    -- ⏲️ A Vim plugin for profiling Vim's startup time.
    use 'dstein64/vim-startuptime'

    -- Indent guides for Neovim
    use "lukas-reineke/indent-blankline.nvim"

    -- A calendar application for Vim
    -- use 'itchyny/calendar.vim'

    -- Improve startup time for Neovim
    use 'lewis6991/impatient.nvim'

    -- A faster version of filetype.vim
    -- 用于替代系统自带的 filetype lua 编写
    -- use 'nathom/filetype.nvim'

    -- The undo history visualizer
    -- undo 树 可以查看树结构 undo 列表
    use 'jiaoshijie/undotree'

    -- #################################################################
    --  				Colorscheme
    -- #################################################################
    use 'folke/tokyonight.nvim'
    use 'marko-cerovac/material.nvim'
    use 'ray-x/starry.nvim'

    -- lua Themes
    use "projekt0n/github-nvim-theme"
    -- Clean & Elegant Color Scheme inspired by Atom One and Material
    use 'sainnhe/edge'
    -- High Contrast & Vivid Color Scheme based on Monokai Pro
    -- 全部都是暗色主题
    use 'sainnhe/sonokai'

    -- 直接更改名称即可使用
end)
