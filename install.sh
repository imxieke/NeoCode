#!/usr/bin/env bash

install(){
	if [ ! -d $HOME/.config/nvim ] || [ ! -d $HOME/.config/nvim ] || [ ! -f /bin/nvim ]; then
		mkdir -p $HOME/.config && git clone https://github.com/imxieke/XieVim.git $HOME/.config/nvim
		echo "Create ${HOME}/.vim"
		ln -s $HOME/.config/nvim $HOME/.vim
		echo "Create Vimrc"
		ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc
		echo "Create shortcut"
      	ln -s $HOME/.config/nvim/bin/nvim /bin/nvim && chmod +x /bin/nvim
		echo "Installed Success"
	else
		echo " Already Installed"
	fi
}

uninstall(){
	
		read -p "Do you sure to uninstall neovim? the action can't restore. enter : y/n   " action

		if [ ! ${action} == "y" ];then
				echo "Cancel Uninstall success"
				exit
		fi

		if [ -d $HOME/.config/nvim ]; then
  	  			rm -fr $HOME/.config/nvim
  	  			rm -fr $HOME/.vim
  	  			rm -fr $HOME/.vimrc
				rm -fr /bin/nvim
		 fi

     if [ ! -f /bin/nvim ]; then
	 	echo "$HOME/.config/nvim is remove "
	 	echo "/bin/nvim is remove "
        echo "Neovim Already uninstall"
     fi
}

case $1 in

	install ) 
		install
		;;

	uninstall )
		uninstall
		;;

	* )
		echo "Usage: install or unstall to using"
		;;

esac
