-- Load lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git","--branch=main",lazypath,})
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
	"folke/which-key.nvim",
	-- ✅ Highlight, list and search todo comments in your projects
	"folke/todo-comments.nvim",

	-- ################### LSP, Treesitter Completion Coc + CMP #############
    -- Quickstart configs for Nvim LSP
    -- Depends By hrsh7th/nvim-cmp
	'neovim/nvim-lspconfig',
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
	-- language server protocol installer
	-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',

	-- Nvim Treesitter configurations and abstraction layer
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	-- Show code context
	'nvim-treesitter/nvim-treesitter-context',
    -- Refactor module for nvim-treesitter
    "nvim-treesitter/nvim-treesitter-refactor",
    -- Syntax aware text-objects, select, move, swap, and peek support.
    'nvim-treesitter/nvim-treesitter-textobjects',

    -- cmp
    -- A completion plugin for neovim coded in Lua.
    'hrsh7th/nvim-cmp',
    -- nvim-cmp source for path
    -- paths of files and folders
    "hrsh7th/cmp-path",
    -- nvim-cmp source for buffer words
    "hrsh7th/cmp-buffer",
    -- nvim-cmp source for emoji
    "hrsh7th/cmp-emoji",
    -- nvim-cmp source for vim's cmdline
    "hrsh7th/cmp-cmdline",
    -- nvim-cmp source for omnifunc
    -- based on Vim's omnifunc
    -- "hrsh7th/cmp-omni",
    -- nvim-cmp source for math calculation
    "hrsh7th/cmp-calc",

    -- 提供自动提示前面的 icon 可以分辨出是什么软件提供 什么类型 如 function method variable snippet const 等等
    "onsails/lspkind.nvim",

    -- nvim-cmp source for neovim builtin LSP client
    "hrsh7th/cmp-nvim-lsp",
    -- ripgrep source for nvim-cmp
    "lukas-reineke/cmp-rg",
    -- tags completion source for nvim-cmp
    "quangnguyen30192/cmp-nvim-tags",
    -- Universal Ctags source for nvim-cmp.
    "delphinus/cmp-ctags",
    -- cmp source for treesitter
    "ray-x/cmp-treesitter",
    -- TabNine
    {
        "tzachar/cmp-tabnine",
        build = "bash ./install.sh"
    },

	-- Free, ultrafast Copilot alternative for Vim and Neovim
	'Exafunction/codeium.nvim',

    -- Snippets Engine
    -- 常见 Snippets 格式 neosnippet UltiSnips massCode snipmate VSCode
    -- 已经安装 coc-snippets 支持 UltiSnips snipmate VSCode(支持自定义目录) massCode(App Runtime need)
    -- 后缀为 .snip 的为标准 standard snippets
    -- 后缀为 .UltiSnips 的 UltiSnips snippet 关键字
    -- 目录含有 snippets/*.json (prefix body description 关键字) 为 VSCode 格式
	-- 支持 SnipMate VSCode LSP
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	-- follow latest release.
	-- 	-- version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- 	-- install jsregexp (optional!).
	-- 	build = "make install_jsregexp"
	-- },
	-- -- luasnip completion source for nvim-cmp
	-- 'saadparwaiz1/cmp_luasnip',

	-- ############################ Code Analysis ################################
	-- lua GUI lib
	{
		'ray-x/guihua.lua',
		build = 'cd lua/fzy && make'
	},
	-- Code analysis & navigation plugin for Neovim. Navigate codes like a breeze🎐 Exploring LSP and 🌲Treesitter symbols a piece of 🍰 Take control like a boss 🦍
	'ray-x/navigator.lua',
	-- A feature-rich Go development plugin, leveraging gopls, treesitter AST, Dap, and various Go tools to enhance the development experience.
	'ray-x/go.nvim',
	'ray-x/forgit.nvim',
	-- ############################ Search ########################################
    -- Find, Filter, Preview, Pick. All lua, all the time.
    "nvim-telescope/telescope.nvim",
    -- 似乎就是 UI 基础库
    "nvim-telescope/telescope-ui-select.nvim",
    -- Live grep with args 代码搜索
    "nvim-telescope/telescope-live-grep-args.nvim",
    -- A telescope.nvim extension that offers intelligent prioritization when selecting files from your editing history.
    "nvim-telescope/telescope-frecency.nvim",
    -- A history implementation that memorizes prompt input for a specific context
    "nvim-telescope/telescope-smart-history.nvim",
    -- File Browser extension for telescope.nvim
    "nvim-telescope/telescope-file-browser.nvim",
    -- An extension that provides its users with node packages under node_modules directory
    "nvim-telescope/telescope-node-modules.nvim",
	-- navigate, select, and perform actions on results buffer with motions inspired by hop.nvim.
    "nvim-telescope/telescope-hop.nvim",
	-- FZF sorter for telescope written in c
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	},
    -- The Silver Searcher (Ag) functionality similar to that of fzf.vim
    "kelly-lin/telescope-ag",
    -- A Neovim Telescope extension to open your browser bookmarks right from the editor!
    "dhruvmanila/telescope-bookmarks.nvim",
    -- 😃 Emoji Search
    "xiyaowong/telescope-emoji.nvim",
    -- markdown letex asciidoc neorg ReStructuredText vimhelp 等文档的头部标签 如 markdown ##
    "crispgm/telescope-heading.nvim",
    -- An extension for telescope.nvim that allows you to search font glyphs
    "ghassan0/telescope-glyph.nvim",
    -- get ctags outline for telescope.nvim
    "fcying/telescope-ctags-outline.nvim",
    -- Create key-bindings and watch them with telescope 🔭
    "LinArcX/telescope-command-palette.nvim",

	-- ######################### File && Search ######################################
	-- Improved fzf.vim written in lua
	'ibhagwan/fzf-lua',
	-- File Explorer
	'nvim-tree/nvim-tree.lua',


	-- ######################### Utils ######################################
	-- improve the default vim.ui interfaces
    'stevearc/dressing.nvim',
    -- Depends By folke/trouble.nvim option
    'folke/lsp-colors.nvim',
    -- 🌈 creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin LSP client.
    "folke/trouble.nvim",
    -- SQLite/LuaJIT binding for lua and neovim
    -- Depends By nvim-telescope/telescope-frecency.nvim
    "kkharji/sqlite.lua",
	-- A fancy, configurable, notification manager for NeoVim
	'rcarriga/nvim-notify',
    -- 依赖 nerd 字体
    -- Depends By folke/trouble.nvim
	-- lua `fork` of vim-web-devicons for neovim
	'nvim-tree/nvim-web-devicons',
    -- full; complete; entire; absolute; unqualified. All the lua functions
    -- Depends By Telescope nvim-lua/popup.nvim Shatur/neovim-session-manager sudormrfbin/cheatsheet.nvim
    "nvim-lua/plenary.nvim",
    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    -- 似乎还可以提供 snippets 功能 luasnip
    "jose-elias-alvarez/null-ls.nvim",
    -- 💻 Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    -- 自动完成 函数等信息 hover doc
    "folke/neodev.nvim",
	-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    "sindrets/diffview.nvim",
    -- Async Language Server Protocol plugin for vim8 and neovim.
    "prabirshrestha/async.vim",
	-- A code outline window for skimming and quick navigation
	'stevearc/aerial.nvim',
	-- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
	'simrat39/symbols-outline.nvim',

	-- 功能比较简陋不支持按键 需自定义命令或按键 详见 :help litee-filetree.nvim
	-- A framework for building Neovim plugins
	'ldelossa/litee.nvim',
	-- A file explorer implemented with the litee.nvim library.
	'ldelossa/litee-filetree.nvim',
	-- Neovim's missing call hierarchy UI
	'ldelossa/litee-calltree.nvim',
	-- A document outline tool implemented with the litee.nvim library
	'ldelossa/litee-symboltree.nvim',
	-- A litee.nvim backed plugin for saving important places in your code.
	'litee-bookmarks.nvim',
	-- A fully featured GitHub integration for performing code reviews in Neovim.
	'ldelossa/gh.nvim',


	-- Library of 20+ independent Lua modules improving overall Neovim (version 0.5 and higher) experience with minimal effort
    "echasnovski/mini.nvim",

	-- A neovim lua plugin to help easily manage multiple terminal windows
	-- 可用于创建独立浮动窗口 如 vim 中查看 htop
    "akinsho/toggleterm.nvim",

    -- Pop-up menu for code actions to show meta-information and diff preview
    -- 为错误代码提供快速修复解决方案 并支持修复前后对比diff
    'weilbith/nvim-code-action-menu',

	-- Icon Picker
	-- pick Nerd Font Icons, Symbols & Emojis
    "ziontee113/icon-picker.nvim",
	-- A powerful Neovim plugin that lets users choose & modify RGB/HSL/HEX colors.
	'ziontee113/color-picker.nvim',
	-- create your own "minimap" from Treesitter Queries or Vim Regex.
	'ziontee113/neo-minimap',
	-- LSP signature hint as you type
	'ray-x/lsp_signature.nvim',
	-- A format runner for Neovim.
	'mhartington/formatter.nvim',
	-- magit for neovim
	'NeogitOrg/neogit',
	-- Visual git plugin for Neovim
	'tanvirtin/vgit.nvim',

	-- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
	-- 提供快速注释的能力
    "numToStr/Comment.nvim",
    -- The undo history visualizer
    -- undo 树 可以查看树结构 undo 列表
    "jiaoshijie/undotree",
	-- improve neovim lsp experience
    "nvimdev/lspsaga.nvim",
	-- auto remove search highlight and rehighlight when using n or N
	{
		'nvimdev/hlsearch.nvim',
		event = 'BufRead'
	},
	-- A super powerful autopair plugin for Neovim that supports multiple characters.
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},

	-- ######################### UI #########################################
	-- a lua powered greeter like vim-startify / dashboard-nvim
	'goolord/alpha-nvim',
	-- Status Line
	"nvim-lualine/lualine.nvim",
	-- A snazzy bufferline for Neovim
	-- 顶部菜单以及窗口栏顶部菜单以及窗口栏
	"akinsho/bufferline.nvim",
    -- The missing UI extensions
    -- 支持自定义右键菜单及顶部菜单栏 
	-- TODO Vimscript 编写的 待替换
	'skywind3000/vim-quickui',

	-- ####################### Colorscheme ############################################
	-- 🏙 A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.
	'folke/tokyonight.nvim',
	-- A pack of modern nvim color schemes: material, moonlight, Dracula (blood), Monokai, Mariana, Emerald, earlysummer, middlenight_blue... Fully support Treesitter, LSP and a variety of plugins.
	'ray-x/starry.nvim',
	-- Indent guides for Neovim 方法 函数 循环等开始结束对齐
	'lukas-reineke/indent-blankline.nvim',
	-- A high-performance color highlighter (CSS 颜色代码高亮)
	'norcalli/nvim-colorizer.lua',
	-- Github's Neovim themes
	'projekt0n/github-nvim-theme',
	-- 🔱 Material colorscheme for NeoVim written in Lua with built-in support for native LSP, TreeSitter and many more plugins
	'marko-cerovac/material.nvim',
	-- A dark neovim colorscheme written in lua
	'glepnir/zephyr-nvim'
})