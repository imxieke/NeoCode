#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-03 08:33:37
 # @LastEditTime: 2023-05-17 00:06:09
 # @LastEditors: Cloudflying
 # @Description: 
 # @FilePath: /nvim/init.sh
### 

# 使用绝对路径

# if [[ ! -f "/Users/imxieke/.local/share/nvim/databases/telescope_history.sqlite3" ]]; then
	# mkdir -p /Users/imxieke/.local/share/nvim/databases
	# touch /Users/imxieke/.local/share/nvim/databases/telescope_history.sqlite3
# fi

if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi