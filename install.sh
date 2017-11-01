#!/usr/bin/env bash

install(){
	if [ ! -d $HOME/.config/nvim ]; then
		  mkdir -p $HOME/.config && git clone https://github.com/imxieke/XieVim.git $HOME/.config/nvim
      ln -s $HOME/.config/nvim/bin/nvim /bin/nvim && chmod +x /bin/nvim
	fi

	if [ -f /bin/nvim ]; then

		echo "Neovim Already Install"
	fi
}

uninstall(){
			
		read -p "Do you sure to uninstall neovim? the action can't restore. type: y/n   " action
		
		if [ ! ${action} == "y" ];then
				echo "Cancel Uninstall success"
				exit
		fi

		if [ -d $HOME/.config/nvim ]; then                                                                   
  	  			rm -fr $HOME/.config/nvim
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