-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
-- Color table for highlights
-- stylua: ignore
local colors = {
	bg       = '#202328',
	fg       = '#bbc2cf',
	yellow   = '#ECBE7B',
	cyan     = '#008080',
	darkblue = '#081633',
	green    = '#98be65',
	orange   = '#FF8800',
	violet   = '#a9a1e1',
	magenta  = '#c678dd',
	blue     = '#51afef',
	red      = '#ec5f67',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand('%:p:h')
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
-- Available components
-- branch (git branch)
-- buffers (shows currently available buffers)
-- diagnostics (diagnostics count from your preferred source)
-- diff (git diff status)
-- encoding (file encoding)
-- fileformat (file format)
-- filename
-- filesize
-- filetype
-- hostname
-- location (location in file in line:column format)
-- mode (vim mode)
-- progress (%progress in file)
-- tabs (shows currently available tabs)
-- windows (shows currently available windows)
local config = {
	options = {
		-- Disable sections and component separators
		-- component_separators = '|',
		component_separators = '',
		-- section_separators = { left = '', right = '' },
		-- section_separators = {},
		-- component_separators = { left = '|', right = '|' },
		-- component_separators = { left = '>', right = '<' },
		section_separators = { left = '', right = '' },
		-- theme = 'edge'
		theme = 'sonokai'
		-- theme = {
		-- 	-- We are going to use lualine_c an lualine_x as left and
		-- 	-- right section. Both are highlighted by c theme .  So we
		-- 	-- are just setting default looks o statusline
		-- 	normal = { c = { fg = colors.fg, bg = colors.bg } },
		-- 	inactive = { c = { fg = colors.fg, bg = colors.bg } },
		-- },
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left {
	function()
		return ''
	end,
	color = { fg = colors.black }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
	-- mode component
	function()
		return ''
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[''] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[''] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			['r?'] = colors.cyan,
			['!'] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()] }
	end,
	padding = { right = 1 },
}

ins_left {
	-- filesize component
	'mode',
	cond = conditions.buffer_not_empty,
}

ins_left {
	'branch',
	icon = '',
	color = { fg = colors.violet, gui = 'bold' },
}

ins_left {
	'b:gitsigns_head',
	icon = ''
}

ins_left {
	'diff',
	-- Is it me or the symbol for modified us really weird
	symbols = { added = ' ', modified = '柳 ', removed = ' ' },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
}

ins_left {
	'diagnostics',
	-- sources = { 'nvim_diagnostic', 'coc', 'nvim_lsp' },
	sources = { 'nvim_diagnostic', 'nvim_lsp' },
	-- sources = { 'coc' },
	-- sources = { 'nvim_lsp' },
	-- sources = { 'nvim_diagnostic' },
	-- Displays diagnostics for the defined severity types
	sections = { 'error', 'warn', 'info', 'hint' },
	symbols = { error = ' ', warn = ' ', info = ' ' },
	colored = true, -- Displays diagnostics status in color if set to true.
	update_in_insert = false, -- Update diagnostics in insert mode.
	always_visible = false, -- Show diagnostics even if there are none.
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan }
	},
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
	function()
		return '%='
	end,
}

-- ins_left {
-- 	-- Lsp server name .
-- 	function()
-- 		local msg = 'No Active Lsp'
-- 		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
-- 		local clients = vim.lsp.get_active_clients()
-- 		if next(clients) == nil then
-- 			return msg
-- 		end
-- 		for _, client in ipairs(clients) do
-- 			local filetypes = client.config.filetypes
-- 			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- 				return client.name
-- 			end
-- 		end
-- 		return msg
-- 	end,
-- 	icon = ' LSP:',
-- 	color = { fg = '#ffffff', gui = 'bold' },
-- }

-- Add components to right sections
ins_right {
	'o:encoding', -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = { fg = colors.green, gui = 'bold' },
}

ins_right {
	'filename',
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = 'bold' },
}
ins_right {
	'filetype',
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = 'bold' },
}

ins_right { 'location' }
-- TODO: 没看到显示的什么
-- ins_right { 'aerial' }

ins_right { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_right {
	-- filesize component
	'filesize',
	cond = conditions.buffer_not_empty,
}
ins_right {
	'fileformat',
	fmt = string.upper,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	color = { fg = colors.red, gui = 'bold' },
}

ins_right {
	function()
		return ''
	end,
	color = { fg = colors.black },
	padding = { left = 1 },
}

-- Now don't forget to initialize lualine
require('lualine').setup(config)

-- require('lualine').setup {
-- 	options = {
-- 		icons_enabled = true,
-- 		theme = 'auto',
-- 		-- theme = 'material',
-- 		component_separators = { left = '', right = '' },
-- 		section_separators = { left = '', right = '' },
-- 		disabled_filetypes = {},
-- 		always_divide_middle = true,
-- 		globalstatus = false,
-- 	},
-- 	sections = {
-- 		lualine_a = {
-- 			'diff',
-- 			-- colored  = true, -- Displays a colored diff status if set to true
-- 			-- Same color values as the general color option can be used here.
-- 			-- diff_color = {},
-- 			added    = 'DiffAdd', -- Changes the diff's added color
-- 			modified = 'DiffChange', -- Changes the diff's modified color
-- 			removed  = 'DiffDelete', -- Changes the diff's removed color you
-- 			--   },
-- 			symbols  = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
-- 			-- source  = nil, -- A function that works as a data source for diff.
-- 			-- It must return a table as such:
-- 			--   { added = add_count, modified = modified_count, removed = removed_count }
-- 			-- or nil on failure. count <= 0 won't be displayed.
-- 		},
-- 		-- 如果使用函数不用添加 引号 不支持直接使用文字作为内容
-- 		lualine_b = { 'mode', 'branch', 'filesize' },
-- 		lualine_c = { 'filetype' },
-- 		lualine_x = { 'fileformat' },
-- 		lualine_y = { 'encoding', 'progress', 'filesize' },
-- 		lualine_z = { 'location' }
-- 	},
-- 	-- 不知道干嘛的没生效
-- 	inactive_sections = {
-- 		lualine_a = {},
-- 		lualine_b = {},
-- 		lualine_c = {},
-- 		lualine_x = {},
-- 		lualine_y = {},
-- 		lualine_z = {}
-- 	},
-- 	tabline = {},
-- 	extensions = {}
-- }
