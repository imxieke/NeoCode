-- 加载 Vim 自定义参数
require "conf/setting"
require "conf/filetype"
require "conf/autocmd"

-- 加载插件
require "conf/plugins"

-- 自定义函数
require "conf/helper"

-- 加载 keymap 快捷键绑定
require 'conf/keymaps'

-- 插件快捷配置
require 'conf/config'
-- 自定义命令行
require "conf/command"

require 'plugins/cmp'

require 'plugins/telescope'

-- 插件配置信息
-- LSP
require 'plugins/treesitter'
require 'plugins/lsp'
require 'plugins/lspkind'
require 'plugins/lspsaga'

-- require 'plugins/coc'

require 'plugins/snippets'
require 'plugins/comment'