-- event
-- VimEnter 进入 Vim
-- BufNewFile
-- BufRead

-- example
-- vim.api.nvim_create_autocmd({ {event} }, {
-- 	pattern = { "*.php" },
-- 	command = ""
-- })

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- pattern = { "*.c", "*.h" },
-- pattern = {},
-- command = "echo 'Vim Enter'",
-- })

-- local function autocmd(event, cmd, pattern)
-- 	if pattern == nil then
-- 		pattern = {}
-- 	end

-- 	vim.api.nvim_create_autocmd(event, {
-- 		pattern = pattern,
-- 		command = cmd,
-- 	})
-- end

-- 不知道啥问题 有空学一下 lua 撸啊吧
-- local function set_nvim_filetype(pattern, type)
-- 	local cmd = "autocmd BufNewFile,BufRead " .. pattern .. " :setl ft=" .. type
-- 	vim.cmd(cmd)
-- end

-- vim.cmd("autocmd BufEnter,FileType,BufRead,BufNewFile *.abc :setl ft=bash")
-- vim.cmd("autocmd BufEnter,FileType,BufRead,BufNewFile Dockerfile.* :setl ft=dockerfile")
-- vim.cmd("autocmd BufEnter,FileType,BufRead,BufNewFile nginx.conf :setl ft=nginx")
