-- 初始化脚本 如某些依赖
-- os.execute("bash /Users/imxieke/.config/nvim/init.sh")

-- 加载 Vim 自定义参数
require 'core/setting'
-- 加载插件
require 'core/plugins'
-- 插件配置
require 'core/config'
-- 加载 keymap 快捷键绑定
require 'core/keymaps'
-- 自定义命令行
require "core/command"
require "core/autocmd"

-- 插件配置信息
-- LSP
require 'plugins/treesitter'
require 'plugins/lsp'
require 'plugins/lspkind'
require 'plugins/lspsaga'
require 'plugins/cmp'

-- 延迟 60ms+
require 'plugins/telescope'
require 'plugins/trouble'
require 'plugins/cheatsheet'
require 'plugins/syntax_tree_surfer'
require 'plugins/undotree'
require 'plugins/aerial'
require 'plugins/indent_blankline'

require 'plugins/snippets'
require 'plugins/comment'

-- UI
-- Statusline
require 'plugins/lualine'
require 'plugins/nvimtree'
require 'plugins/alpha_dashboard'
require 'plugins/web_icons'

require 'plugins/terminal'
require 'plugins/session'
require 'plugins/notify'
require 'plugins/todo'
require 'plugins/filetype'
require 'plugins/lsp_installer'
require 'plugins/bufferline'

require 'plugins/symbols_outline'
-- require 'plugins/buddly'
-- require 'plugins/dashboard'
-- require 'plugins/neogit'
-- require 'plugins/vgit'
