-- 自定义文件类型
vim.cmd('au BufNewFile,BufRead *.cu,*.cuh set ft=cpp')
vim.cmd('au BufNewFile,BufRead Dockerfile.* set ft=dockerfile')
vim.cmd('au BufNewFile,BufRead *.ini set ft=dosini')
vim.cmd('au BufNewFile,BufRead *.tsva set ft=tsv')