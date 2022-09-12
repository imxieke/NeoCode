#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-09-03 08:33:37
 # @LastEditTime: 2022-09-03 09:16:52
 # @LastEditors: Cloudflying
 # @Description: 
 # @FilePath: /nvim/init.sh
### 

# 使用绝对路径

if [[ ! -f "/Users/imxieke/.local/share/nvim/databases/telescope_history.sqlite3" ]]; then
	mkdir -p /Users/imxieke/.local/share/nvim/databases
	touch /Users/imxieke/.local/share/nvim/databases/telescope_history.sqlite3
fi

for