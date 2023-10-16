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
	-- ######################### UI #########################################
	-- Status Line
	"nvim-lualine/lualine.nvim",

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
	-- {'nvim-treesitter/nvim-treesitter', cmd = ':TSUpdate'},
	{'nvim-treesitter/nvim-treesitter'},
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
    -- "hrsh7th/cmp-nvim-lsp",
    -- ripgrep source for nvim-cmp
    "lukas-reineke/cmp-rg",
    -- tags completion source for nvim-cmp
    "quangnguyen30192/cmp-nvim-tags",
    -- Universal Ctags source for nvim-cmp.
    "delphinus/cmp-ctags",
    -- cmp source for treesitter
    "ray-x/cmp-treesitter",
    -- TabNine plugin for hrsh7th/nvim-cmp
    {
        "tzachar/cmp-tabnine",
        build = "bash ./install.sh"
    },

	-- Free, ultrafast Copilot alternative for Vim and Neovim
	'jcdickinson/codeium.nvim',

    -- Snippets Engine
    -- 常见 Snippets 格式 neosnippet UltiSnips massCode snipmate VSCode
    -- 已经安装 coc-snippets 支持 UltiSnips snipmate VSCode(支持自定义目录) massCode(App Runtime need)
    -- 后缀为 .snip 的为标准 standard snippets
    -- 后缀为 .UltiSnips 的 UltiSnips snippet 关键字
    -- 目录含有 snippets/*.json (prefix body description 关键字) 为 VSCode 格式
	-- 支持 SnipMate VSCode LSP
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	-- luasnip completion source for nvim-cmp
	'saadparwaiz1/cmp_luasnip',

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

	-- ######################### Utils ######################################
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
	'kyazdani42/nvim-web-devicons',
    -- full; complete; entire; absolute; unqualified. All the lua functions
    -- Depends By Telescope nvim-lua/popup.nvim Shatur/neovim-session-manager sudormrfbin/cheatsheet.nvim
    "nvim-lua/plenary.nvim",
	-- Library of 20+ independent Lua modules improving overall Neovim (version 0.5 and higher) experience with minimal effort
    "echasnovski/mini.nvim"
})