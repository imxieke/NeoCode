-- sh html c 等后缀文件会报错 而且在新版并没有什么卵用 滚犊子吧

-- https://github.com/nathom/filetype.nvim
-- Do not source the default filetype.vim
-- 如果使用早于 0.6.0 的 Neovim 版本，请解除注释以下内容
-- vim.g.did_load_filetypes = 1

require("filetype").setup({
	overrides = {
		extensions = {
			-- Set the filetype of *.pn files to potion
			pn = "potion",
			-- macOS Property list 
			plist = "xml"
		},
		literal = {
			-- Set the filetype of files named "MyBackupFile" to lua
			MyBackupFile = "lua",
		},
		complex = {
			-- Set the filetype of any full filename matching the regex to gitconfig
			[".*git/config"] = "gitconfig", -- Included in the plugin
		},

		-- The same as the ones above except the keys map to functions
		function_extensions = {
			["cpp"] = function()
				vim.bo.filetype = "cpp"
				-- Remove annoying indent jumping
				vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
			end,
			["pdf"] = function()
				vim.bo.filetype = "pdf"
				-- Open in PDF viewer (Skim.app) automatically
				vim.fn.jobstart(
					"open -a skim " .. '"' .. vim.fn.expand("%") .. '"'
				)
			end,
		},
		function_literal = {
			Brewfile = function()
				vim.cmd("syntax off")
			end,
		},
		function_complex = {
			["*.math_notes/%w+"] = function()
				vim.cmd("iabbrev $ $$")
			end,
		}
		-- shebang = {
		-- 	-- Set the filetype of files with a dash shebang to sh
		-- 	dash = "sh",
		-- },
	},
})
