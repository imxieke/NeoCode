#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-03 08:33:37
 # @LastEditTime: 2023-10-19 00:10:14
 # @LastEditors: Cloudflying
 # @Description: 
 # @FilePath: /nvim/init.sh
### 

# 使用绝对路径

if [[ ! -f "${HOME}/.local/share/nvim/databases/telescope_history.sqlite3" ]]; then
	mkdir -p "${HOME}/.local/share/nvim/databases"
	touch "${HOME}/.local/share/nvim/databases/telescope_history.sqlite3"
fi

# if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
# 	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
#  		~/.local/share/nvim/site/pack/packer/start/packer.nvim
# fi

# if [[ "$(uname -s)" == 'Darwin' ]]; then
# elif [[ "$(uname -s)" == 'Linux' ]]; then	
# fi

if [[ ! -d "${HOME}/.local/share/nvim/lazy/lazy.nvim" ]]; then
	git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=main "${HOME}/.local/share/nvim/lazy/lazy.nvim"
fi	
