-- 自定义文件类型
vim.cmd('au BufNewFile,BufRead *.cu,*.cuh setf cpp')
vim.cmd('au BufNewFile,BufRead Dockerfile.* setf dockerfile')
vim.cmd('au BufNewFile,BufRead *.ini setf dosini')
vim.cmd('au BufNewFile,BufRead *.tsva setf tsv')
vim.cmd('au BufNewFile,BufRead .htaccess,*/etc/httpd/*.conf setf apache')
vim.cmd('au BufNewFile,BufRead */etc/apache2/sites-*/*. setf apache')
vim.cmd('au BufNewFile,BufRead *.cxx,*.c++,*.hh,*.hxx,*.hpp,*.ipp,*.moc,*.tcc,*.inl setf cpp')