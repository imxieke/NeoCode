-- ft 指定打开文件类型才加载
return require('packer').startup(function(use)
    -- #################################################################
    --  		 	 Features
    -- #################################################################

    -- An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
    -- Depends By sudormrfbin/cheatsheet.nvim
    -- use "nvim-lua/popup.nvim"

    -- FZF sorter for telescope written in c
    -- use {
    --     'nvim-telescope/telescope-fzf-native.nvim',
    --     run = 'make'
    -- }

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

    -- experimental quick picker for vim 快速选择选项
    -- 似乎没什么用 待测试
    -- use 'prabirshrestha/quickpick.vim'
    -- filetype picker for quickpick.vim
    -- :Pfiletypes
    -- use 'prabirshrestha/quickpick-filetypes.vim'
    -- 快速选择并预览主题
    -- :Pcolorschemes
    -- use 'prabirshrestha/quickpick-colorschemes.vim'

    -- A plugin for Neovim that helps you surf through your document and move elements around using the nvim-treesitter API.
    -- 提供对代码进行移动 复制 多行操作 等行为
    -- use "ziontee113/syntax-tree-surfer"
    -- A small Neovim plugin for previewing definitions using floating windows.
    -- vscode-like pictograms for neovim lsp completion items

    -- EditorConfig plugin for Vim
    -- use "editorconfig/editorconfig-vim"
    -- Library of 20+ independent Lua modules improving overall Neovim (version 0.5 and higher) experience with minimal effort

    -- #################################################################
    -- 			   LSP, Treesitter Completion Coc + CMP
    -- #################################################################

    -- treesitter An incremental parsing system for programming tools
    -- 语法解析

    -- Original popup completion menu framework library
    -- 待删除
    use 'Shougo/pum.vim'

    -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
    use 'glepnir/lspsaga.nvim'


    -- nvim-cmp source for nvim lua
    -- You can get the vim.lsp.util.* API with this source
    -- use {
    -- "hrsh7th/cmp-nvim-lua",
    -- ft = "lua"
    -- }

    -- Neovim lua API for highly extensible popup window
    -- Depends By RishabhRD/nvim-lsputils
    use {
        "RishabhRD/popfix",
        run = "sh ./install_fzy_native_sorter"
    }
    -- Better defaults for nvim-lsp actions
    use "RishabhRD/nvim-lsputils"


    -- use {
	-- 	'xiyaowong/coc-code-action-menu.nvim',
    --     after = 'coc.nvim'
    -- }

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
    -- use "preservim/vim-markdown"
    -- nginx vim syntax highlighting
    -- use "chr4/nginx.vim"
    -- Docker Syntax highlighting
    -- use "danishprakash/vim-docker"

    -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
    -- CSS HTML 颜色代码高亮
    use "norcalli/nvim-colorizer.lua"


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

    -- 启动页面面板
    use 'goolord/alpha-nvim'

    -- The missing UI extensions
    -- 支持自定义右键菜单及顶部菜单栏
    use 'skywind3000/vim-quickui'

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


    -- #################################################################
    --  				Colorscheme
    -- #################################################################

    -- Clean & Elegant Color Scheme inspired by Atom One and Material
    use 'sainnhe/edge'
    -- High Contrast & Vivid Color Scheme based on Monokai Pro
    -- 全部都是暗色主题
    use 'sainnhe/sonokai'

    -- 直接更改名称即可使用
end)
