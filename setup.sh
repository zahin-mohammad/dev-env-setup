cd $HOME

# FLAGS
iAll=false;
iUtil=false;
iDev=false;
iSocial=false;
if [ "$#" -gt "1" ]; then
	for arg in $@; do
		if [ "$arg" == "--all" || "$arg" == "--ALL" ]; then
			iAll=true
		fi
		if [ "$arg" == "--util" || "$arg" == "--UTIL" ]; then
			iUtil=true		
		fi
		if [ "$arg" == "--dev" || "$arg" == "--DEV" ]; then
			iDev =true
		fi
		if ["$arg" == "--social" || "$arg" == "--SOCIAL" ]; then
			iSocial=true
		fi
	done
else
	iAll=true
fi

sudo apt-get update && sudo apt-get upgrade

install_util() {
	echo "\e[45m Installing snap and snapd \e[0m"
	sudo apt-get install snap && sudo apt-get install snapd
	echo "\e[45m Installing pdftx \e[0m"
	sudo snap install pdftk
	echo "\e[45m Installing curl \e[0m"
	sudo apt-get install curl

}

install_dev() {
	echo "\e[45m Making a ~/Dev folder \e[0m"
	mkdir ~/Dev
	echo "\e[45m Installing git \e[0m"
	sudo apt-get install git
	echo "\e[45m Installing snap and snapd \e[0m"
	sudo apt-get install snap && sudo apt-get install snapd
	echo "\e[45m Installing zsh \e[0m"
	
	echo "\e[45m Installing tmux \e[0m"
	sudo apt-get install tmux

	echo "\e[45m Makeing vim look better \e[0m"
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_basic_vimrc.sh

	echo "\e[45m Makeing tmux look better \e[0m"
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .

	echo "\e[45m Installing IntelliJ ultimate \e[0m"
	sudo snap install intellij-idea-ultimate --classic

	echo "\e[45m Installing VS Code \e[0m"
	sudo snap install code --classic
	
	sudo apt install zsh
	echo "\e[45m changing default shell to zsh \e[0m"
	sudo chsh -s /usr/bin/zsh root
	sudo chsh -s /usr/bin/zsh $USER
	echo "\e[45m Installing oh-my-zsh \e[0m"
	# Install oh-my-zsh via curl
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	echo "\e[45m Installing zsh-autosuggestions \e[0m"
	# Install zsh-autosuggestions (not via oh-my-zsh)
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	echo "source ${(q-)PWD}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc


	echo "\e[45m Installing zsh-syntax-highlighting \e[0m"
	# Install zsh-syntax-highlighting (not via oh-my-zsh)
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
	echo "source ${(q-)PWD}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
}

install_social() {
	echo "\e[45m  Not Implemented \e[0m"

}



if [ $iUtil || $iAll ]; then
	install_util;
fi

if [ $iDev || $iAll ]; then
	install_dev;
fi

if [ $iSocial || $iAll ]; then
	install_social;
fi













echo "\e[101m Please restart! \e[0m"
