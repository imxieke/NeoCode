-- ================================================================
-- 	              通用设置
-- ================================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local home = os.getenv("HOME")
local pwd = os.getenv("PWD")
local opt = vim.opt
local o = vim.o
local g = vim.g


vim.cmd('syntax on') -- enable syntax  highlighting
vim.cmd('filetype plugin indent on') -- 开启文件类型侦测 根据侦测到的不同类型加载对应的插件
vim.cmd('filetype detect') -- detect the file type again

-- vim.g.mapleader      = '\\'
opt.number = true  			-- show line numbers
vim.o.numberwidth = 2
opt.relativenumber = false   	-- show relative line numbers 行数会跟着上下移动变化
-- 编码
opt.encoding = 'utf-8' -- 文件编码
opt.fileencoding = 'utf-8' -- 制表符占用空格数

-- Indenting
-- 将制表符扩展为空格
opt.expandtab = true
opt.tabstop = 4
-- 让 vim 把连续数量的空格视为一个制表符
opt.softtabstop = 4
-- 格式化时制表符占用空格数
opt.shiftwidth = 4
opt.showmatch = true -- 高亮匹配括号
opt.title = false -- tab title as file name
-- Enable persistent undo
opt.undofile = true
opt.emoji = true -- enable emoji
opt.autoread = true -- 文件自动更新
opt.clipboard="unnamed" -- Clipboard Support
opt.hlsearch = true -- highlight text while searching
-- TODO: 帮助文档语言 似乎对 neovim 无效 也许是文档缺失 待确认
opt.helplang = 'cn'
opt.hidden = false -- Allow switching from unsaved buffer
opt.wrap = false -- 自动折行
opt.modeline = true -- Allow modeline
-- opt.lazyredraw = true -- Use lazy redraw
opt.smartindent = true -- 智能缩进
opt.autoindent = true -- 自动缩进
opt.smarttab = true -- Make tabbing smarter
opt.foldenable = true -- 文件折叠
opt.history = 1000 -- 保留历史记录的存储数量
opt.smartcase = true -- 有一个或以上大写字母时仍大小写敏感
opt.ignorecase = true -- 搜索忽略大小写
opt.incsearch = true -- Show search results while typing 开启增量搜索
opt.showcmd = true
vim.cmd('set nocompatible') -- 禁用vi兼容模式
-- vim.cmd('set nobackup') -- 设置取消备份 禁止临时文件生成
opt.backup = false
vim.cmd('set nowritebackup') -- 设置取消备份 禁止临时文件生成
opt.writebackup = false
-- opt.noswapfile=true
vim.cmd('set noswapfile') -- no swap file generate
-- opt.modeline     = true
opt.list = true -- 显示不可见字符 如 tab
-- vim.g.nolist         = true 		-- 显示不可见字符 如 tab
-- vim.cmd('set nolist')
opt.mouse = "a" -- enable mouse interaction
opt.modifiable = true
-- 似乎是自动更新文件时间间隔 ms
opt.updatetime = 120
opt.wildmenu = true -- vim命令自动补全
-- 自动补全 cmp 依赖
opt.completeopt = {'menu', 'menuone', 'noselect'}

-- =================== UI ====================================================
opt.laststatus = 2 -- Always show statusline
opt.showtabline = 2 -- Always show tabline
opt.termguicolors = true -- enable true colors support
opt.cursorline = true -- 突出显示当前行
opt.cursorcolumn = false -- 突出显示当前列
opt.ruler = true -- 显示光标位置
opt.signcolumn = 'yes' -- Always show signcolumn or it would frequently shift, make signcolumn background color transparent
opt.pumheight = 10 -- Make popup menu smaller
-- opt.splitbelow    = true 	-- Horizontal splits will be below
opt.splitright    = true 	-- Vertical splits will be to the right
-- opt.conceallevel  = 0 		-- Don't hide (conceal) special symbols (like `` in markdown)
-- opt.colorcolumn   = '+1' 	-- Draw colored column one step to the right of desired maximum width
-- opt.linebreak     = true 	-- Wrap long lines at 'breakat' (if 'wrap' is set)
-- opt.shortmess     = 'aoOFc' -- Disable certain messages from |ins-completion-menu|
opt.showmode      = false 	-- Don't show mode in command line

