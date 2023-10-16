-- lukas-reineke/indent-blankline.nvim
-- 定义标签闭合高亮向导
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- 空格或是tab 键颜色
-- vim.cmd [[highlight IndentBlanklineIndent7 guibg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent9 guibg=#1a1a1a gui=nocombine]]

require("indent_blankline").setup {
	space_char_blankline = " ",
	show_end_of_line = true,
	-- 似乎是函数体高亮显示
	show_current_context = true,
	show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
	-- space_char_highlight_list = {
	-- "IndentBlanklineIndent7",
	-- "IndentBlanklineIndent8",
	-- },
	show_trailing_blankline_indent = false,
}