-- vim.cmd('set t_Co=256') -- 指定配色方案为256

-- =====================Other==================================================
-- 禁止自动检测 Python 路径 速度太慢, 手动指定路径
-- vim.g.python3_host_skip_check = false
-- vim.g.python2_host_skip_check = false
-- vim.g.python3_host_prog = vim.fn.expand('/usr/local/bin/python3' or '/usr/bin/python3')
-- vim.g.python2_host_prog = vim.fn.expand('/usr/bin/python2')
-- vim.g.node_host_prog = vim.fn.expand('/usr/local/bin/node' or '/usr/bin/node')

-- vim.cmd("set omnifunc=lsp#completion#OmniFunc")

-- Set Background Colorscheme
-- 主题的参数需要放在前面否则无法生效
-- vim.cmd("set background=light")
vim.cmd("set background=dark")

-- vim.cmd 'colorscheme material'

-- Material Colors
-- vim.g.material_style = "deep ocean"
-- vim.g.material_style = "palenight"
-- vim.g.material_style = "darker"
-- vim.g.material_style = "lighter"
-- vim.g.material_style = "oceanic"

-- 感兴趣的 one
-- 自带主题 暗色透明
-- vim.cmd('colorscheme default')
-- 需要配合插件使用  含有 lua 插件需启用
-- vim.cmd('colorscheme material')
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme tokyonight-storm")
-- vim.cmd("colorscheme tokyonight-day")
-- vim.cmd('colorscheme blue')
-- vim.cmd("colorscheme sick")
-- vim.cmd("colorscheme sick-light")
-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme gruvbox-material")

-- vim.g.aurora_italic = 1     -- italic
-- vim.g.aurora_transparent = 1     -- transparent
-- vim.g.aurora_bold = 1     -- bold
-- vim.g.aurora_darker = 1     -- darker background
-- vim.cmd "colorscheme aurora"
-- vim.cmd 'colorscheme monokai'
-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme dogrun")
-- vim.cmd("colorscheme one")

-- default neon aura
-- vim.g.edge_style = 'default'
-- vim.cmd("colorscheme edge")

-- default a𝐭𝐥𝐚𝐧𝐭𝐢𝐬 a𝐧𝐝𝐫𝐨𝐦𝐞𝐝𝐚 s𝐡𝐮𝐬𝐢𝐚 m𝐚𝐢𝐚 e𝐬𝐩𝐫𝐞𝐬𝐬𝐨
-- vim.g.sonokai_style = 'andromeda'
-- vim.g.sonokai_better_performance = 1
-- vim.cmd("colorscheme sonokai")
-- 就是白色 还好
-- vim.cmd("colorscheme intellij")
-- 颜色挺好就是背景色不好看
-- vim.cmd("colorscheme aylin")
-- vim.cmd("colorscheme oceanic_material")
-- vim.cmd("colorscheme toast")

-- vim.cmd("colorscheme github_light")

-- 背景透明
-- ctermbg=none guibg=none`
-- ctermfg (for setting the foreground)
-- ctermbg (for setting the background)
-- cterm (for additional properties)
-- guifg (for setting the foreground)
-- guibg (for setting the background)
-- gui (for additional properties)

-- vim.cmd "highlight NonText guibg=NONE ctermbg=None"
-- vim.cmd 'highlight NonText ctermbg=NONE guibg=NONE' -- 背景透明
-- vim.cmd 'highlight String ctermbg=NONE guibg=NONE' -- 背景透明
-- vim.cmd "highlight String guibg=NONE ctermbg=None" -- remove background
-- vim.cmd "highlight Normal guibg=NONE ctermbg=None" -- "remove background
-- vim.cmd 'highlight Normal ctermfg=256 ctermbg=none'

-- vim.cmd("highlight Comment ctermfg=green guifg=green")

-- Speed up loading since 0.9
-- vim.loader.enable()
-- customize highlight
vim.api.nvim_set_hl(0, '@string', {fg='#59E343'})
vim.api.nvim_set_hl(0, '@field', {fg='#f93393'})
vim.api.nvim_set_hl(0, '@number', {fg='#e933e3'})